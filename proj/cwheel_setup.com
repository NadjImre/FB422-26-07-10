//M(WheelSetup)
;FB290
;april 2020

DEF PROFIL = (I/* 0=$89191,1=$89192/0/,$89832,,/WR2///255,,200/435,,120)

DEF BOK1 = (R1/-10,210/0/,$89127,"H",$89068////255,,200/435,,120//"POMOC.HTML","9409")
DEF UGAO1 = (R1/-20,20/0/,$89126,"A",$89072////255,,200/435,,120//"POMOC.HTML","9410")
DEF DUB1 = (R1/0,2/0/,$89126,"K",$89068////255,,200/435,,120//"POMOC.HTML","9410")
DEF FAZETA1 = (R1/0,30/0/,$89128,"F",$89068////255,,200/435,,120//"POMOC.HTML","9411")
DEF RADIUS1 = (R2/-150,150/0/,$89129,"R",$89068////255,,200/435,,120//"POMOC.HTML","9412")

DEF DUZKON1 = (R1/0,100/0/,$89195,"L",$89068////255,,200/435,,120//"POMOC.HTML","9413")
DEF UGAOKON1 = (R4/-45,45/0/,$89196,"B",$89072////255,,200/435,,120//"POMOC.HTML","9414")

DEF KONUSX = (R3/-1,1/0/,$89460,"Xk",$89068/wr4///255,,200/435,,120//"POMOC.HTML","9414")
DEF KONUSZ = (R3/-1,1/0/,,"Zk",$89068/Wr4///255,,200/435,,120//"POMOC.HTML","9414")
DEF Ugao = (R2/0,45/0/,$89453,"G",$89072/WR2///255,,200/435,,120//"POMOC.HTML","9307")
DEF PODHODX = (R1/0,50/3/,$89058,"AX",$89068////255,,200/435,,120)
DEF PODHODZ = (R1/0,50/5/,,"AZ",$89068////255,,200/435,,120)
Def Alat = (S///,,,/Wr1///255,,200/435,,120)
Def BrojAlata = (I//1/,,"","."/wr4///255,,200/435,,120)

DEF Graph = (W///,"slesgraphcustomwidget.SlEsGraphCustomWidget"/////0,0,250,360/0,0,0,0)
DEF Slika = (I///,,,/wr1///0,0,250,360/0,320,25,2) 

DEF BrojSlike=(I////wr4)

VS1=("Prethodni%nalat",,se1)
VS2=("Sledeći%nalat",,se1)
VS5=("Grafika",,SE2)
VS8=("OK",,SE1)
VS7=($89842,,SE1)
HS1=($89385,,SE1)

OUTPUT(NCCODE4)
  "_WHEEL_SETUP_LEFT(" BOK1 "," UGAO1 "," FAZETA1 "," RADIUS1 "," DUZKON1 "," UGAOKON1 "," PODHODX "," PODHODZ "," DUB1 "," KONUSX "," KONUSZ "," Ugao "," BrojAlata ")"
END_OUTPUT

OUTPUT(NCCODE5)
  "_WHEEL_SETUP_RIGHT(" BOK1 "," UGAO1 "," FAZETA1 "," RADIUS1 "," DUZKON1 "," UGAOKON1 "," PODHODX "," PODHODZ "," DUB1 "," KONUSX "," KONUSZ "," Ugao "," BrojAlata ")"
END_OUTPUT

Press(vs1)
   BrojAlata=BrojAlata-1
   ;If (BrojAlata<2)
   ;   VS1.se=2
   ;endif
   call("IzborAlata")
End_Press

Press(vs2)
   BrojAlata=BrojAlata+1
   ;If (BrojAlata>1)
   ;   VS1.se=1
   ;Endif
   call("IzborAlata")
End_Press

PRESS(VS5)
   if (Slika.wr == 4)
      Slika.wr=1
   else
      Slika.wr=4
   endif
End_Press

PRESS(VS8)
  IF (PROFIL==0)
     GC("NCCODE4")
  ELSE
     GC("NCCODE5")
  ENDIF
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

change (Bok1)
    call ("PromeniSliku")
end_change

change (DuzKon1)
   call ("PromeniSliku")
end_change

change (UgaoKon1)
   call ("PromeniSliku")
end_change

change (Profil)
    call ("PromeniSliku")
end_change

change (Ugao)
    call ("PromeniSliku")
end_change

LOAD
   LB("Funkcije","cwheel_setup.com")
   ;BrojAlata=1
   call ("PromeniSliku")
   call ("IzborAlata")
END_LOAD

//END

//B(Funkcije)

SUB(PromeniSliku)

  BrojSlike=313
  slika.st = "\\al" << BrojSlike << ".png"

END_SUB

SUB(IzborAlata)
   If (BrojAlata<2)
      VS1.se=2
   Else
      Vs1.se=1
   Endif
   REG[2] = RNP("$TC_TP2["<<BrojAlata<<"]")
   if (REG[2]==0) 
      Alat.FC_ST=7
      Alat.st = "T" <<BrojAlata << " - Alat ne postoji"
      Alat=""
   else
      Alat.FC_ST=1
      Reg[1]=RNP("$TC_DP1["<<BrojAlata<<",1]")
      Reg[3]=RNP("$TC_DP3["<<BrojAlata<<",1]")
      Reg[4]=RNP("$TC_TPG5["<<BrojAlata<<"]")
      Alat.st= "T" <<BrojAlata << "-" << REG[2]
      if (Reg[1]==400)
         Alat.FC=1
         Alat = Round(Reg[3],4)<<"x"<<Round(Reg[4],4)
      else
         Alat.Fc=7
         Alat = "Alat nije tocilo"
      endif
   Endif

END_SUB

//END

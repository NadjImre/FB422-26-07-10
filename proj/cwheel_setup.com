//M(WheelSetup)
;FB290
;april 2020

DEF PROFIL = (I/* 0=$89046,1=$89047/0/,$89156,,/WR2///255,,200/435,,120)

DEF BOK1 = (R1/-10,210/0/,$89030,"H",$89009////255,,200/435,,120//"POMOC.HTML","9409")
DEF UGAO1 = (R1/-20,20/0/,$89029,"A",$89013////255,,200/435,,120//"POMOC.HTML","9410")
DEF DUB1 = (R1/0,2/0/,$89029,"K",$89009////255,,200/435,,120//"POMOC.HTML","9410")
DEF FAZETA1 = (R1/0,30/0/,$89031,"F",$89009////255,,200/435,,120//"POMOC.HTML","9411")
DEF RADIUS1 = (R2/-150,150/0/,$89032,"R",$89009////255,,200/435,,120//"POMOC.HTML","9412")

DEF DUZKON1 = (R1/0,100/0/,$89050,"L",$89009////255,,200/435,,120//"POMOC.HTML","9413")
DEF UGAOKON1 = (R4/-45,45/0/,$89051,"B",$89013////255,,200/435,,120//"POMOC.HTML","9414")

DEF KONUSX = (R3/-1,1/0/,$89084,"Xk",$89009/wr4///255,,200/435,,120//"POMOC.HTML","9414")
DEF KONUSZ = (R3/-1,1/0/,,"Zk",$89009/Wr4///255,,200/435,,120//"POMOC.HTML","9414")
DEF Ugao = (R2/0,45/0/,$89082,"G",$89013/WR2///255,,200/435,,120//"POMOC.HTML","9307")
; AX/AZ vise ne idu u GUD (pise ih _DRESSING_SETUP). Ostaju u OUTPUT zbog PROC potpisa.
DEF PODHODX = (R1/0,50/3/,$89004,"AX",$89009/WR4///255,,200/435,,120)
DEF PODHODZ = (R1/0,50/5/,,"AZ",$89009/WR4///255,,200/435,,120)
Def Alat = (S///,,,/Wr1///255,,200/435,,120)
Def BrojAlata = (I//1/,,"","."/wr4///255,,200/435,,120)

DEF Graph = (W///,"slesgraphcustomwidget.SlEsGraphCustomWidget"/////0,0,250,360/0,0,0,0)
DEF Slika = (I///,,,/wr1///0,0,250,360/0,320,25,2) 

DEF BrojSlike=(I////wr4)

VS1=($89183,,se1)
VS2=($89184,,se1)
VS5=($89185,,SE2)
VS8=($89163,,SE1)
VS7=($89157,,SE1)
HS1=($89068,,SE1)

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
      Alat.st = "T" <<BrojAlata << $89190
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
         Alat = $89191
      endif
   Endif

END_SUB

//END

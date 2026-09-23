//M(WheelSetup)
;FB290
;april 2020

DEF PROFIL = (I/* 0=$89046,1=$89047/0/,$89156,,/WR2///255,,200/435,,120)
DeF Profil2 = (I/* 0="Tip 1",1="Tip 2"/0/,$89156,,/WR2///255,,200/435,,120)
DEF BOK1 = (R1/-10,210/0/,$89030,"H",$89009////255,,200/435,,120//"POMOC.HTML","9409")
DEF UGAO1 = (R1/-20,20/0/,$89029,"A",$89013////255,,200/435,,120//"POMOC.HTML","9410")
DEF DUB1 = (R1/0,2/0/,$89029,"K",$89009////255,,200/435,,120//"POMOC.HTML","9410")
DEF FAZETA1 = (R1/0,30/0/,$89031,"F",$89009////255,,200/435,,120//"POMOC.HTML","9411")
DEF RADIUS1 = (R2/-150,150/0/,$89032,"R",$89009////255,,200/435,,120//"POMOC.HTML","9412")
DEF GreskaR = (S///,,,/WR4///255,,200/435,,200)

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
DEF Slika = (I///,,,/wr1///0,0,450,360/0,320,250,250) 

DEF BrojSlike=(I////wr4)
;tacke profila
DEF XA=(R4////wr4)
DEF ZA=(R4////wr4)
DEF XB=(R4////wr4)
DEF ZB=(R4////wr4)
DEF XC=(R4////wr4)
DEF ZC=(R4////wr4)
DEF XD=(R4////wr4)
DEF ZD=(R4////wr4)
DEF XE=(R4////wr4)
DEF ZE=(R4////wr4)
DEF XF=(R4////wr4)
DEF ZF=(R4////wr4)
DEF XG=(R4////wr4)
DEF ZG=(R4////wr4)
;radijus oko tacke C - centar
DEF XC0=(R4////wr4)
DEF ZC0=(R4////wr4)
;pocetak
DEF XC1=(R4////wr4)
DEF ZC1=(R4////wr4)
;kraj
DEF XC2=(R4////wr4)
DEF ZC2=(R4////wr4)
;radijus oko tacke E - centar
DEF XE0=(R4////wr4)
DEF ZE0=(R4////wr4)
;pocetak
DEF XE1=(R4////wr4)
DEF ZE1=(R4////wr4)
;kraj
DEF XE2=(R4////wr4)
DEF ZE2=(R4////wr4)
Def Smer=(R4////wr4)
Def ImaF=(I////wr4)
Def Rcrt=(R4////wr4)
Def Host=(R4////wr4)
Def Beff=(R4////wr4)
Def Fmin=(R4////wr4)

VS1=($89183,,se1)
VS2=($89184,,se1)
VS5=($89185,,SE1)
VS6=("Update%ngraphics",,Se2)
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
   call("IzborAlata")
End_Press

Press(vs2)
   BrojAlata=BrojAlata+1
   call("IzborAlata")
End_Press

PRESS(VS5)
   if (Slika.wr == 4)
      Debug("Uključujemo sliku")
      Slika.wr=1
      Vs6.Se=2
   else
      Debug("Isključujemo sliku")
      Slika.wr=4
      call("CrtanjeTocila")
      Vs6.Se=1
   endif
End_Press

Press(Vs6)
      call("CrtanjeTocila")
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


change (Profil)
    call ("PromeniSliku")
end_change

change (Profil2)
    call ("PromeniSliku")
end_change

change (FAZETA1)
    call ("ProveriRF")
    if (Slika.wr==4)
       call ("CrtanjeTocila")
    endif
end_change

change (RADIUS1)
    call ("ProveriRF")
    if (Slika.wr==4)
       call ("CrtanjeTocila")
    endif
end_change

change (UGAOKON1)
    call ("ProveriRF")
    if (Slika.wr==4)
       call ("CrtanjeTocila")
    endif
end_change

change (DUZKON1)
    call ("ProveriRF")
    if (Slika.wr==4)
       call ("CrtanjeTocila")
    endif
end_change

change (BOK1)
    call ("ProveriRF")
    if (Slika.wr==4)
       call ("CrtanjeTocila")
    endif
end_change

change (UGAO1)
    call ("ProveriRF")
    if (Slika.wr==4)
       call ("CrtanjeTocila")
    endif
end_change

change (DUB1)
    call ("ProveriRF")
    if (Slika.wr==4)
       call ("CrtanjeTocila")
    endif
end_change

LOAD
   LB("Funkcije","cwheel_setup.com")
   ;BrojAlata=1
   call ("PromeniSliku")
   call ("IzborAlata")
   call ("ProveriRF")

END_LOAD

//END

//B(Funkcije)

SUB(PromeniSliku)

  BrojSlike=303+4*Profil+10*Profil2
  slika.st = "\\al" << BrojSlike << ".png"
  Dub1.Wr = 4 - 2*Profil2
  call ("ProveriRF")
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

SUB(CrtanjeTocila)
   if (Profil<>0)
      Smer=-1
   else
      Smer=1
   endif
   if (Fazeta1>0)
      ImaF=0
   else
      ImaF=1
   endif
   Rcrt = RADIUS1
   if (Rcrt<0)
      Rcrt=0
   endif

   ; iste tacke kao FULL_LEFT (X radijus, negativan naniže), pa graf: X=-Xdrs, Z=Smer*(-Zdrs)
   XA = 0
   ZA = Smer*REG[4]
   XB = 0
   ZB = Smer*DUZKON1

   Host = -Rcrt
   if (BOK1>0)
      ZC = Host+Rcrt*SIN(SRAD(UGAOKON1))
   else
      ZC = PODHODZ
   endif
   XC = 0-(ZC+DUZKON1)*TAN(SRAD(UGAOKON1))
   XC0 = XC-Rcrt*COS(SRAD(UGAOKON1))
   ZC0 = Host
   if (FAZETA1<=0)
      XC2 = XC0-Rcrt*SIN(SRAD(UGAO1))
      ZC2 = Host+Rcrt*COS(SRAD(UGAO1))
   else
      XC2 = XC0
      ZC2 = Host+Rcrt
   endif
   XC1 = XC
   ZC1 = ZC
   XD = XC2-FAZETA1
   ZD = ZC2

   if ((Profil2<>0) AND (DUB1>0) AND (UGAO1<>0))
      XG = XD-DUB1/TAN(SRAD(UGAO1))
      ZG = ZD-DUB1
   else
      XG = XD
      ZG = ZD
   endif

   XE = -BOK1
   XE0 = XE+0.5*PODHODZ
   if (Profil2==0)
      XE1 = XE0+0.5*PODHODZ*SIN(SRAD(UGAO1))
      ZE1 = ZD-(XD-XE1)*TAN(SRAD(UGAO1))
      ZE2 = ZE1+0.5*PODHODZ*COS(SRAD(UGAO1))
      XE2 = XE
      ZE0 = ZE2
   else
      XE1 = XE0
      ZE1 = ZG
      ZE2 = ZE1+0.5*PODHODZ
      XE2 = XE
      ZE0 = ZE2
   endif
   XF = XE
   ZF = PODHODZ

   XC1 = -XC1
   ZC1 = Smer*(-ZC1)
   XC0 = -XC0
   ZC0 = Smer*(-ZC0)
   XC2 = -XC2
   ZC2 = Smer*(-ZC2)
   XD = -XD
   ZD = Smer*(-ZD)
   XG = -XG
   ZG = Smer*(-ZG)
   XE1 = -XE1
   ZE1 = Smer*(-ZE1)
   XE2 = -XE2
   ZE2 = Smer*(-ZE2)
   XE0 = -XE0
   ZE0 = Smer*(-ZE0)
   XE = -XE
   XF = XE
   ZF = Smer*(-ZF)

   WRITECWPROPERTY("Graph", "AxisNameX", "Z")
   WRITECWPROPERTY("Graph", "AxisNameY", "X")
   WRITECWPROPERTY("Graph", "ScaleTextOrientationYAxis", 2)
   WRITECWPROPERTY("Graph", "KeepAspectRatio", TRUE)
   REG[0]= CALLCWMETHOD("Graph", "removeContour", "MyContour")
   REG[0]= CALLCWMETHOD("Graph", "addContour", "MyContour", TRUE)
   REG[0]= CALLCWMETHOD("Graph", "showContour", "MyContour")
if (smer>0)
   REG[0]= CALLCWMETHOD("Graph", "setView", -15, -15, (REG[4]+15), BOK1+15)
else
   REG[0]= CALLCWMETHOD("Graph", "setView", -(REG[4]+15), -15, 15 , BOK1+15)
endif
   REG[0]= CALLCWMETHOD("Graph", "setPenWidth", 2.5)
   REG[0]= CALLCWMETHOD("Graph", "setPenColor", "#800000")
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZA, XF+10, ZA, XA)
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZA, XA, ZB, XB)
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZB, XB, ZC1, XC1)
if (Rcrt>0)
if (smer>0)
   REG[0]= CALLCWMETHOD("Graph", "addArc",ZC0-Rcrt,XC0+Rcrt,ZC0+Rcrt,XC0-Rcrt,180+UGAOKON1,90+ImaF*UGAO1-UGAOKON1)
else
   REG[0]= CALLCWMETHOD("Graph", "addArc",ZC0-Rcrt,XC0+Rcrt,ZC0+Rcrt,XC0-Rcrt,90-ImaF*UGAO1,90+ImaF*UGAO1-UGAOKON1)
endif
endif
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZC2, XC2, ZD, XD)
if (BOK1>0)
if(Profil2<>0)
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZD, XD, ZG, XG)
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZG, XG, ZE1, XE1)
   REG[0]= CALLCWMETHOD("Graph", "addArc",ZE0-0.5*PodhodZ,XE0+0.5*PodhodZ,ZE0+0.5*PodhodZ,XE0-0.5*PodhodZ,Profil*90,90)
else
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZD, XD, ZE1, XE1)
if (smer>0)
   REG[0]= CALLCWMETHOD("Graph", "addArc",ZE0-0.5*PodhodZ,XE0+0.5*PodhodZ,ZE0+0.5*PodhodZ,XE0-0.5*PodhodZ,360-Ugao1,90+Ugao1)
else
   REG[0]= CALLCWMETHOD("Graph", "addArc",ZE0-0.5*PodhodZ,XE0+0.5*PodhodZ,ZE0+0.5*PodhodZ,XE0-0.5*PodhodZ,90,90+Ugao1)
endif
endif
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZE2, XE2, ZF, XF)
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZF, XF , ZF,XF+10)
endif
   REG[0]= CALLCWMETHOD("Graph", "setPenWidth", 1)
   REG[0]= CALLCWMETHOD("Graph", "setPenStyle", 4)
   REG[0]= CALLCWMETHOD("Graph", "addLine", -10*smer, BOK1+10 , smer*(Reg[4]+10),BOK1+10)
   REG[0]= CALLCWMETHOD("Graph", "update")
   call ("ProveriRF")

END_SUB

; isto kao DRS: Xe (tip 2: Xr) ne sme da predje pocetak donjeg luka Xf
SUB(ProveriRF)
   FAZETA1.bc=10
   RADIUS1.bc=10
   BOK1.bc=10
   GreskaR=""
   GreskaR.wr=4
   IF (BOK1>0)
      Rcrt = RADIUS1
      IF (Rcrt<0)
         Rcrt=0
      ENDIF
      Host = -Rcrt
      Beff = Host+Rcrt*SIN(SRAD(UGAOKON1))
      Fmin = 0-(Beff+DUZKON1)*TAN(SRAD(UGAOKON1))
      Host = Fmin-Rcrt*COS(SRAD(UGAOKON1))
      IF (FAZETA1<=0)
         Host = Host-Rcrt*SIN(SRAD(UGAO1))
      ENDIF
      Host = Host-FAZETA1
      IF ((Profil2<>0) AND (DUB1>0) AND (UGAO1<>0))
         Host = Host-DUB1/TAN(SRAD(UGAO1))
      ENDIF
      Fmin = -BOK1+0.5*PODHODZ
      IF (Profil2==0)
         Fmin = Fmin+0.5*PODHODZ*SIN(SRAD(UGAO1))
      ENDIF
      IF (Host<=Fmin)
         GreskaR=$89310
         GreskaR.wr=1
         GreskaR.bc=7
         BOK1.bc=7
         RADIUS1.bc=7
      ENDIF
   ENDIF
END_SUB

//END

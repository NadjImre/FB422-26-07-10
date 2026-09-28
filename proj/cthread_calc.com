//B(Proracun)

SUB(CrtanjeTocila)
   ;postavke za crtanje
   WRITECWPROPERTY("Graph", "AxisNameX", "Z")
   WRITECWPROPERTY("Graph", "AxisNameY", "X")
   WRITECWPROPERTY("Graph", "ScaleTextOrientationYAxis", 2)
   WRITECWPROPERTY("Graph", "KeepAspectRatio", TRUE)
   REG[0]= CALLCWMETHOD("Graph", "removeContour", "MyContour")
   REG[0]= CALLCWMETHOD("Graph", "addContour", "MyContour", TRUE)
   REG[0]= CALLCWMETHOD("Graph", "showContour", "MyContour")
   REG[0]= CALLCWMETHOD("Graph", "setPenWidth", 2.5)
   REG[0]= CALLCWMETHOD("Graph", "setPenColor", "#800000")
REG[6]=0 
;glavna petlja
DO_WHILE (REG[6] < Broj_Zuba)
   ;polozaj zuba
   REG[7]=Polozaj_Zuba_X3+REG[6]*Razmak_Zuba
   IF ( (_Vrste_Navoja==2) OR (_Vrste_Navoja==3) OR (_Vrste_Navoja==6) )
      ;tacke profila
      if (Reg[6]==0)
         XA=0
         ZA=0
      else
         XA=XE2
         ZA=ZE2
   endif
   XC=BOK1+Podizanje_Podnozja_X1+Podizanje_Vrha_X2-(Broj_Zuba-REG[6]-1)*Delta_Zuba
   ZC=REG[7]-0.5*Sirina_W
   XD=XC
   ZD=REG[7]+0.5*Sirina_W
   XB=0
   ZB=ZC-XC*Tan(Srad(Ugao2))
   ZE=ZD+XD*Tan(Srad(Ugao1))
   XE=0
   XF=0
   ZF=ZE+(ZB-ZA)
ELSE
      ;tacke profila
      if (Reg[6]==0)
         XA=0
         ZA=0
      else
         XA=XE2
         ZA=ZE2
   endif
   ;koristimo slobodni DD1 za udaljenost CC0 da ne uvodimo dodatnu promenljivu
   DD1=Radius1/sin(srad(0.5*(Ugao1+Ugao2)))
   XC0 = BOK1+PODIZANJE_PODNOZJA_X1-Radius1-(Broj_Zuba-REG[6]-1)*Delta_Zuba
   XC = XC0 + DD1*cos(srad(0.5*(ugao2-ugao1)))
   ZC = REG[7]
   ZC0 = ZC - DD1*sin(srad(0.5*(ugao2-ugao1)))
   XB=0
   ZB=ZC-XC*Tan(Srad(Ugao2))
   ZE=ZC+XC*Tan(Srad(Ugao1))
   XE=0
   XF=0
   ZF=ZE+(ZB-ZA)
ENDIF
   ;radijusi
   BB1 = Radius2*tan(srad(45-0.5*Ugao2))
   XB1 = XB
   ZB1 = ZB-BB1
   ZB2 = ZB+BB1*Sin(Srad(Ugao2))
   XB2 = XB+BB1*cos(Srad(Ugao2))
   XB0 = XB1+Radius2
   ZB0 = ZB1
IF ( (_Vrste_Navoja==2) OR (_Vrste_Navoja==3) OR (_Vrste_Navoja==6) )
   ;radijusi
   CC1 = Radius1*tan(srad(45-0.5*Ugao2))
   XC2 = XC
   ZC2 = ZC+CC1
   ZC1 = ZC-CC1*Sin(Srad(Ugao2))
   XC1 = XC-CC1*cos(Srad(Ugao2))
   XC0 = XC2-Radius1
   ZC0 = ZC2
   ;radijusi
   DD1 = Radius1*tan(srad(45-0.5*Ugao1))
   XD1 = XD
   ZD1 = ZD-DD1
   ZD2 = ZD+DD1*Sin(Srad(Ugao1))
   XD2 = XD-DD1*cos(Srad(Ugao1))
   XD0 = XD1-Radius1
   ZD0 = ZD1
ELSE
   CC1 = Radius1/tan(srad(0.5*(Ugao1+Ugao2)))
   XD2 = XC-CC1*cos(srad(ugao1))
   ZD2 = ZC+CC1*sin(srad(ugao1))
   ZC1 = ZC-CC1*Sin(Srad(Ugao2))
   XC1 = XC-CC1*cos(Srad(Ugao2))
Endif
   ;radijusi
   EE1 = Radius2*tan(srad(45-0.5*Ugao1))
   XE1 = XE+EE1*cos(Srad(Ugao1))
   ZE1 = ZE-EE1*Sin(Srad(Ugao1))
   ZE2 = ZE+EE1
   XE2 = XE
   XE0 = XE2+Radius2
   ZE0 = ZE2
   ;crtanje
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZA, XA, ZB1, XB1)
   REG[0]= CALLCWMETHOD("Graph", "addArc",ZB0-Radius2,XB0+Radius2,ZB0+Radius2,XB0-Radius2,270,90-UGAO2)
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZB2, XB2, ZC1, XC1)
IF ( (_Vrste_Navoja==2) OR (_Vrste_Navoja==3) OR (_Vrste_Navoja==6) )
   REG[0]= CALLCWMETHOD("Graph", "addArc",ZC0-Radius1,XC0+Radius1,ZC0+Radius1,XC0-Radius1,90,90-UGAO2)
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZC2, XC2, ZD1, XD1)
   REG[0]= CALLCWMETHOD("Graph", "addArc",ZD0-Radius1,XD0+Radius1,ZD0+Radius1,XD0-Radius1,Ugao1,90-UGAO1)
Else
   REG[0]= CALLCWMETHOD("Graph", "addArc",ZC0-Radius1,XC0+Radius1,ZC0+Radius1,XC0-Radius1,Ugao1,180-Ugao1-UGAO2)
EndIf
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZD2, XD2, ZE1, XE1)
   REG[0]= CALLCWMETHOD("Graph", "addArc",ZE0-Radius2,XE0+Radius2,ZE0+Radius2,XE0-Radius2,180+Ugao1,90-UGAO1)
   REG[6]=REG[6]+1
LOOP
   REG[0]= CALLCWMETHOD("Graph", "addLine", ZE2, XE2, ZF, XF)
   REG[0]= CALLCWMETHOD("Graph", "update")
   REG[0]= CALLCWMETHOD("Graph", "fitViewToContours")
END_SUB

//END

//M(ThreadWheelSetup)
; FB422 Thread Profil
; 0=metrički 1=cevni 2=trapezni 3=testerasti 4=obli 5=univ. trougao 6=univ. trapez
; geometrija ide u GUD; konturu bira _DRESSING_SETUP nacin 8
; Ht i Bs samo prikaz (projektor), ne idu u NC

DEF _Vrste_Navoja = (I/* 0="Metricki",1="Cevni",2="Trapezni",3="Testerasi",4="Obli",5="Univ. trougao",6="Univ. trapez"/0/,$89403,,/WR2///255,,200/435,,120)

DEF KORAK_NAVOJA = (R4/,/0/,"Th_Pitch","P",$89068////255,,200/435,,120//"POMOC.HTML","9413")
DEF POLOZAJ_ZUBA_X3 = (R4/,/0/,"Ds_X3","X3",$89068////255,,200/435,,120//"POMOC.HTML","9412")
DEF PRAZNA_0 = (V////WR0,)

DEF BOK1 = (R4/,/0/,"Th_H","H",$89068////255,,200/435,,120//"POMOC.HTML","9409")
DEF UGAO1 = (R4/,/0/,"Th_Alpha","A",$89072////255,,200/435,,120//"POMOC.HTML","9410")
DEF UGAO2 = (R4/,/0/,"Th_Beta","B",$89072////255,,200/435,,120//"POMOC.HTML","9410")

DEF RADIUS1 = (R4/,/0/,"Th_R1","R1",$89068////255,,200/435,,120//"POMOC.HTML","9412")
DEF SIRINA_W = (R4/,/0/,"Th_B2","W",$89068////255,,200/435,,120//"POMOC.HTML","9413")
DEF RADIUS2 = (R4/,/0/,"Th_R2","R2",$89068////255,,200/435,,120//"POMOC.HTML","9412")
DEF PODIZANJE_PODNOZJA_X1 = (R4/,/0/,"Ds_X1","X1",$89068////255,,200/435,,120//"POMOC.HTML","9412")
DEF PODIZANJE_VRHA_X2 = (R4/,/0/,"Ds_X2","X2",$89068////255,,200/435,,120//"POMOC.HTML","9412")

; samo prikaz, nema GUD / NC
DEF VISINA_UKUPNO = (R4///,,"Ht",$89068/WR1///255,,200/435,,120)
DEF SIRINA_OSNOVE = (R4///,,"Bs",$89068/WR1///255,,200/435,,120)

Def Teo_Visina = (R4///,,"Ho",$89068/WR4///255,,200/435,,120)

; AX/AZ samo prikaz; ds_podhod pise _DRESSING_SETUP
DEF PODHODX = (R1/0,50/3/,$89058,"AX",$89068/WR4///255,,200/435,,120)
DEF PODHODZ = (R1/0,50/5/,,"AZ",$89068/WR4///255,,200/435,,120)
DEF Alat = (S///,,,/Wr1///255,,200/435,,120)
DEF BrojAlata = (I//1/,,"","."/wr4///255,,200/435,,120)
DEF _ac = (r4///,,"","."/wr4///255,,200/435,,120)

DEF Graph = (W///,"slesgraphcustomwidget.SlEsGraphCustomWidget"/////0,0,250,360/0,0,0,0)
DEF Slika = (I///,,,/wr1///0,0,250,360/0,320,25,2)

VS1=("T - ",,se1)
VS2=("T + ",,se1)
VS4=("IZRACUNAJ",,SE1)
VS5=("Grafika",,SE1)
VS8=("OK",,SE1)
VS7=($89842,,SE1)
HS1=($89385,,SE1)

OUTPUT(NCCODE4)
   "_THREAD_WHEEL_SETUP(" _Vrste_Navoja "," BOK1 "," UGAO1 "," UGAO2 "," RADIUS1 "," RADIUS2 "," SIRINA_W "," KORAK_NAVOJA "," PODHODX "," PODHODZ "," BrojAlata "," POLOZAJ_ZUBA_X3 "," PODIZANJE_PODNOZJA_X1 "," PODIZANJE_VRHA_X2 ")"
END_OUTPUT

PRESS(VS1)
   BrojAlata=BrojAlata-1
   CALL("IzborAlata")
END_PRESS

PRESS(VS2)
   BrojAlata=BrojAlata+1
   CALL("IzborAlata")
END_PRESS

PRESS(VS4)

   ; metrički ISO 60°: samo H, A, B, R1 iz koraka; R2 i X1 ručno
   IF (_Vrste_Navoja == 0)
      BOK1=0.613435*KORAK_NAVOJA
      UGAO1=30
      UGAO2=30
      RADIUS1=0.14436*KORAK_NAVOJA
   ENDIF

   ; cevni Whitworth 55°
   IF (_Vrste_Navoja == 1)
      BOK1=0.64033*KORAK_NAVOJA
      UGAO1=27.5
      UGAO2=27.5
      RADIUS1=0.13733*KORAK_NAVOJA
      RADIUS2=RADIUS1
      PODIZANJE_PODNOZJA_X1=0
   ENDIF

   ; trapezni: H=0.5*P radna visina, X2=_ac (GOST), W=0.366*P-X2*2*tan(15)
   IF (_Vrste_Navoja == 2)
      BOK1=0.5*KORAK_NAVOJA
      UGAO1=15
      UGAO2=15

      IF (KORAK_NAVOJA<2)
         RADIUS2=0.075
         RADIUS1=0.15
         _ac=0.15
      ENDIF
      IF ((KORAK_NAVOJA>=2) AND (KORAK_NAVOJA<=5))
         RADIUS2=0.125
         RADIUS1=0.25
         _ac=0.25
      ENDIF
      IF ((KORAK_NAVOJA>5) AND (KORAK_NAVOJA<=12))
         RADIUS2=0.25
         RADIUS1=0.5
         _ac=0.5
      ENDIF
      IF (KORAK_NAVOJA>12)
         RADIUS2=0.5
         RADIUS1=1.0
         _ac=1.0
      ENDIF

      PODIZANJE_PODNOZJA_X1=0
      PODIZANJE_VRHA_X2=_ac
      SIRINA_W=0.366*KORAK_NAVOJA - PODIZANJE_VRHA_X2*0.5358
   ENDIF

   ; testerasti 30°/3°: R1=0 (ravan vrh, standard traži radijus), W iz 0.375*P
   IF (_Vrste_Navoja == 3)
      UGAO1=30
      UGAO2=3
      RADIUS1=0
      RADIUS2=0
      PODIZANJE_VRHA_X2=0.11777*KORAK_NAVOJA
      BOK1=0.75*KORAK_NAVOJA
      SIRINA_W=(0.5*KORAK_NAVOJA) - ((0.375*KORAK_NAVOJA+PODIZANJE_VRHA_X2)*(TAN(SRAD(UGAO1))+TAN(SRAD(UGAO2))))
      PODIZANJE_PODNOZJA_X1=0
   ENDIF

   ; obli: W na sredini visine (kontura TRI, W se ne crta)
   IF (_Vrste_Navoja == 4)
      BOK1=0.5*KORAK_NAVOJA
      UGAO1=15
      UGAO2=15
      RADIUS1=0.23851*KORAK_NAVOJA
      RADIUS2=0.23851*KORAK_NAVOJA
      PODIZANJE_PODNOZJA_X1=0
      PODIZANJE_VRHA_X2=0
      SIRINA_W=0.5*KORAK_NAVOJA
   ENDIF

   CALL("ProveriR2")
   CALL("PreracunPrikaz")

END_PRESS

PRESS(VS5)
   IF (Slika.wr == 4)
      Slika.wr=1
   ELSE
      Slika.wr=4
   ENDIF
END_PRESS

PRESS(VS8)
   GC("NCCODE4")
   EXIT
END_PRESS

PRESS(VS7)
   EXIT
END_PRESS

CHANGE(PODIZANJE_VRHA_X2)
   IF (_Vrste_Navoja == 2)
      SIRINA_W=0.366*KORAK_NAVOJA - PODIZANJE_VRHA_X2*0.5358
   ENDIF
   IF (_Vrste_Navoja == 3)
      SIRINA_W=(0.5*KORAK_NAVOJA) - ((0.375*KORAK_NAVOJA+PODIZANJE_VRHA_X2)*(TAN(SRAD(UGAO1))+TAN(SRAD(UGAO2))))
   ENDIF
   CALL("PromeniSliku")
   CALL("PreracunPrikaz")
END_CHANGE

CHANGE(PODIZANJE_PODNOZJA_X1)
   CALL("PreracunPrikaz")
END_CHANGE

CHANGE(SIRINA_W)
   CALL("PreracunPrikaz")
END_CHANGE

CHANGE(Bok1)
   CALL("PromeniSliku")
   CALL("PreracunPrikaz")
END_CHANGE

CHANGE(UGAO1)
   CALL("PreracunPrikaz")
END_CHANGE

CHANGE(UGAO2)
   CALL("PreracunPrikaz")
END_CHANGE

CHANGE(_Vrste_Navoja)
   CALL("PoljaMaske")
   CALL("PromeniSliku")
   CALL("PreracunPrikaz")
END_CHANGE

CHANGE(RADIUS1)
   CALL("PreracunPrikaz")
END_CHANGE

CHANGE(RADIUS2)
   CALL("ProveriR2")
END_CHANGE

CHANGE(BrojAlata)
   CALL("IzborAlata")
   CALL("ProveriR2")
END_CHANGE

LOAD
   KORAK_NAVOJA.bc=9
   LB("Funkcije","cthread_wheel_setup.com")
   CALL("PoljaMaske")
   CALL("PromeniSliku")
   CALL("IzborAlata")
   CALL("ProveriR2")
   CALL("PreracunPrikaz")
END_LOAD

//END

//B(Funkcije)

SUB(PromeniSliku)
   IF ((_Vrste_Navoja == 0) OR (_Vrste_Navoja == 5))
      slika.st = "\\kam_trougao_1.png"
   ENDIF
   IF (_Vrste_Navoja == 1)
      slika.st = "\\kam_cevni_1.png"
   ENDIF
   IF ((_Vrste_Navoja == 2) OR (_Vrste_Navoja == 6))
      slika.st = "\\kam_trapez_1.png"
   ENDIF
   IF (_Vrste_Navoja == 3)
      slika.st = "\\kam_testera_1.png"
   ENDIF
   IF (_Vrste_Navoja == 4)
      slika.st = "\\kam_obli_1.png"
   ENDIF
END_SUB

; wr=2 upis, wr=1 samo citanje, wr=4 skriveno
SUB(PoljaMaske)
   KORAK_NAVOJA.wr=2
   BOK1.wr=1
   UGAO1.wr=1
   UGAO2.wr=1
   RADIUS1.wr=1
   RADIUS2.wr=2
   PODIZANJE_PODNOZJA_X1.wr=2
   SIRINA_W.wr=4
   PODIZANJE_VRHA_X2.wr=4
   VS4.se=1

   IF (_Vrste_Navoja == 1)
      RADIUS2.wr=1
      PODIZANJE_PODNOZJA_X1.wr=1
   ENDIF

   IF (_Vrste_Navoja == 4)
      RADIUS2.wr=1
      PODIZANJE_PODNOZJA_X1.wr=1
   ENDIF

   IF ((_Vrste_Navoja == 2) OR (_Vrste_Navoja == 3))
      RADIUS2.wr=1
      SIRINA_W.wr=1
      PODIZANJE_VRHA_X2.wr=2
   ENDIF

   IF (_Vrste_Navoja == 5)
      KORAK_NAVOJA.wr=4
      BOK1.wr=2
      UGAO1.wr=2
      UGAO2.wr=2
      RADIUS1.wr=2
      RADIUS2.wr=2
      PODIZANJE_PODNOZJA_X1.wr=2
      SIRINA_W.wr=4
      PODIZANJE_VRHA_X2.wr=4
      VS4.se=2
   ENDIF

   IF (_Vrste_Navoja == 6)
      KORAK_NAVOJA.wr=4
      BOK1.wr=2
      UGAO1.wr=2
      UGAO2.wr=2
      RADIUS1.wr=2
      RADIUS2.wr=2
      PODIZANJE_PODNOZJA_X1.wr=2
      SIRINA_W.wr=2
      PODIZANJE_VRHA_X2.wr=2
      VS4.se=2
   ENDIF
END_SUB

; Ht = H+X1[+X2]; Bs = teorijska osnovica bez R1/R2
SUB(PreracunPrikaz)
   IF ((_Vrste_Navoja == 2) OR (_Vrste_Navoja == 3) OR (_Vrste_Navoja == 6))
      VISINA_UKUPNO = BOK1 + PODIZANJE_PODNOZJA_X1 + PODIZANJE_VRHA_X2
      SIRINA_OSNOVE = SIRINA_W + VISINA_UKUPNO*(TAN(SRAD(UGAO1))+TAN(SRAD(UGAO2)))
   ELSE
      VISINA_UKUPNO = BOK1 + PODIZANJE_PODNOZJA_X1
      TEO_VISINA = VISINA_UKUPNO-RADIUS1+Radius1*(cos(srad(0.5*(Ugao1-Ugao2)))/sin(srad(0.5*(Ugao1+Ugao2))))
      SIRINA_OSNOVE = TEO_VISINA*(TAN(SRAD(UGAO1))+TAN(SRAD(UGAO2)))
   ENDIF
END_SUB

; R2 je udubljenje: belo ako su oba vrha dressera <= R2, crveno ako je alat deblji
; R1 je ispupčenje, alat ne ograničava
SUB(ProveriR2)
   IF ((RADIUS2 >= RNP("$TC_DP6["<<BrojAlata<<",1]")) AND (RADIUS2 >= RNP("$TC_DP6["<<BrojAlata<<",2]")))
      RADIUS2.bc=10
   ELSE
      RADIUS2.bc=7
   ENDIF
END_SUB

SUB(IzborAlata)
   IF (BrojAlata<2)
      VS1.se=2
   ELSE
      VS1.se=1
   ENDIF
   REG[2] = RNP("$TC_TP2["<<BrojAlata<<"]")
   IF (REG[2]==0)
      Alat.FC_ST=7
      Alat.st = "T" <<BrojAlata << " - Alat ne postoji"
      Alat=""
   ELSE
      Alat.FC_ST=1
      REG[1]=RNP("$TC_DP1["<<BrojAlata<<",1]")
      Alat.st= "T" <<BrojAlata << "-" << REG[2]
      IF ((REG[1]==490) OR (REG[1]==496))
         Alat.FC=1
         Alat = "D1: R"<<RNP("$TC_DP6["<<BrojAlata<<",1]")<<"   D2: R"<<RNP("$TC_DP6["<<BrojAlata<<",2]")
      ELSE
         Alat.Fc=7
         Alat = "Alat nije dresser"
      ENDIF
   ENDIF
END_SUB

//END

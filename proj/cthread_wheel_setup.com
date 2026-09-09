//M(ThreadWheelSetup)
;FB422
;april 2026

;DEF _Vrste_Navoja = (I/* 0="Metricki",1="Vitvortov",2="Trapezni",3="Obli",4="Testerasi",5="Opsti Cevni",6="Opsti Trapezni"/0/,$89403,,/WR2///255,,200/435,,120)
DEF _Vrste_Navoja = (I/* 0="Metricki",1="Cevni",2="Trapezni",3="Testerasi",4="Obli"/0/,$89403,,/WR2///255,,200/435,,120)

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

;DEF UGAOKON1 = (R4/-45,45/0/,$89196,"B",$89072////255,,200/435,,120//"POMOC.HTML","9414")

;DEF KONUSX = (R3/-1,1/0/,$89460,"Xk",$89068/wr4///255,,200/435,,120//"POMOC.HTML","9414")
;DEF KONUSZ = (R3/-1,1/0/,,"Zk",$89068/Wr4///255,,200/435,,120//"POMOC.HTML","9414")
;DEF Ugao = (R2/0,45/0/,$89453,"G",$89072/WR2///255,,200/435,,120//"POMOC.HTML","9307")

DEF PRAZNA_1 = (V////WR0,)

; AX/AZ se ne upisuju (ds_podhod pise _DRESSING_SETUP)
DEF PODHODX = (R1/0,50/3/,$89058,"AX",$89068/WR4///255,,200/435,,120)
DEF PODHODZ = (R1/0,50/5/,,"AZ",$89068/WR4///255,,200/435,,120)
Def Alat = (S///,,,/Wr1///255,,200/435,,120)
Def BrojAlata = (I//1/,,"","."/wr4///255,,200/435,,120)
Def _ac = (r4///,,"","."/wr4///255,,200/435,,120) ;zazor kod trapeznog navoja između matice i vijka
;Def _bc = (r4///,,"","."/wr4///255,,200/435,,120) ;zazor kod trapeznog navoja između vijka i matice ;_bc=_ac

DEF Graph = (W///,"slesgraphcustomwidget.SlEsGraphCustomWidget"/////0,0,250,360/0,0,0,0)
DEF Slika = (I///,,,/wr1///0,0,250,360/0,320,25,2) 

DEF BrojSlike=(I////wr4)

;izmena_c
;VS1=("Prethodni%nalat",,se1)
;VS2=("Sledeći%nalat",,se1)
VS1=("T - ",,se1)
VS2=("T + ",,se1)

;izmena_c
VS4=("IZRACUNAJ",,SE1)

VS5=("Grafika",,SE1)
VS8=("OK",,SE1)
VS7=($89842,,SE1)
HS1=($89385,,SE1)

OUTPUT(NCCODE4)
  "_THREAD_WHEEL_SETUP(" _Vrste_Navoja "," BOK1 "," UGAO1 "," UGAO2 "," RADIUS1 "," RADIUS2 "," SIRINA_W "," KORAK_NAVOJA "," PODHODX "," PODHODZ "," BrojAlata "," POLOZAJ_ZUBA_X3 "," PODIZANJE_PODNOZJA_X1 "," PODIZANJE_VRHA_X2 ")"
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

Press(vs4)

  ;metricki
  IF _Vrste_Navoja == 0
    ;BOK1=0.541266*KORAK_NAVOJA
    BOK1=0.613435*KORAK_NAVOJA
    UGAO1=30
    UGAO2=30
    RADIUS1=0.14436*KORAK_NAVOJA
    ;RADIUS2=RNP("$TC_DP6[4,2]")

    IF RNP("$TC_DP6["<<BrojAlata<<",1]") >= RNP("$TC_DP6["<<BrojAlata<<",2]")
      RADIUS2=RNP("$TC_DP6["<<BrojAlata<<",1]")
    ELSE
      RADIUS2=RNP("$TC_DP6["<<BrojAlata<<",2]")
    ENDIF

    PODIZANJE_PODNOZJA_X1=RADIUS2+0.1

  ENDIF

  ;cevni
  IF _Vrste_Navoja == 1
    BOK1=0.64033*KORAK_NAVOJA
    UGAO1=27.5
    UGAO2=27.5
    RADIUS1=0.13733*KORAK_NAVOJA
    RADIUS2=RADIUS1

    ;IF (RADIUS1 > RNP("$TC_DP6["<<BrojAlata<<",1]")) and (RADIUS1 > RNP("$TC_DP6["<<BrojAlata<<",2]"))
      ;RADIUS1.bc=10
      ;RADIUS2.bc=10
    ;ELSE
      ;RADIUS1.bc=7
      ;RADIUS2.bc=7
    ;ENDIF

    PODIZANJE_PODNOZJA_X1=0

  ENDIF

  ;trapezni
  IF _Vrste_Navoja == 2

    ;stvarna visia je BOK1=0.5*KORAK_NAVOJA + ac
    BOK1=0.5*KORAK_NAVOJA ;H1-radna visina
    UGAO1=15
    UGAO2=15

    ;vredosti su iz GOST - tablice
    if (KORAK_NAVOJA<2)
      RADIUS2=0.075 ;R2 max = ac/2
      RADIUS1=0.15 ;R1 max = ac
      _ac=0.15
    endif
    if (KORAK_NAVOJA>=2) and (KORAK_NAVOJA<=5)
      RADIUS2=0.125
      RADIUS1=0.25
      _ac=0.25
    endif
    if (KORAK_NAVOJA>5) and (KORAK_NAVOJA<=12)
      RADIUS2=0.25
      RADIUS1=0.5
      _ac=0.5
    endif
    if (KORAK_NAVOJA>12)
      RADIUS2=0.5
      RADIUS1=1.0 
      _ac=1.0
    endif

    PODIZANJE_PODNOZJA_X1=0
    PODIZANJE_VRHA_X2=_ac
    ;SIRINA_W=0.366*KORAK_NAVOJA - _ac*0.5358   ;----(_ac*tan(15)*2)
    SIRINA_W=0.366*KORAK_NAVOJA - PODIZANJE_VRHA_X2*0.5358   ;----(_ac*tan(15)*2)

  ENDIF

  ;testerasti
  IF (_Vrste_Navoja == 3)
    
    UGAO1=30
    UGAO2=3

    RADIUS1=0 ;0.12427*KORAK_NAVOJA
    RADIUS2=0

    PODIZANJE_VRHA_X2=0.11777*KORAK_NAVOJA
    ;BOK1=0.86777*KORAK_NAVOJA - PODIZANJE_VRHA_X2
    BOK1=0.75*KORAK_NAVOJA ;bez zazora x2
   
    SIRINA_W=(0.5*KORAK_NAVOJA) - ((0.375*KORAK_NAVOJA+PODIZANJE_VRHA_X2)*(TAN(SRAD(UGAO1))+TAN(SRAD(UGAO2))))
    PODIZANJE_PODNOZJA_X1=0
    
  ENDIF

  ;obli
  IF _Vrste_Navoja == 4
    
    BOK1=0.5*KORAK_NAVOJA
    UGAO1=15
    UGAO2=15

    RADIUS1=0.23851*KORAK_NAVOJA
    RADIUS2=0.23851*KORAK_NAVOJA

    PODIZANJE_PODNOZJA_X1=0
    PODIZANJE_VRHA_X2=0
    SIRINA_W=0.5*KORAK_NAVOJA ;na sredini

  ENDIF

  IF (RADIUS2 >= RNP("$TC_DP6["<<BrojAlata<<",1]")) and (RADIUS2 >= RNP("$TC_DP6["<<BrojAlata<<",2]"))
    ;RADIUS1.bc=10
    RADIUS2.bc=10 ;bela boja polja
  ELSE
    ;RADIUS1.bc=7
    RADIUS2.bc=7 ;crvena boja polja
  ENDIF

End_Press

PRESS(VS5)
   if (Slika.wr == 4)
      Slika.wr=1
   else
      Slika.wr=4
   endif
End_Press

PRESS(VS8)
  GC("NCCODE4")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS


change (PODIZANJE_VRHA_X2)

  ;trapezni
  IF _Vrste_Navoja == 2
    
    ;BOK1=0.5*KORAK_NAVOJA
    ;UGAO1=15
    ;UGAO2=15

    ;if KORAK_NAVOJA==1.5
      ;RADIUS2=0.075
      ;RADIUS1=0.15
      ;_ac=0.15
    ;endif
    ;if (KORAK_NAVOJA>=2) and (KORAK_NAVOJA<=5)
      ;RADIUS2=0.125
      ;RADIUS1=0.25
      ;_ac=0.25
    ;endif
    ;if (KORAK_NAVOJA>=6) and (KORAK_NAVOJA<=12)
      ;RADIUS2=0.25
      ;RADIUS1=0.5
      ;_ac=0.5
    ;endif
    ;if (KORAK_NAVOJA>=14) and (KORAK_NAVOJA<=44)
      ;RADIUS2=0.5
      ;RADIUS1=1.0
      ;_ac=1.0
    ;endif

    ;PODIZANJE_PODNOZJA_X1=0
    ;PODIZANJE_VRHA_X2=_ac
    SIRINA_W=0.366*KORAK_NAVOJA - PODIZANJE_VRHA_X2*0.5358   ;----(_ac*tan(15)*2)

  ENDIF

  ;testerasti
  IF _Vrste_Navoja == 3
    
    ;UGAO1=30
    ;UGAO2=3

    ;RADIUS1=0 
    ;RADIUS2=0

    ;PODIZANJE_VRHA_X2=0.11777*KORAK_NAVOJA

    ;BOK1=0.75*KORAK_NAVOJA; - PODIZANJE_VRHA_X2
   
    SIRINA_W=(0.5*KORAK_NAVOJA) - ((0.375*KORAK_NAVOJA+PODIZANJE_VRHA_X2)*(TAN(SRAD(UGAO1))+TAN(SRAD(UGAO2))))   ;----(_ac*tan(15)*2)
    ;PODIZANJE_PODNOZJA_X1=0
    
  ENDIF

  call ("PromeniSliku")
end_change


change (Bok1)
    call ("PromeniSliku")
end_change

change(_Vrste_Navoja)
   if (_Vrste_Navoja == 2) or (_Vrste_Navoja == 3)
   ;trapezni i testerasti
     SIRINA_W.wr=2
     PODIZANJE_VRHA_X2.wr=2
     ;PODIZANJE_PODNOZJA_X1.wr=2
   else
     SIRINA_W.wr=4
     PODIZANJE_VRHA_X2.wr=4
     ;PODIZANJE_PODNOZJA_X1.wr=2
   endif

   ;if (_Vrste_Navoja == 5) or (_Vrste_Navoja == 6)
   ;opsti
     ;VS4.se=2
   ;else
     ;VS4.se=1
   ;endif

   call ("PromeniSliku")
end_change

change(RADIUS2)
    IF (RADIUS2 >= RNP("$TC_DP6["<<BrojAlata<<",1]")) and (RADIUS2 >= RNP("$TC_DP6["<<BrojAlata<<",2]"))
      ;RADIUS1.bc=10
      RADIUS2.bc=10
    ELSE
      ;RADIUS1.bc=7
      RADIUS2.bc=7
    ENDIF

  ;metricki
  IF _Vrste_Navoja == 0
    PODIZANJE_PODNOZJA_X1=RADIUS2+0.1
  ENDIF

end_change

change(BrojAlata)
  call ("IzborAlata")

  IF (RADIUS2 >= RNP("$TC_DP6["<<BrojAlata<<",1]")) and (RADIUS2 >= RNP("$TC_DP6["<<BrojAlata<<",2]"))
    ;RADIUS1.bc=10
    RADIUS2.bc=10
  ELSE
    ;RADIUS1.bc=7
    RADIUS2.bc=7
  ENDIF
end_change

LOAD
   KORAK_NAVOJA.bc=9

   if ((_Vrste_Navoja == 2) or (_Vrste_Navoja == 3))
     ;trapezni i testerasti
     SIRINA_W.wr=2
     PODIZANJE_VRHA_X2.wr=2
     ;PODIZANJE_PODNOZJA_X1.wr=2
   else
     SIRINA_W.wr=4
     PODIZANJE_VRHA_X2.wr=4
     ;PODIZANJE_PODNOZJA_X1.wr=2
   endif

   ;if (_Vrste_Navoja == 5) or (_Vrste_Navoja == 6)
     ;opsti
     ;VS4.se=2
   ;else
     ;VS4.se=1
   ;endif

   LB("Funkcije","cthread_wheel_setup.com")
   ;BrojAlata=1
   call ("PromeniSliku")
   call ("IzborAlata")

  IF (RADIUS2 >= RNP("$TC_DP6["<<BrojAlata<<",1]")) and (RADIUS2 >= RNP("$TC_DP6["<<BrojAlata<<",2]"))
    ;RADIUS1.bc=10
    RADIUS2.bc=10
  ELSE
    ;RADIUS1.bc=7
    RADIUS2.bc=7
  ENDIF

END_LOAD

//END

//B(Funkcije)

SUB(PromeniSliku)

  BrojSlike=313
  slika.st = "\\al" << BrojSlike << ".png"

  ;privremene slike
  ;===========================================================================
  if (_Vrste_Navoja == 0)
    slika.st = "\\kam_trougao_1.png"
  endif

  if (_Vrste_Navoja == 1)
    slika.st = "\\kam_cevni_1.png"
  endif

  if (_Vrste_Navoja == 2)
    slika.st = "\\kam_trapez_1.png"
  endif

  if (_Vrste_Navoja == 3)
    slika.st = "\\kam_testera_1.png"
  endif

  if (_Vrste_Navoja == 4)
    slika.st = "\\kam_obli_1.png"
  endif
  ;===========================================================================

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

      ;kada je u pitanju tocilo
      ;if (Reg[1]==400)
         ;Alat.FC=1
         ;Alat = Round(Reg[3],4)<<"x"<<Round(Reg[4],4)
      ;else
         ;Alat.Fc=7
         ;Alat = "Alat nije tocilo"
      ;endif
      
      ;kada je u pitanju abrihter
      if (Reg[1]==490) or (Reg[1]==496)
         Alat.FC=1
         Alat = "D1: R"<<RNP("$TC_DP6["<<BrojAlata<<",1]")<<"   D2: R"<<RNP("$TC_DP6["<<BrojAlata<<",2]")
      else
         Alat.Fc=7
         Alat = "Alat nije dresser"
      endif


   Endif

END_SUB

//END

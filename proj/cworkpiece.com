//M(WorkpieceSetup)
;FB422 mart 2026
;DEFINICIJA KONTURE
DEF DefinicijaKonture = (I/* 0="Ravno", 3="Korisnicka kontura"/0/,"Definicija","","."/WR2///20,12,185/220,12,160)
DEF Precnik = (R4/0,450/100/,"Precnik konture","D",$89068/WR2///20,32,185/220,32,160)
DEF Pocetak = (R4/-1000,1000/0/,"Pocetak konture","Z1",$89068/WR2///20,52,185/220,52,160)
DEF Kraj = (R4/-1000,1000/0/,"Kraj konture","Z2",$89068/WR2///20,72,185/220,72,160)
DEF Korekcija1 = (R4/-1,1/0/,"Korekcija u sredini","K1",$89068/WR2///20,92,185/220,92,160)
DEF Korekcija2 = (R4/-1,1/0/,"Korekcija na kraju","K2",$89068/WR2///20,112,185/220,112,160)
DEF NazivKonture = (S///,"Naziv konture","",".spf"/WR2///20,132,185/220,132,160)
;MERNA GLAVA I PREKIDI FAZA (NacinUlaza / NacinIzlaza)
Def NacinUlaza = (I/*0="Bez merne glave",1="Sa mernom glavom"/0/,"Merna glava",,"."/WR2///20,168,185/220,168,160)
DEF Prekid1 = (I/0,7/0/,"Faza 1","","."/WR2///20,190,70/95,190,70)
DEF Prekid2 = (I/0,7/0/,"Faza 2","","."/WR2///160,190,70/235,190,70)
DEF Prekid3 = (I/0,7/0/,"Faza 3","","."/WR2///300,190,70/375,190,70)
DEF Prekid4 = (I/0,7/0/,"Faza 4","","."/WR2///20,212,70/95,212,70)
DEF Prekid5 = (I/0,7/0/,"Faza 5","","."/WR2///160,212,70/235,212,70)
DEF Prekid6 = (I/0,7/0/,"Faza 6","","."/WR2///300,212,70/375,212,70)
;PARAMETRI LINETE
DEF Lineta = (I/* 0="Bez Linete",1="Sa Linetom"/0/,"Nacin rada","-","."/WR2///20,248,185/220,248,160)
DEF PozUose = (R4/0,400/0/,"Pozicija ose","U",$89068/WR2///20,268,185/220,268,160)
DeF UlazLinete=(R1/0,400/0/,"Pozicija ulaska","L1",$89068/WR2///20,288,185/220,288,160)
DeF IzlazLinete=(R1/0,400/0/,"Pozicija izlaska","L2",$89068/WR2///20,308,185/220,308,160)
;NE KORISTE SE - SAKRIVENO, NA KRAJU DA NE PRAVI RAZMAK
Def DuzinaUlaza = (R1/0,25/0/,"Duzina ulaza","L1",$89068/wr4///0,0,1/0,0,1)
Def UgaoUlaza = (R1/-30,30/0/,"Ugao ulaza","A1",$89072/wr4///0,0,1/0,0,1)
Def NacinIzlaza = (I/0,777777/0/,"Nacin izlaza",,"."/wr4///0,0,1/0,0,1)
Def DuzinaIzlaza = (R1/0,25/0/,"Duzina izlaza","L2",$89068/wr4///0,0,1/0,0,1)
Def UgaoIzlaza = (R1/-30,30/0/,"Ugao izlaza","A2",$89072/wr4///0,0,1/0,0,1)
DeF StatusLinete=(IDD/0,400/0/,"Status","",""/WR4///0,0,1/0,0,1)



VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE3)
  "_Workpiece_Setup(""" NazivKonture """," DefinicijaKonture "," Precnik "," Pocetak "," Kraj "," Korekcija1 "," Korekcija2 "," NacinUlaza "," DuzinaUlaza "," UgaoUlaza "," NacinIzlaza "," DuzinaIzlaza "," UgaoIzlaza "," Lineta "," PozUose "," UlazLinete "," IzlazLinete "," StatusLinete  ")"
END_OUTPUT

CHANGE(DefinicijaKonture)
IF (DEFINICIJAKONTURE==3)
   Precnik.WR=4
   Pocetak.WR=4
   Kraj.WR=4
   Korekcija1.WR=4
   Korekcija2.WR=4
   NazivKonture.WR=2
ELSE
   Precnik.WR=2
   Pocetak.WR=2
   Kraj.WR=2
   Korekcija1.WR=2
   Korekcija2.WR=2
   NazivKonture.WR=4
ENDIF
END_CHANGE

CHANGE(NacinUlaza)
IF (NacinUlaza==0)
   Prekid1.WR=1
   Prekid2.WR=1
   Prekid3.WR=1
   Prekid4.WR=1
   Prekid5.WR=1
   Prekid6.WR=1
ELSE
   Prekid1.WR=2
   Prekid2.WR=2
   Prekid3.WR=2
   Prekid4.WR=2
   Prekid5.WR=2
   Prekid6.WR=2
ENDIF
END_CHANGE

PRESS(VS8)
  NacinIzlaza = Prekid1*100000+Prekid2*10000+Prekid3*1000+Prekid4*100+Prekid5*10+Prekid6
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
  RECT(5,6,560,148,133,127,1)
  RECT(5,158,560,78,133,132,1)
  RECT(5,242,560,88,134,131,1)
IF (DEFINICIJAKONTURE==3)
   Precnik.WR=4
   Pocetak.WR=4
   Kraj.WR=4
   Korekcija1.WR=4
   Korekcija2.WR=4
   NazivKonture.WR=2
ELSE
   Precnik.WR=2
   Pocetak.WR=2
   Kraj.WR=2
   Korekcija1.WR=2
   Korekcija2.WR=2
   NazivKonture.WR=4
ENDIF
Prekid1 = NacinIzlaza / 100000
Prekid2 = (NacinIzlaza / 10000) MOD 10
Prekid3 = (NacinIzlaza / 1000) MOD 10
Prekid4 = (NacinIzlaza / 100) MOD 10
Prekid5 = (NacinIzlaza / 10) MOD 10
Prekid6 = NacinIzlaza MOD 10
IF (NacinUlaza==0)
   Prekid1.WR=1
   Prekid2.WR=1
   Prekid3.WR=1
   Prekid4.WR=1
   Prekid5.WR=1
   Prekid6.WR=1
ELSE
   Prekid1.WR=2
   Prekid2.WR=2
   Prekid3.WR=2
   Prekid4.WR=2
   Prekid5.WR=2
   Prekid6.WR=2
ENDIF
END_LOAD

//END

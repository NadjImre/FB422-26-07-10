//M(WorkpieceSetup)
;FB422 mart 2026
;DEFINICIJA KONTURE
DEF DefinicijaKonture = (I/* 0="Ravno", 3="Korisnicka kontura"/0/,"Definicija","","."/WR2///235,,185/395,,160)
DEF Precnik = (R4/0,450/100/,"Precnik konture","D",$89068/WR2///235,,185/395,,160)
DEF Pocetak = (R4/-1000,1000/0/,"Pocetak konture","Z1",$89068/WR2///235,,185/395,,160)
DEF Kraj = (R4/-1000,1000/0/,"Kraj konture","Z2",$89068/WR2///235,,185/395,,160)
DEF Korekcija1 = (R4/-1,1/0/,"Korekcija u sredini","K1",$89068/WR2///235,,185/395,,160)
DEF Korekcija2 = (R4/-1,1/0/,"Korekcija na kraju","K2",$89068/WR2///235,,185/395,,160)
DEF NazivKonture = (S///,"Naziv konture","",".spf"/WR2///235,,185/395,,160)
;NE KORISTE SE - ZA BUDUCA PROSIRENJA
Def NacinUlaza = (I/*0="Bez ulaza",1="Konusno"/0/,"Nacin ulaza u konturu",,"."/wr4///235,,185/395,,160)
Def DuzinaUlaza = (R1/0,25/0/,"Duzina ulaza","L1",$89068/wr4///235,,185/395,,160)
Def UgaoUlaza = (R1/-30,30/0/,"Ugao ulaza","A1",$89072/wr4///235,,185/395,,160)
Def NacinIzlaza = (I/*0="Bez izlaza",1="Konusno"/0/,"Nacin izlaza iz konture",,"."/wr4///235,,185/395,,160)
Def DuzinaIzlaza = (R1/0,25/0/,"Duzina izlaza","L2",$89068/wr4///235,,185/395,,160)
Def UgaoIzlaza = (R1/-30,30/0/,"Ugao izlaza","A2",$89072/wr4///235,,185/395,,160)
;PARAMETRI LINETE
DEF Lineta = (I/* 0="Bez Linete",1="Sa Linetom"/0/,"Nacin rada","-","."/WR2///235,,185/395,,160)
DEF PozUose = (R4/0,400/0/,"Pozicija ose","U",$89068/WR2///235,,185/395,,160)
DeF UlazLinete=(R1/0,400/0/,"Pozicija ulaska","L1",$89068/WR2///235,,185/395,,160)
DeF IzlazLinete=(R1/0,400/0/,"Pozicija ulaska","L1",$89068/WR2///235,,185/395,,160)
DeF StatusLinete=(IDD/0,400/0/,"Status","",""/WR4///235,,185/395,,160)



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

PRESS(VS8)
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
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
END_LOAD

//END


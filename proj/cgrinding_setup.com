
//M(GrindingSetup/$89172)
;FB422

DEF RB0= (S//"RB"/,,,,/WR1///15,,140/6,10,23//"pomoc.html","9218"),
DUB0 = (S//"Dubina"/$89210/wr1////30,10,44//"pomoc.html","9218"),
PROL0 = (s//"Prol.Brus."/$89212/wr1////75,10,44//"pomoc.html","9218"),
ZBIR0 = (s//"Zbir3"/$89212,,,/wr1////120,10,44//"pomoc.html","9218"),
PROLDOABR0 = (s//"Prol.do"/$89212,,,/wr1////165,10,44//"pomoc.html","9218"),
PROLABR0=(s//"Prol.Abriht."/$89212,,,/wr1////210,10,44//"pomoc.html","9218"),
DUBABR0 = (s//"Dub.Abrihr."/$89212,,,/wr1////255,10,44//"pomoc.html","9218"),
PAUSA0 = (s//"Pausa5"/$89212,,,/wr1////300,10,44//"pomoc.html","9218"),
BRZABR0 = (s//"Brz.Abriht."/$89212,,,/wr1////345,10,44//"pomoc.html","9218"),
BRZKAMABR0 = (s//"Brz.kam.abr."/$89212,,,/wr1////390,10,44//"pomoc.html","9218"),
BRZROL0 = (s//"Brz.rolna"/$89212,,,/wr1////435,10,44//"pomoc.html","9218"),
BROBRTKOM0 = (s//"BrObrt.Kom."/$89212,,,/wr1////480,10,44//"pomoc.html","9218"),
BRZKAMBRUS0 = (s//"Brz.Kam.Brus."/$89212,,,/wr1////525,10,44//"pomoc.html","9218")

DEF RB1 = (I//1/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB1 = (R4/0,10/0.5/"Dubina brusenja po jednom prolazu"/////30,,44//"pomoc.html","9218"),
PROL1 = (I/0,1/100/"Broj prolaza brusenja za ovu fazu"/////75,,44//"pomoc.html","9218"),
ZBIR1 = (R4//0/"Kolicina materijala koji se skida u ovoj fazi",,,/wr1////120,,44//"pomoc.html","9218"),
PROLDOABR1 = (I//0/"Broj prolaza posle kojeg se radi abrihtovanje",,,/////164,,44//"pomoc.html","9218"),
PROLABR1=(I//0/"Broj prolaza poravnavanja za svako abrihtovanje",,,/////210,,44//"pomoc.html","9218"),
DUBABR1 = (R3//0/"Dubina za jedan prolaz abrihtovanja",,,/////255,,44//"pomoc.html","9218"),
PAUSA1 = (R3//0/$89212,,,/wr2////300,,44//"pomoc.html","9218"),
BRZABR1 = (I//100/"Brzina abrihtovanja",,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR1 = (R1//10/"Obimna brzina kamena kod abrihtovanja",,,/////390,,44//"pomoc.html","9218"),
BRZROL1 = (R1//-0.5/"Faktor brzine rolne (obimna brzina rolne/obimna brzina kamena)",,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM1 = (R1//10/"Broj obrtaja komada u toku brusenja",,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS1 = (R1//10/"Obimna brzina kamena kod brusenje",,,/////525,,44//"pomoc.html","9218")

DEF RB2 = (I//2/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB2 = (R4/0,10/0.5/$89210/////30,,44//"pomoc.html","9218"),
PROL2 = (I/0,1/1/$89212/////75,,44//"pomoc.html","9218"),
ZBIR2 = (R4//0/$89212,,,/wr1////120,,44//"pomoc.html","9218"),
PROLDOABR2 = (I//0/$89212,,,/////165,,44//"pomoc.html","9218"),
PROLABR2=(I//0/$89212,,,/////210,,44//"pomoc.html","9218"),
DUBABR2 = (R3//0/$89212,,,/////255,,44//"pomoc.html","9218"),
PAUSA2 = (R3//0/$89212,,,/wr2////300,,44//"pomoc.html","9218"),
BRZABR2 = (I//100/$89212,,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR2 = (R1//10/$89212,,,/////390,,44//"pomoc.html","9218"),
BRZROL2 = (R1//-0.5/$89212,,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM2 = (R1//10/$89212,,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS2 = (R1//10/$89212,,,/////525,,44//"pomoc.html","9218")

DEF RB3 = (I//3/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB3 = (R4/0,10/0.5/$89210/////30,,44//"pomoc.html","9218"),
PROL3 = (I/0,1/1/$89212/////75,,44//"pomoc.html","9218"),
ZBIR3 = (R4//0/$89212,,,/wr1////120,,44//"pomoc.html","9218"),
PROLDOABR3 = (I//0/$89212,,,/////165,,44//"pomoc.html","9218"),
PROLABR3=(I//0/$89212,,,/////210,,44//"pomoc.html","9218"),
DUBABR3 = (R3//0/$89212,,,/////255,,44//"pomoc.html","9218"),
PAUSA3 = (R3//0/$89212,,,/wr2////300,,44//"pomoc.html","9218"),
BRZABR3 = (I//100/$89212,,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR3 = (R1//10/$89212,,,/////390,,44//"pomoc.html","9218"),
BRZROL3 = (R1//-0.5/$89212,,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM3 = (R1//10/$89212,,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS3 = (R1//10/$89212,,,/////525,,44//"pomoc.html","9218") 

DEF RB4 = (I//4/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB4 = (R4/0,10/0.5/$89210/////30,,44//"pomoc.html","9218"),
PROL4 = (I/0,1/1/$89212/////75,,44//"pomoc.html","9218"),
ZBIR4 = (R4//0/$89212,,,/wr1////120,,44//"pomoc.html","9218"),
PROLDOABR4 = (I//0/$89212,,,/////165,,44//"pomoc.html","9218"),
PROLABR4=(I//0/$89212,,,/////210,,44//"pomoc.html","9218"),
DUBABR4 = (R3//0/$89212,,,/////255,,44//"pomoc.html","9218"),
PAUSA4 = (R3//0/$89212,,,/wr2////300,,44//"pomoc.html","9218"),
BRZABR4 = (I//100/$89212,,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR4 = (R1//10/$89212,,,/////390,,44//"pomoc.html","9218"),
BRZROL4 = (R1//-0.5/$89212,,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM4 = (R1//10/$89212,,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS4 = (R1//10/$89212,,,/////525,,44//"pomoc.html","9218") 

DEF RB5 = (I//5/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB5 = (R4/0,10/0.5/$89210/////30,,44//"pomoc.html","9218"),
PROL5 = (I/0,1/1/$89212/////75,,44//"pomoc.html","9218"),
ZBIR5 = (R4//0/$89212,,,/wr1////120,,44//"pomoc.html","9218"),
PROLDOABR5 = (I//0/$89212,,,/////165,,44//"pomoc.html","9218"),
PROLABR5=(I//0/$89212,,,/////210,,44//"pomoc.html","9218"),
DUBABR5 = (R3//0/$89212,,,/////255,,44//"pomoc.html","9218"),
PAUSA5 = (R3//0/$89212,,,/wr2////300,,44//"pomoc.html","9218"),
BRZABR5 = (I//100/$89212,,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR5 = (R1//10/$89212,,,/////390,,44//"pomoc.html","9218"),
BRZROL5 = (R1//-0.5/$89212,,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM5 = (R1//10/$89212,,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS5 = (R1//10/$89212,,,/////525,,44//"pomoc.html","9218")

DEF RB6 = (I//6/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB6 = (R4/0,10/0.5/$89210/////30,,44//"pomoc.html","9218"),
PROL6 = (I/0,1/1/$89212/////75,,44//"pomoc.html","9218"),
ZBIR6 = (R4//0/$89212,,,/wr1////120,,44//"pomoc.html","9218"),
PROLDOABR6 = (I//0/$89212,,,/////165,,44//"pomoc.html","9218"),
PROLABR6=(I//0/$89212,,,/////210,,44//"pomoc.html","9218"),
DUBABR6 = (R3//0/$89212,,,/////255,,44//"pomoc.html","9218"),
PAUSA6 = (R3//0/$89212,,,/wr2////300,,44//"pomoc.html","9218"),
BRZABR6 = (I//100/$89212,,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR6 = (R1//10/$89212,,,/////390,,44//"pomoc.html","9218"),
BRZROL6 = (R1//-0.5/$89212,,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM6 = (R1//10/$89212,,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS6 = (R1//10/$89212,,,/////525,,44//"pomoc.html","9218")

DEF ZBIR=(R4//0/$89212,,,/wr1////120,,44/10,126/)

DEF FILTER=(I/* 0=$89152, 150=$89079, 200=$89081, 300=$89516, 304=$89518, 840="Konturno"/0/,"Filter",,/wr2///400,175,100/450,175,120//)

DEF RB00= (S//"RB"/,,,,/WR1///15,200,140/6,200,23//"pomoc.html","9218"),
BrzOccil0 = (s//"Brzina_Osc"/$89212/wr1////30,200,50//"pomoc.html","9218"),
Korak0 = (s//"Korak"/$89212,,,/wr1////90,200,50//"pomoc.html","9218"),
Zadr01 = (s//"Zadr1"/$89212,,,/wr1////150,200,50//"pomoc.html","9218"),
Zadr02 = (s//"Zadr2"/$89212,,,/wr1////210,200,50//"pomoc.html","9218"),
Primicanje0=(s//"Prilaz"/$89212,,,/wr1////270,200,50//"pomoc.html","9218"),
BrzinaUsecanja0 = (s//"BrzUsec"/$89212,,,/wr1////330,200,50//"pomoc.html","9218"),
Oscil0 = (s//"Oscil lenght"/$89212,,,/wr1////390,200,50//"pomoc.html","9218"),
Izbrusavanje0 = (s//"Izbrus"/$89212,,,/wr1////450,200,50//"pomoc.html","9218"),
PrecnikOdskoka0 = (s//"PrecOdskok"/$89212,,,/wr1////510,200,50//"pomoc.html","9218")

DEF RB10 = (I//1/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
BrzOscil1 = (R3/0,6000/600//wr2////30,,50//"pomoc.html","9218"),
Korak1 = (R3/0,0.2/0.02//wr2////90,,50//"pomoc.html","9218"),
Zadr11 = (r1/-2,12/-2//wr2////150,,50//"pomoc.html","9218"),
Zadr12 = (r1/-2,12/-2//wr2////210,,50//"pomoc.html","9218"),
Primicanje1=(I/*0=$89156,1=$89157,-1=$89158/0/$89122/////270,,50//"pomoc.html","9226"),
BrzinaUsecanja1 = (R3/0,10/1/$89218/////330,,50//"pomoc.html","9219"),
Oscil1 = (R3/-10,10/0//wr2////390,,50//"pomoc.html","9218"),
Izbrusavanje1 = (r1/0,100/0//wr2////450,,50//"pomoc.html","9222"),
PrecnikOdskoka1 = (R3////wr2////510,,50//"pomoc.html","9218")

DEF RB20 = (I//2/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
BrzOscil2 = (R3/0,6000/600//wr2////30,,50//"pomoc.html","9218"),
Korak2 = (R3/0,0.2/0.02//wr2////90,,50//"pomoc.html","9218"),
Zadr21 = (r1/-2,12/-2//wr2////150,,50//"pomoc.html","9218"),
Zadr22 = (r1/-2,12/-2//wr2////210,,50//"pomoc.html","9218"),
Primicanje2=(I/*0=$89156,1=$89157,-1=$89158/0/$89122/////270,,50//"pomoc.html","9226"),
BrzinaUsecanja2 = (R3/0,10/1/$89218/////330,,50//"pomoc.html","9219"),
Oscil2 = (R3/-10,10/0//wr2////390,,50//"pomoc.html","9218"),
Izbrusavanje2 = (r1/0,100/0//wr2////450,,50//"pomoc.html","9222"),
PrecnikOdskoka2 = (R3////wr2////510,,50//"pomoc.html","9218")

DEF RB30 = (I//3/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
BrzOscil3 = (R3/0,6000/600//wr2////30,,50//"pomoc.html","9218"),
Korak3 = (R3/0,0.2/0.02//wr2////90,,50//"pomoc.html","9218"),
Zadr31 = (r1/-2,12/-2//wr2////150,,50//"pomoc.html","9218"),
Zadr32 = (r1/-2,12/-2//wr2////210,,50//"pomoc.html","9218"),
Primicanje3=(I/*0=$89156,1=$89157,-1=$89158/0/$89122/////270,,50//"pomoc.html","9226"),
BrzinaUsecanja3= (R3/0,10/1/$89218/////330,,50//"pomoc.html","9219"),
Oscil3 = (R3/-10,10/0//wr2////390,,50//"pomoc.html","9218"),
Izbrusavanje3 = (r1/0,100/0//wr2////450,,50//"pomoc.html","9222"),
PrecnikOdskoka3 = (R3////wr2////510,,50//"pomoc.html","9218")

DEF RB40 = (I//4/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
BrzOscil4 = (R3/0,6000/600//wr2////30,,50//"pomoc.html","9218"),
Korak4 = (R3/0,0.2/0.02//wr2////90,,50//"pomoc.html","9218"),
Zadr41 = (r1/-2,12/-2//wr2////150,,50//"pomoc.html","9218"),
Zadr42 = (r1/-2,12/-2//wr2////210,,50//"pomoc.html","9218"),
Primicanje4=(I/*0=$89156,1=$89157,-1=$89158/0/$89122/////270,,50//"pomoc.html","9226"),
BrzinaUsecanja4 = (R3/0,10/1/$89218/////330,,50//"pomoc.html","9219"),
Oscil4 = (R3/-10,10/0//wr2////390,,50//"pomoc.html","9218"),
Izbrusavanje4 = (r1/0,100/0//wr2////450,,50//"pomoc.html","9222"),
PrecnikOdskoka4 = (R3////wr2////510,,50//"pomoc.html","9218")

DEF RB50 = (I//5/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
BrzOscil5 = (R3/0,6000/600//wr2////30,,50//"pomoc.html","9218"),
Korak5 = (R3/0,0.2/0.02//wr2////90,,50//"pomoc.html","9218"),
Zadr51 = (r1/-2,12/-2//wr2////150,,50//"pomoc.html","9218"),
Zadr52 = (r1/-2,12/-2//wr2////210,,50//"pomoc.html","9218"),
Primicanje5=(I/*0=$89156,1=$89157,-1=$89158/0/$89122/////270,,50//"pomoc.html","9226"),
BrzinaUsecanja5 = (R3/0,10/1/$89218/////330,,50//"pomoc.html","9219"),
Oscil5 = (R3/-10,10/0//wr2////390,,50//"pomoc.html","9218"),
Izbrusavanje5 = (r1/0,100/0//wr2////450,,50//"pomoc.html","9222"),
PrecnikOdskoka5 = (R3////wr2////510,,50//"pomoc.html","9218")

DEF RB60 = (I//6/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
BrzOscil6 = (R3/0,6000/600//wr2////30,,50//"pomoc.html","9218"),
Korak6 = (R3/0,0.2/0.02//wr2////90,,50//"pomoc.html","9218"),
Zadr61 = (r1/-2,12/-2//wr2////150,,50//"pomoc.html","9218"),
Zadr62 = (r1/-2,12/-2//wr2////210,,50//"pomoc.html","9218"),
Primicanje6=(I/*0=$89156,1=$89157,-1=$89158/0/$89122/////270,,50//"pomoc.html","9226"),
BrzinaUsecanja6 = (R3/0,10/1/$89218/////330,,50//"pomoc.html","9219"),
Oscil6 = (R3/-10,10/0//wr2////390,,50//"pomoc.html","9218"),
Izbrusavanje6 = (r1/0,100/0//wr2////450,,50//"pomoc.html","9222"),
PrecnikOdskoka6 = (R3////wr2////510,,50//"pomoc.html","9218")

VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE1)
  "_GRINDING_SETUP(" RB1 "," DUB1 "," PROL1 "," PAUSA1 "," PROLDOABR1 "," PROLABR1 "," DUBABR1 "," BRZABR1 "," BRZKAMABR1 "," BRZROL1 "," BROBRTKOM1 "," BRZKAMBRUS1")"
  "_GRINDING_SETUP(" RB2 "," DUB2 "," PROL2 "," PAUSA2 "," PROLDOABR2 "," PROLABR2 ","  DUBABR2 "," BRZABR2 "," BRZKAMABR2 "," BRZROL2 "," BROBRTKOM2 "," BRZKAMBRUS2")" 
  "_GRINDING_SETUP(" RB3 "," DUB3 "," PROL3 "," PAUSA3 "," PROLDOABR3 "," PROLABR3 "," DUBABR3 "," BRZABR3 "," BRZKAMABR3 "," BRZROL3 "," BROBRTKOM3 "," BRZKAMBRUS3")"
 "_GRINDING_SETUP(" RB4 "," DUB4 "," PROL4 "," PAUSA4 "," PROLDOABR4 "," PROLABR4 "," DUBABR4 "," BRZABR4 "," BRZKAMABR4 "," BRZROL4 "," BROBRTKOM4 "," BRZKAMBRUS4 ")"
 "_GRINDING_SETUP(" RB5 "," DUB5 "," PROL5 "," PAUSA5 "," PROLDOABR5 "," PROLABR5 "," DUBABR5 "," BRZABR5 "," BRZKAMABR5 "," BRZROL5 "," BROBRTKOM5 "," BRZKAMBRUS5 ")"
 "_GRINDING_SETUP(" RB6 "," DUB6 "," PROL6 "," PAUSA6 "," PROLDOABR6 "," PROLABR6 "," DUBABR6 "," BRZABR6 "," BRZKAMABR6 "," BRZROL6 "," BROBRTKOM6 "," BRZKAMBRUS6")"

"_FEEDS("RB10","BrzOscil1","Korak1","Zadr11","Zadr12","Primicanje1","BrzinaUsecanja1","Oscil1","Izbrusavanje1","PrecnikOdskoka1")"
"_FEEDS("RB20","BrzOscil2","Korak2","Zadr21","Zadr22","Primicanje2","BrzinaUsecanja2","Oscil2","Izbrusavanje2","PrecnikOdskoka2")"
"_FEEDS("RB30","BrzOscil3","Korak3","Zadr31","Zadr32","Primicanje3","BrzinaUsecanja3","Oscil3","Izbrusavanje3","PrecnikOdskoka3")"
"_FEEDS("RB40","BrzOscil4","Korak4","Zadr41","Zadr42","Primicanje4","BrzinaUsecanja4","Oscil4","Izbrusavanje4","PrecnikOdskoka4")"
"_FEEDS("RB50","BrzOscil5","Korak5","Zadr51","Zadr52","Primicanje5","BrzinaUsecanja5","Oscil5","Izbrusavanje5","PrecnikOdskoka5")"
"_FEEDS("RB60","BrzOscil6","Korak6","Zadr61","Zadr62","Primicanje6","BrzinaUsecanja6","Oscil6","Izbrusavanje6","PrecnikOdskoka6")"
 END_OUTPUT

PRESS(VS8)
  GC("NCCODE1")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS


change(Dub1)
  zbir1=dub1*prol1
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change

change(Prol1)
  zbir1=dub1*prol1
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change


change(Dub2)
  zbir2=dub2*prol2
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change

change(Prol2)
  zbir2=dub2*prol2
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change


change(Dub3)
  zbir3=dub3*prol3
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change

change(Prol3)
  zbir3=dub3*prol3
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change


change(Dub4)
  zbir4=dub4*prol4
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change

change(Prol4)
  zbir4=dub4*prol4
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change


change(Dub5)
  zbir5=dub5*prol5
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change

change(Prol5)
  zbir5=dub5*prol5
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change


change(Dub6)
  zbir6=dub6*prol6
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change

change(Prol6)
  zbir6=dub6*prol6
  zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
end_change

CHANGE(FILTER)
  BrzOccil0.WR=1
  BrzOscil1.WR=2
  BrzOscil2.WR=2
  BrzOscil3.WR=2
  BrzOscil4.WR=2
  BrzOscil5.WR=2
  BrzOscil6.WR=2
  Korak0.WR=1
  Korak1.WR=2
  Korak2.WR=2
  Korak3.WR=2
  Korak4.WR=2
  Korak5.WR=2
  Korak6.WR=2
  Zadr01.WR=1
  Zadr11.WR=2
  Zadr21.WR=2
  Zadr31.WR=2
  Zadr41.WR=2
  Zadr51.WR=2
  Zadr61.WR=2
  Zadr02.WR=1
  Zadr12.WR=2
  Zadr22.WR=2
  Zadr32.WR=2
  Zadr42.WR=2
  Zadr52.WR=2
  Zadr62.WR=2
  Primicanje0.WR=1
  Primicanje1.WR=2
  Primicanje2.WR=2
  Primicanje3.WR=2
  Primicanje4.WR=2
  Primicanje5.WR=2
  Primicanje6.WR=2
  BrzinaUsecanja0.WR=1
  BrzinaUsecanja1.WR=2
  BrzinaUsecanja2.WR=2
  BrzinaUsecanja3.WR=2
  BrzinaUsecanja4.WR=2
  BrzinaUsecanja5.WR=2
  BrzinaUsecanja6.WR=2
  Oscil0.WR=1
  Oscil1.WR=2
  Oscil2.WR=2
  Oscil3.WR=2
  Oscil4.WR=2
  Oscil5.WR=2
  Oscil6.WR=2
  Izbrusavanje0.WR=1
  Izbrusavanje1.WR=2
  Izbrusavanje2.WR=2
  Izbrusavanje3.WR=2
  Izbrusavanje4.WR=2
  Izbrusavanje5.WR=2
  Izbrusavanje6.WR=2
  PrecnikOdskoka0.WR=1
  PrecnikOdskoka1.WR=2
  PrecnikOdskoka2.WR=2
  PrecnikOdskoka3.WR=2
  PrecnikOdskoka4.WR=2
  PrecnikOdskoka5.WR=2
  PrecnikOdskoka6.WR=2
  IF ((FILTER==150) OR (FILTER==300))
    Korak0.WR=4
    Korak1.WR=4
    Korak2.WR=4
    Korak3.WR=4
    Korak4.WR=4
    Korak5.WR=4
    Korak6.WR=4
    Zadr01.WR=4
    Zadr11.WR=4
    Zadr21.WR=4
    Zadr31.WR=4
    Zadr41.WR=4
    Zadr51.WR=4
    Zadr61.WR=4
    Zadr02.WR=4
    Zadr12.WR=4
    Zadr22.WR=4
    Zadr32.WR=4
    Zadr42.WR=4
    Zadr52.WR=4
    Zadr62.WR=4
    Primicanje0.WR=4
    Primicanje1.WR=4
    Primicanje2.WR=4
    Primicanje3.WR=4
    Primicanje4.WR=4
    Primicanje5.WR=4
    Primicanje6.WR=4
  ENDIF
  IF ((FILTER==200) OR (FILTER==840))
    BrzinaUsecanja0.WR=4
    BrzinaUsecanja1.WR=4
    BrzinaUsecanja2.WR=4
    BrzinaUsecanja3.WR=4
    BrzinaUsecanja4.WR=4
    BrzinaUsecanja5.WR=4
    BrzinaUsecanja6.WR=4
    Oscil0.WR=4
    Oscil1.WR=4
    Oscil2.WR=4
    Oscil3.WR=4
    Oscil4.WR=4
    Oscil5.WR=4
    Oscil6.WR=4
  ENDIF
  IF (FILTER==304)
    BrzOccil0.WR=4
    BrzOscil1.WR=4
    BrzOscil2.WR=4
    BrzOscil3.WR=4
    BrzOscil4.WR=4
    BrzOscil5.WR=4
    BrzOscil6.WR=4
    Korak0.WR=4
    Korak1.WR=4
    Korak2.WR=4
    Korak3.WR=4
    Korak4.WR=4
    Korak5.WR=4
    Korak6.WR=4
    Zadr01.WR=4
    Zadr11.WR=4
    Zadr21.WR=4
    Zadr31.WR=4
    Zadr41.WR=4
    Zadr51.WR=4
    Zadr61.WR=4
    Zadr02.WR=4
    Zadr12.WR=4
    Zadr22.WR=4
    Zadr32.WR=4
    Zadr42.WR=4
    Zadr52.WR=4
    Zadr62.WR=4
    Primicanje0.WR=4
    Primicanje1.WR=4
    Primicanje2.WR=4
    Primicanje3.WR=4
    Primicanje4.WR=4
    Primicanje5.WR=4
    Primicanje6.WR=4
    Oscil0.WR=4
    Oscil1.WR=4
    Oscil2.WR=4
    Oscil3.WR=4
    Oscil4.WR=4
    Oscil5.WR=4
    Oscil6.WR=4
  ENDIF
END_CHANGE

LOAD
   ;LA("OffOnNiz","cnizovi.com")
   RECT(5,8,565,150,133,127,1)
  RECT(5,200,565,150,133,132,1)
  ; line(5,10,570,10,7,1)  
   ;line(5,30,570,30,7,1)  
   ;line(5,365,570,365,7,1)  
RB1 = 1
RB2 = 2
RB3 = 3
RB4 = 4
RB5 = 5
RB6 = 6
DUB0 = "Dodatak"
PROL0 = "On/Off"
ZBIR0 = "Zbir"
PAUSA0 = "Dub. Z"
PROLDOABR0 = "Prol.do"
PROLABR0="Prol.Abriht."
DUBABR0 = "Dub.Abrihr."
BRZABR0 = "Brz.Abriht."
BRZKAMABR0 = "Brz.kam.abr."
BRZROL0 = "Brz.rolna"
BROBRTKOM0 = "BrObrt.Kom."
BRZKAMBRUS0 = "Brz.Kam.Brus."
RB00="RB"
BrzOccil0 = "Brzina_Osc"
Korak0 = "Korak"
Zadr01 = "Zadr1"
Zadr02 = "Zadr2"
Primicanje0="Prilaz"
BrzinaUsecanja0 = "BrzUsec"
Oscil0 = "Oscil lenght"
Izbrusavanje0 = "Izbrus"
PrecnikOdskoka0 = "PrecOdskok"
zbir6=dub6*prol6
zbir5=dub5*prol5
zbir4=dub4*prol4
zbir3=dub3*prol3
zbir2=dub2*prol2
zbir1=dub1*prol1
zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
END_LOAD

//END

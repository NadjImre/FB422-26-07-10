
//M(ThreadSetup/$89172////300,100)
;FB422

DEF RB0= (S//"RB"/,,,,/WR1///15,,140/6,10,23//"pomoc.html","9218"),
DUB0 = (S//"Dubina"/$89210/wr1////30,10,44//"pomoc.html","9218"),
PROL0 = (s//"Prol.Brus."/$89212/wr1////75,10,44//"pomoc.html","9218"),
ZBIR0 = (s//"Zbir"/$89212,,,/wr1////120,10,44//"pomoc.html","9218"),
PAUSA0 = (s//"Pausa"/$89212,,,/wr1////165,10,44//"pomoc.html","9218"),
PROLDOABR0 = (s//"Prol.do"/$89212,,,/wr1////210,10,44//"pomoc.html","9218"),
PROLABR0=(s//"Prol.Abriht."/$89212,,,/wr1////255,10,44//"pomoc.html","9218"),
DUBABR0 = (s//"Dub.Abrihr."/$89212,,,/wr1////300,10,44//"pomoc.html","9218"),
BRZABR0 = (s//"Brz.Abriht."/$89212,,,/wr1////345,10,44//"pomoc.html","9218"),
BRZKAMABR0 = (s//"Brz.kam.abr."/$89212,,,/wr1////390,10,44//"pomoc.html","9218"),
BRZROL0 = (s//"Brz.rolna"/$89212,,,/wr1////435,10,44//"pomoc.html","9218"),
BROBRTKOM0 = (s//"BrObrt.Kom."/$89212,,,/wr1////480,10,44//"pomoc.html","9218"),
BRZKAMBRUS0 = (s//"Brz.Kam.Brus."/$89212,,,/wr1////525,10,44//"pomoc.html","9218")

DEF RB1 = (I//1/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB1 = (R4/0,10/0.5/"Dubina brusenja po jednom prolazu"/////30,,44//"pomoc.html","9218"),
PROL1 = (I/0,100/1/"Broj prolaza brusenja za ovu fazu"/////75,,44//"pomoc.html","9218"),
ZBIR1 = (R4//0/"Kolicina materijala koji se skida u ovoj fazi",,,/wr1////120,,44//"pomoc.html","9218"),
PAUSA1 = (I//0/$89212,,,/wr2////165,,44//"pomoc.html","9218"),
PROLDOABR1 = (I//0/"Broj prolaza posle kojeg se radi abrihtovanje",,,/////210,,44//"pomoc.html","9218"),
PROLABR1=(I//0/"Broj prolaza poravnavanja za svako abrihtovanje",,,/////255,,44//"pomoc.html","9218"),
DUBABR1 = (R3//0/"Dubina za jedan prolaz abrihtovanja",,,/////300,,44//"pomoc.html","9218"),
BRZABR1 = (I//100/"Brzina abrihtovanja",,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR1 = (I//10/"Obimna brzina kamena kod abrihtovanja",,,/////390,,44//"pomoc.html","9218"),
BRZROL1 = (R1//-0.5/"Faktor brzine rolne (obimna brzina rolne/obimna brzina kamena)",,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM1 = (R1//10/"Broj obrtaja komada u toku brusenja",,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS1 = (R1//10/"Obimna brzina kamena kod brusenje",,,/////525,,44//"pomoc.html","9218")

DEF RB2 = (I//2/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB2 = (R4/0,10/0.5/$89210/////30,,44//"pomoc.html","9218"),
PROL2 = (I/0,100/1/$89212/////75,,44//"pomoc.html","9218"),
ZBIR2 = (R4//0/$89212,,,/wr1////120,,44//"pomoc.html","9218"),
PAUSA2 = (I//0/$89212,,,/wr2////165,,44//"pomoc.html","9218"),
PROLDOABR2 = (I//0/$89212,,,/////210,,44//"pomoc.html","9218"),
PROLABR2=(I//0/$89212,,,/////255,,44//"pomoc.html","9218"),
DUBABR2 = (R3//0/$89212,,,/////300,,44//"pomoc.html","9218"),
BRZABR2 = (I//100/$89212,,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR2 = (I//10/$89212,,,/////390,,44//"pomoc.html","9218"),
BRZROL2 = (R1//-0.5/$89212,,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM2 = (R1//10/$89212,,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS2 = (R1//10/$89212,,,/////525,,44//"pomoc.html","9218")

DEF RB3 = (I//3/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB3 = (R4/0,10/0.5/$89210/////30,,44//"pomoc.html","9218"),
PROL3 = (I/0,100/1/$89212/////75,,44//"pomoc.html","9218"),
ZBIR3 = (R4//0/$89212,,,/wr1////120,,44//"pomoc.html","9218"),
PAUSA3 = (I//0/$89212,,,/wr2////165,,44//"pomoc.html","9218"),
PROLDOABR3 = (I//0/$89212,,,/////210,,44//"pomoc.html","9218"),
PROLABR3=(I//0/$89212,,,/////255,,44//"pomoc.html","9218"),
DUBABR3 = (R3//0/$89212,,,/////300,,44//"pomoc.html","9218"),
BRZABR3 = (I//100/$89212,,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR3 = (I//10/$89212,,,/////390,,44//"pomoc.html","9218"),
BRZROL3 = (R1//-0.5/$89212,,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM3 = (R1//10/$89212,,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS3 = (R1//10/$89212,,,/////525,,44//"pomoc.html","9218")

DEF RB4 = (I//4/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB4 = (R4/0,10/0.5/$89210/////30,,44//"pomoc.html","9218"),
PROL4 = (I/0,100/1/$89212/////75,,44//"pomoc.html","9218"),
ZBIR4 = (R4//0/$89212,,,/wr1////120,,44//"pomoc.html","9218"),
PAUSA4 = (I//0/$89212,,,/wr2////165,,44//"pomoc.html","9218"),
PROLDOABR4 = (I//0/$89212,,,/////210,,44//"pomoc.html","9218"),
PROLABR4=(I//0/$89212,,,/////255,,44//"pomoc.html","9218"),
DUBABR4 = (R3//0/$89212,,,/////300,,44//"pomoc.html","9218"),
BRZABR4 = (I//100/$89212,,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR4 = (I//10/$89212,,,/////390,,44//"pomoc.html","9218"),
BRZROL4 = (R1//-0.5/$89212,,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM4 = (R1//10/$89212,,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS4 = (R1//10/$89212,,,/////525,,44//"pomoc.html","9218")

DEF RB5 = (I//5/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB5 = (R4/0,10/0.5/$89210/////30,,44//"pomoc.html","9218"),
PROL5 = (I/0,100/1/$89212/////75,,44//"pomoc.html","9218"),
ZBIR5 = (R4//0/$89212,,,/wr1////120,,44//"pomoc.html","9218"),
PAUSA5 = (I//0/$89212,,,/wr2////165,,44//"pomoc.html","9218"),
PROLDOABR5 = (I//0/$89212,,,/////210,,44//"pomoc.html","9218"),
PROLABR5=(I//0/$89212,,,/////255,,44//"pomoc.html","9218"),
DUBABR5 = (R3//0/$89212,,,/////300,,44//"pomoc.html","9218"),
BRZABR5 = (I//100/$89212,,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR5 = (I//10/$89212,,,/////390,,44//"pomoc.html","9218"),
BRZROL5 = (R1//-0.5/$89212,,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM5 = (R1//10/$89212,,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS5 = (R1//10/$89212,,,/////525,,44//"pomoc.html","9218")

DEF RB6 = (I//6/,,,,/wr1///15,,140/6,,23//"pomoc.html","9218"),
DUB6 = (R4/0,10/0.5/$89210/////30,,44//"pomoc.html","9218"),
PROL6 = (I/0,100/1/$89212/////75,,44//"pomoc.html","9218"),
ZBIR6 = (R4//0/$89212,,,/wr1////120,,44//"pomoc.html","9218"),
PAUSA6 = (I//0/$89212,,,/wr2////165,,44//"pomoc.html","9218"),
PROLDOABR6 = (I//0/$89212,,,/////210,,44//"pomoc.html","9218"),
PROLABR6=(I//0/$89212,,,/////255,,44//"pomoc.html","9218"),
DUBABR6 = (R3//0/$89212,,,/////300,,44//"pomoc.html","9218"),
BRZABR6 = (I//100/$89212,,,/////345,,44//"pomoc.html","9218"),
BRZKAMABR6 = (I//10/$89212,,,/////390,,44//"pomoc.html","9218"),
BRZROL6 = (R1//-0.5/$89212,,,/////435,,44//"pomoc.html","9218"),
BROBRTKOM6 = (R1//10/$89212,,,/////480,,44//"pomoc.html","9218"),
BRZKAMBRUS6 = (R1//10/$89212,,,/////525,,44//"pomoc.html","9218")

DEF ZBIR=(R4//0/$89212,,,/wr1////120,,44/10,126/)


VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE1)
  "_THREAD_SETUP(" RB1 "," DUB1 "," PROL1 "," PAUSA1 "," PROLDOABR1 "," PROLABR1 "," DUBABR1 "," BRZABR1 "," BRZKAMABR1 "," BRZROL1 "," BROBRTKOM1 "," BRZKAMBRUS1 ")"
  "_THREAD_SETUP(" RB2 "," DUB2 "," PROL2 "," PAUSA2 "," PROLDOABR2 "," PROLABR2 ","  DUBABR2 "," BRZABR2 "," BRZKAMABR2 "," BRZROL2 "," BROBRTKOM2 "," BRZKAMBRUS2 ")"
  "_THREAD_SETUP(" RB3 "," DUB3 "," PROL3 "," PAUSA3 "," PROLDOABR3 "," PROLABR3 "," DUBABR3 "," BRZABR3 "," BRZKAMABR3 "," BRZROL3 "," BROBRTKOM3 "," BRZKAMBRUS3 ")"
  "_THREAD_SETUP(" RB4 "," DUB4 "," PROL4 "," PAUSA4 "," PROLDOABR4 "," PROLABR4 ","DUBABR4 "," BRZABR4 "," BRZKAMABR4 "," BRZROL4 "," BROBRTKOM4 "," BRZKAMBRUS4 ")"
  "_THREAD_SETUP(" RB5 "," DUB5 "," PROL5 "," PAUSA5 "," PROLDOABR5 "," PROLABR5 "," DUBABR5 "," BRZABR5 "," BRZKAMABR5 "," BRZROL5 "," BROBRTKOM5 "," BRZKAMBRUS5 ")"
  "_THREAD_SETUP(" RB6 "," DUB6 "," PROL6 "," PAUSA6 "," PROLDOABR6 "," PROLABR6 "," DUBABR6 "," BRZABR6 "," BRZKAMABR6 "," BRZROL6 "," BROBRTKOM6 "," BRZKAMBRUS6 ")"
 
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

LOAD

   RECT(5,8,565,150,133,130,1)
   zbir6=dub6*prol6
   zbir5=dub5*prol5
   zbir4=dub4*prol4
   zbir3=dub3*prol3
   zbir2=dub2*prol2
   zbir1=dub1*prol1
   zbir=zbir1+zbir2+zbir3+zbir4+zbir5+zbir6
 
END_LOAD

//END

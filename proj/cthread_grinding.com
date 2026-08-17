//M(ThreadGrinding/$89440/"\\sh031.png"///10,10)
;pocetno podesavanje parmetara brusenja 
;za masinu FB422 sa masine FB412

DEF BRTOC = (S//"krug1"/,$89095////270,25,155/375,25,95//"pomoc.html","9007"),
DBROJTOC = (I/1,9/1/,,"D"////500,25,20/490,25,40)
Def NacinBrusenja= (IDD/*0="Off", 1="Navoj", 2="Navoj usecanjem", 3="Pritupljene 1", 4="Pritupljenje 2"/0/,"Nacin brusenja",,"-"/wr2///270,,130/375,,145)
DEF KORDSYS = (IDD/*1="G53", 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G515"/2/,$89454,""/WR2///270,,150/375,,95)
DEF UGAOZ = (R3/-180,180/0/,$89453,"B",$89072/LI3,///270,,130/375,,145//"pomoc.html","9044")
DEF PRECD2 = (R3/-450,450/9.026/,,"D2",$89068////270,,130/375,,145//"pom.html","M006")
DEF KORAK = (R4/0.25,80/1.5/,$89410,"P",$89068/LI3///270,,130/375,,145//"pom.html","M007")
DEF SMER = (IDD/* 0=$89413,1=$89412/0/,$89411,"L","."//"\\sh036.png"//270,,130/375,,145//"pom.html","M008")
DEF BROJPOCET = (IDD/1,100/1/,$89414,"n","."//"\\sh018.png"//270,,130/375,,145//"pom.html","M009")
Def StaBrusimo = (IDD/*0="Sve", 1="Samo pocetak:"/0/,"Brusimo sve?",,"-"/wr2///270,,130/375,,145),
KojiPocetak = (IDD/1,100/1/,,">",/wr2///500,,20/490,,40)
DEF PODHOD = (R3/0,20/3/,$89058,"xS",$89068/LI3,WR2///270,,130/375,,145//"pom.html","A003")
DEF RABHOD = (IDD/0,1000/60/,,"Vs",$89070/LI3,WR2///270,,130/375,,145//"pom.html","A003")
DEF VAR15 = (R4/,/0/$89065,$89065,,$89068/LI3,///270,,130/375,,145)
DEF VAR16 = (R4/,/0/$89066,$89066,,$89068/LI3,///270,,130/375,,145)
DEF HLADJENJE = (IDD/10,15/12/,$89452,,$89067/WR2,ac2///270,,130/375,,145//"pomoc.html","9009")
DEF KOMENT = (S///$89660,"Komentar:",////270,,80/330,,210//"pomoc.html","9024")
DEF Rezerva2 = (R4/,/0/$89102,$89103,"Z1",$89068/wr4///270,,130/375,,145//"pomoc.html","9012")
DEF Rezerva3 = (R4/,/0/$89104,,"Z2",$89068/wr4///270,,130/375,,145//"pomoc.html","9013")
def kombinovani1=(Idd///,"Kombinovani parametar",,"-"/wr1///270,,80/330,,210)
DEF RezervaStr = (S///$89660,"Kontura",/wr4///270,,80/330,,210//"pomoc.html","9024")

VS8=("OK",,SE1)
VS7=("Cancel",,SE1)

PRESS(VS8)
  kombinovani1=brojpocet+100*StaBrusimo*KojiPocetak
  Rezerva2=0
  Rezerva3=0
  RezervaStr=""
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS


;promene profila
CHANGE(StaBrusimo) 
  if (StaBrusimo==0)
     KojiPocetak.wr=4
  else
     KojiPocetak.wr=2
  endif
END_CHANGE

;promena levi-desni navoj
CHANGE(SMER)

END_CHANGE

OUTPUT(NCCODE3)
  "_THREAD_GRINDING(""" BRTOC """," DBROJTOC "," UGAOZ "," KORDSYS "," NacinBrusenja ","  PRECD2 "," KORAK "," SMER "," Kombinovani1 "," Rezerva2 "," Rezerva3 "," VAR15 "," VAR16 "," HLADJENJE "," PODHOD "," RABHOD ","""RezervaStr""","""KOMENT""")"
END_OUTPUT




LOAD
  lb("Funkcije","cnavoj.com")
  hlp="sh032.png"
  RECT(250,10,320,375,134,131,1)
  RECT(10,10,230,355,128,4)
  BrojPocet = Kombinovani1 mod 100
  KojiPocetak = (Kombinovani1 / 100) Mod 100
  if (KojiPocetak==0)
     StaBrusimo=0
  else
     StaBrusimo=1
  endif
  if (StaBrusimo==0)
     KojiPocetak.wr=4
  else
     KojiPocetak.wr=2
  endif
   call("Vidljivost")
END_LOAD


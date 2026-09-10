//M(ThreadGrinding/$89080/"\\sh031.png"///10,10)
;pocetno podesavanje parmetara brusenja 
;za masinu FB422 sa masine FB412

DEF BRTOC = (S//"krug1"/,$89022////270,25,155/375,25,95//"pomoc.html","9007"),
DBROJTOC = (I/1,9/1/,,"D"////500,25,20/490,25,40)
Def NacinBrusenja= (IDD/*0=$89033, 1=$89194, 2=$89195, 3=$89196, 4=$89197/0/,$89193,,"-"/wr2///270,,130/375,,145)
DEF KORDSYS = (IDD/*1="G53", 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G515"/2/,$89083,""/WR2///270,,150/375,,95)
DEF UGAOZ = (R3/-180,180/0/,$89082,"B",$89013/LI3,///270,,130/375,,145//"pomoc.html","9044")
DEF PRECD2 = (R3/-450,450/9.026/,,"D2",$89009////270,,130/375,,145//"pom.html","M006")
DEF KORAK = (R4/0.25,80/1.5/,$89073,"P",$89009/LI3///270,,130/375,,145//"pom.html","M007")
DEF SMER = (IDD/* 0=$89076,1=$89075/0/,$89074,"L","."//"\\sh036.png"//270,,130/375,,145//"pom.html","M008")
DEF BROJPOCET = (IDD/1,100/1/,$89077,"n","."//"\\sh018.png"//270,,130/375,,145//"pom.html","M009")
Def StaBrusimo = (IDD/*0=$89199, 1=$89200/0/,$89198,,"-"/wr2///270,,130/375,,145),
KojiPocetak = (IDD/1,100/1/,,">",/wr2///500,,20/490,,40)
DEF PODHOD = (R3/0,20/3/,$89004,"xS",$89009/LI3,WR2///270,,130/375,,145//"pom.html","A003")
DEF RABHOD = (IDD/0,1000/60/,,"Vs",$89011/LI3,WR2///270,,130/375,,145//"pom.html","A003")
DEF VAR15 = (R4/,/0/$89006,$89006,,$89009/LI3,///270,,130/375,,145)
DEF VAR16 = (R4/,/0/$89007,$89007,,$89009/LI3,///270,,130/375,,145)
DEF HLADJENJE = (IDD/10,15/12/,$89081,,$89008/WR2,ac2///270,,130/375,,145//"pomoc.html","9009")
DEF KOMENT = (S///$89126,$89103,////270,,80/330,,210//"pomoc.html","9024")
DEF Rezerva2 = (R4/,/0/$89025,$89026,"Z1",$89009/wr4///270,,130/375,,145//"pomoc.html","9012")
DEF Rezerva3 = (R4/,/0/$89027,,"Z2",$89009/wr4///270,,130/375,,145//"pomoc.html","9013")
def kombinovani1=(Idd///,$89201,,"-"/wr1///270,,80/330,,210)
DEF RezervaStr = (S///$89126,$89202,/wr4///270,,80/330,,210//"pomoc.html","9024")

VS8=($89163,,SE1)
VS7=($89157,,SE1)

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


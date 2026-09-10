
//M(Grinding/$89016)
;FB290 februar 2020

DEF BRTOC = (S//"krug1"/,$89045////235,25,190/375,25,95//"pomoc.html","9007"),
DEF DBROJTOC = (I/1,9/1/,,"D"////500,25,20/500,25,40)

DEF NACBRUS = (I/* 0=$89037, 150=$89017, 200=$89018, 300=$89089, 304=$89090, 840=$89177 /0/,$89000,,////235,,120/375,,150//"pomoc.html","9008")
DEF UGAOB = (R3/-180,180/0/,$89082,"B",$89013/LI3,///235,,120/375,,200//"pomoc.html","9044")
DEF PRILAZ = (I/*-1=$89111,0=$89105,1=$89106,2=$89107,3=$89108/0/,$89109,,"."/WR2///235,,165/375,,200//"pomoc.html","9015")
DEF XSAFE = (R1//0/,$89110,"X",////235,,165/375,,60),
ZSAFE = (R1//0/,,"Z",$89009/WR2///465,,25/465,,110)
DEF SMER = (I/* 0=$89046,1=$89047/0/,$89052,,/wr2///235,,120/375,,150)

DEF PREC0 = (R4/-1000,1000/50/$89023,$89024,"D1",/LI3,///235,,160/375,,60//"pomoc.html","9010"),
PREC1 = (R4/-1000,1000/50/$89023,,"D2",$89009/LI3,///465,,20/465,,110//"pomoc.html","9011")

DEF POZZ1 = (R4//0/$89025,$89026,"Z1",////235,,160/375,,60//"pomoc.html","9012"),
POZZ2 = (R4//0/$89027,,"Z2",$89009////465,,20/465,,110//"pomoc.html","9013")

DEF BROJMER = (I/0,90/0/,$89091,"x",/wr4///235,,165/375,,60),
BROJMERZ = (I/0,90/0/,,"z",$89008/wr4///465,,25/465,,110)

DEF VAR15 = (R4/-10,10/0/$89006,$89006,,/LI3,///235,,165/375,,60),
VAR25 = (R4///,,,$89009/Wr4///465,,18/465,,110)

DEF VAR16 = (R4/-10,10/0/$89007,$89007,,/LI3,///235,,165/375,,60),
VAR26 = (R4///,,,$89009/WR4,///465,,25/465,,110)
DEF KompC = (R4/-360,360/0/$89006,$89178,,/LI3,///235,,165/375,,60)
DEF MARPOSS = (IDD/0,9/0/$89131,$89179,"","-"////235,,145/375,,110//"pomoc.html","9311")
DEF KORDSYS = (IDD/* 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G515"/2/,$89083,""/WR2///235,,145/375,,60)
DEF OBLIK = (IDD/* 0=$89070, 1=$89071/0/,$89069,,/wr2///235,,145/375,,110//"pomoc.html","9005")

DEF HLADJENJE = (IDD/10,15/12/,$89081,,$89008/WR2,ac2///235,,145/375,,110//"pomoc.html","9009")

DEF ODSKOK = (I/*0=$89092,1=$89093,2=$89094,-1=$89065,-2=$89066, -3=$89067/0/,$89095,,/WR2///235,,145/375,,110//"pomoc.html","9015")

DEF PRECODSKOK = (R1/0,1000/0/,$89096,"",$89009/LI3,WR2///235,,145/375,,110//"pomoc.html","9016")

DEF KOMENT = (S///,$89103,////235,,110/235,,305//"pomoc.html","9017")

DEF Slika = (I///,,,/wr1///0,0,250,360/0,320,25,2) 


VS8=($89163,,se1)
VS7=($89157,,se1)

OUTPUT(NCCODE2)
  "_GRINDING(""" BRTOC """," DBROJTOC "," NACBRUS "," PRILAZ "," XSAFE "," ZSAFE "," UGAOB "," SMER "," PREC0 "," PREC1 "," POZZ1 "," POZZ2 "," BROJMER "," BROJMERZ "," VAR15 "," VAR16 "," KORDSYS "," OBLIK ","MARPOSS"," HLADJENJE ", "ODSKOK", "PRECODSKOK","KompC",""" KOMENT  """)"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE2")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
   if (((NACBRUS==214) OR (NACBRUS==300) OR (NACBRUS==304) OR (NACBRUS==320)) AND (OBLIK==0))
      SMER.WR=2
   else
      SMER=0
      SMER.WR=1
   endif
   slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
   if (NacBrus==840)
       PREC0.wr=1
       PREC1.WR=1
       POZZ1.WR=1
       POZZ2.WR=1
   else
       PREC0.wr=2
       PREC1.WR=2
       POZZ1.WR=2
       POZZ2.WR=2
   endif
END_LOAD

CHANGE(SMER)
   slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
END_CHANGE

CHANGE(NACBRUS)
   if (((NACBRUS==300) OR (NACBRUS==304) OR (NACBRUS==320)) AND (OBLIK==0))
      SMER.WR=2
      slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
   else
      SMER=0
      SMER.WR=1
   endif
   if (NacBrus==840)
       PREC0.wr=1
       PREC1.WR=1
       POZZ1.WR=1
       POZZ2.WR=1
   else
       PREC0.wr=2
       PREC1.WR=2
       POZZ1.WR=2
       POZZ2.WR=2
   endif
END_CHANGE

CHANGE(OBLIK)
   if (((NACBRUS==300) OR (NACBRUS==304) OR (NACBRUS==320)) AND (OBLIK==0))
      slika.st = "\\sm" << NACBRUS+2*OBLIK+SMER<< ".png"
      SMER.WR=2
   else
      SMER=0
      SMER.WR=1
   endif
END_CHANGE

//END

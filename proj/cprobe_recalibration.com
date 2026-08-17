//M(probe_recalibration)
;maska za REKALIBRACIJU po X osi
;prvi put na FB422
;JUN 2026
DEF Sonda = (S//"zonda"/$89759,$89464////235,,210/395,,75//"pomoc.html","9701"),
DBROJSonde = (I/1,9/1/$89760,,"D"////500,,20/500,,40//"pomoc.html","9702")

DEF xNOM = (R3/-1000,1000/0/$89766,$89545,"X",$89068////235,,185/395,,160//"pomoc.html","9705")

DEF ZNOM = (R3/-1000,1000/0/$89768,$89546,"Z",$89068////235,,185/395,,160//"pomoc.html","9706")

DEF DuzMer = (R1/-100,100/10/$89762,$89486,"B",$89068/LI3,///235,,185/395,,160//"pomoc.html","9703")

DEF BrzMer = (I/1,1500/60/$89764,$89484,"V",$89070/WR2///235,,185/395,,160//"pomoc.html","9704")

DEF MSonde = (I/21,35/23/$89770,$89769,"-","."/WR2///235,,185/395,,160//"pomoc.html","9707")

DEF BrojSonde = (I/1,2/1/$89772,$89489,"-","."/WR2///235,,185/395,,160//"pomoc.html","9708")

DEF KORDSYS = (IDD/*1="G53", 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G515"/2/$89777,$89454,"","."/WR2///235,,165/395,,160//"pomoc.html","9710")

DEF DOZRAZ = (R3/-1,1/0/$89776,$89775,"D",$89068////235,,185/395,,160//"pomoc.html","9711")
DEF BrojPonavljanja = (I/0,15/1/,"Broj ponavljanja merenja","-","."/WR2///235,,185/395,,160//"pomoc.html","9708")

def TREBAC = (I/*0=$89155, 1=$89154/0/,$89551,"","."/WR2///235,,165/395,,160//"pomoc.html","9709")
DEF CNOM = (R3/0,359.999/0/$89768,$89552,"",$89072////235,,185/395,,160//"pomoc.html","9706")
DEF STATUS = (IDD//1/,"Status code",,"-"/WR2///235,,185/395,,160//"pomoc.html","9709")
VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE3)
  "_PROBE_RECALIBRATION(""" SONDA """," DBROJSONDE "," xnom "," znom "," DUZMER "," BRZMER "," Msonde "," BRojsonde "," STATUS "," kordsys "," DOZRAZ " , " TREBAC " , " CNOM ")"
END_OUTPUT

PRESS(VS8)
  STATUS=BROJPONAVLJANJA
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
  LS("MENU","CMENI.COM",1)
  Rect(215,5,375,366,127,133,1)
  BROJPONAVLJANJA = STATUS
END_LOAD

//END


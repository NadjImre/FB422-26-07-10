//M(probe_thread)
;maska za merenje sredine zljeba
;prvi put na FB422
;maj 2026
def KOREKCIJA = (IDD/*0="Without measure", 1="Measure only", 2="With correction", 3="With recalibration" , 4="Measure setup"/0/,"Measuring method","-","."/WR2///235,15,185/395,15,195//"pomoc.html","9709")
DEF Sonda = (S//"zonda"/$89759,$89464////235,,210/395,,75//"pomoc.html","9701"),
DBROJSonde = (I/1,9/1/$89760,,"D"////500,,20/500,,40//"pomoc.html","9702")

DEF xNOM = (R3/-1000,1000/0/$89766,$89545,"X",$89068////235,,185/395,,160//"pomoc.html","9705")

DEF xStart = (R3/-1000,1000/0/$89766,$89545,"X",$89068////235,,185/395,,160//"pomoc.html","9705")

DEF zNOM = (R3/-1000,1000/0/$89768,$89546,"Z",$89068////235,,185/395,,160//"pomoc.html","9706")

DEF DuzMer = (R1/-100,100/10/$89762,$89486,"B",$89068/LI3,///235,,185/395,,160//"pomoc.html","9703")

DEF KorakMer = (R1/-99,99/10/$89762,$89486,"B",$89068/LI3,///235,,185/395,,160//"pomoc.html","9703")

DEF BrzMer = (I/1,1500/60/$89764,$89484,"V",$89070/WR2///235,,185/395,,160//"pomoc.html","9704")

DEF MSonde = (I/21,25/23/$89770,$89769,"-","."/WR2///235,,185/395,,160//"pomoc.html","9707")

DEF BrojSonde = (I/1,2/1/$89772,$89489,"-","."/WR2///235,,185/395,,160//"pomoc.html","9708")



DEF KORDSYS = (IDD/*1="G53", 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G515"/2/$89777,$89454,"","."/WR2///235,,165/395,,160//"pomoc.html","9710")

DEF DOZRAZ = (R3/-1,1/0/$89776,$89775,"D",$89068////235,,185/395,,160//"pomoc.html","9711")
DEF BrojPonavljanja = (I/1,16/1/,"Broj ponavljanja merenja","-","."/WR4///235,,185/395,,160//"pomoc.html","9708")
DEF BrojUgaono = (I/1,16/1/,"Broj merenja po uglu","-","."/WR4///235,,185/395,,160//"pomoc.html","9708")
DEF VRACANJE=(IDD/*0="DA",16="NE",32="SAMO PO X",48="SAMO PO Z"/0/,"Vracanje u pocetni polozaj","","-"/WR4///235,,185/395,,160//"pomoc.html","9709")
def DIZANJE=(idd/*0="da",64="ne"/0/,"podizanje sonde na kraju","","-"/WR4///235,,185/395,,160//"pomoc.html","9709")
def TREBAC = (I/*0=$89155, 1=$89154/0/,$89551,"","."/WR4///235,,165/395,,160//"pomoc.html","9709")
DEF CNOM = (R3/0,359.999/0/$89768,$89552,"",$89072/WR4///235,,185/395,,160//"pomoc.html","9706")
DEF STATUS = (IDD//0/,"Status code",,"-"/WR4///235,,185/395,,160//"pomoc.html","9709")
VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE3)
  "_PROBE_THREAD(""" SONDA """," DBROJSONDE "," xnom "," xstart "," znom "," DUZMER "," KorakMer "," BRZMER "," Msonde "," BRojsonde "," STATUS "," kordsys "," DOZRAZ " , " TREBAC " , " CNOM ")"
END_OUTPUT

PRESS(VS8)
  STATUS=KOREKCIJA+DIZANJE+VRACANJE+(BROJPONAVLJANJA-1)*128+(BROJUGAONO-1)*2048
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
  LS("MENU","CMENI.COM",1)
  Rect(215,5,375,366,127,133,1)
  KOREKCIJA = STATUS BAND 15
  VRACANJE = STATUS BAND 48
  DIZANJE = STATUS BAND 64
  BROJPONAVLJANJA = ((STATUS SHR 7) band 15)+1
  BROJUGAONO = ((STATUS SHR 11) band 15)+1
  xNom=RNP("me_th_diameter")
  zNom=RNP("me_th_position")
  xStart = RNP("me_th_startdia")
END_LOAD

//END


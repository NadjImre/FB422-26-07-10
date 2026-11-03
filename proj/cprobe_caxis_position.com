//M(probe_caxis_position)
;maska za merenje položaja žljeba na komadu 
;u pravcu C ose, prvi put na FB422
;maj 2026
def KOREKCIJA = (IDD/*0=$89244, 1=$89245, 2=$89246, 3=$89247, 4=$89248/0/,$89243,"-","."/WR2///235,15,185/395,15,195//"pomoc.html","9709")
DEF Sonda = (S//"zonda"/$89135,$89085////235,,210/395,,75//"pomoc.html","9701"),
DBROJSonde = (I/1,9/1/$89136,,"D"////500,,20/500,,40//"pomoc.html","9702")
DEF UGAOB = (R3/-180,180/0/,$89082,"B",$89013/LI3,///235,,120/395,,160//"pomoc.html","9044")
DEF PRILAZ = (I/*0=$89111,32768=$89105,65536=$89106,98304=$89107,131072=$89108/0/,$89109,,"."/WR2///235,,165/395,,160//"pomoc.html","9015")
DEF XSAFE = (R1//0/,$89110,"X",////235,,185/395,,50),
ZSAFE = (R1//0/,,"Z",$89009/WR2///470,,20/465,,90)
DEF xNOM = (R3/-1000,1000/0/$89139,$89098,"X",$89009////235,,185/395,,160//"pomoc.html","9705")

DEF zNOM = (R3/-1000,1000/0/$89140,$89099,"Z",$89009////235,,185/395,,160//"pomoc.html","9706")

Def cCalib = (R3/0,360/0/$89140,"","C",$89013////235,,185/395,,160//"pomoc.html","9706")

DEF DuzMer = (R1/-100,100/10/$89137,$89087,"B",$89009/LI3,///235,,185/395,,160//"pomoc.html","9703")

DEF DuzMerC = (R1/0,180/30/$89137,"","Fi",$89013/LI3,///235,,185/395,,160//"pomoc.html","9703")

DEF BrzMer = (I/1,1500/60/$89138,$89086,"V",$89011/WR2///235,,185/395,,160//"pomoc.html","9704")

DEF BrzMerC = (I/1,1800/360/$89138,"","Vc","-"/WR2///235,,185/395,,160//"pomoc.html","9704")


DEF BrojSonde = (I/1,2/1/$89143,$89088,"-","."/WR2///235,,185/395,,160//"pomoc.html","9708")

DEF KORDSYS = (IDD/*1="G53", 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G515"/2/$89146,$89083,"","."/WR2///235,,165/395,,160//"pomoc.html","9710")

DEF DOZRAZ = (R3/-180,180/0/$89145,$89144,"D",$89009////235,,185/395,,160//"pomoc.html","9711")

DEF VRACANJE = (I/*0=$89092,16=$89093,32=$89094/0/,$89095,"","-"/WR2///235,,145/395,,160//"pomoc.html","9015")
DEF PRECODSKOK = (R1/0,1000/0/,$89096,"",$89009/LI3,WR2///235,,145/395,,160//"pomoc.html","9016")
def DIZANJE=(idd/*0=$89038,64=$89039/0/,$89260,"","-"/WR2///235,,185/395,,160//"pomoc.html","9709")
DEF STATUS = (IDD//0/,$89261,,"-"/WR4///235,,185/395,,160//"pomoc.html","9709")
VS8=($89163,,se1)
VS7=($89157,,se1)

OUTPUT(NCCODE3)
  "_PROBE_CAXIS(""" SONDA """," DBROJSONDE "," xnom "," znom "," cCalib "," DUZMER "," DuzMerC "," BRZMER "," BrzMerC "," BRojsonde "," STATUS "," kordsys "," DOZRAZ "," xsafe "," zsafe "," ugaob "," PRECODSKOK ")"
END_OUTPUT

PRESS(VS8)
  STATUS=KOREKCIJA+DIZANJE+VRACANJE+PRILAZ
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
  LS("MENU","CMENI.COM",1)
  Rect(215,5,375,520,127,133,1)
  KOREKCIJA = STATUS BAND 15
  VRACANJE = STATUS BAND 48
  DIZANJE = STATUS BAND 64
  PRILAZ = STATUS BAND 229376
  xNom=RNP("me_c_diameter")
  zNom=RNP("me_c_position")
  cCalib = RNP("me_c_calibration")
END_LOAD

//END


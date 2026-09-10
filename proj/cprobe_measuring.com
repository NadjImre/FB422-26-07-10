//M(probe_measuring)
;maska za merenje po X i Z osi
;prvi put na FB422
;april 2026
def KOREKCIJA = (IDD/*0=$89244, 1=$89249, 2=$89250, 3=$89251, 4=$89252, 5=$89253, 6=$89254, 7=$89255, 8=$89256/0/,$89243,"-","."/WR2///235,15,185/395,15,195//"pomoc.html","9709")
DEF Sonda = (S//"zonda"/$89135,$89085////235,,210/395,,75//"pomoc.html","9701"),
DBROJSonde = (I/1,9/1/$89136,,"D"////500,,20/500,,40//"pomoc.html","9702")

DEF xNOM = (R3/-1000,1000/0/$89139,$89098,"X",$89009////235,,185/395,,160//"pomoc.html","9705")

DEF ZNOM = (R3/-1000,1000/0/$89140,$89099,"Z",$89009////235,,185/395,,160//"pomoc.html","9706")

DEF DuzMer = (R1/-100,100/10/$89137,$89087,"B",$89009/LI3,///235,,185/395,,160//"pomoc.html","9703")

DEF BrzMer = (I/1,1500/60/$89138,$89086,"V",$89011/WR2///235,,185/395,,160//"pomoc.html","9704")

DEF MSonde = (I/21,35/23/$89142,$89141,"-","."/WR2///235,,185/395,,160//"pomoc.html","9707")

DEF BrojSonde = (I/1,2/1/$89143,$89088,"-","."/WR2///235,,185/395,,160//"pomoc.html","9708")



DEF KORDSYS = (IDD/*1="G53", 2="G54",3="G55",4="G56",5="G57",6="G505",7="G506",8="G507",9="G508",10="G509",11="G510",12="G511",13="G512",14="G513",15="G514",16="G515",17="G515"/2/$89146,$89083,"","."/WR2///235,,165/395,,160//"pomoc.html","9710")

DEF DOZRAZ = (R3/-1,1/0/$89145,$89144,"D",$89009////235,,185/395,,160//"pomoc.html","9711")
DEF BrojPonavljanja = (I/1,16/1/,$89257,"-","."/WR2///235,,185/395,,160//"pomoc.html","9708")
DEF BrojUgaono = (I/1,16/1/,$89258,"-","."/WR2///235,,185/395,,160//"pomoc.html","9708")
DEF VRACANJE=(IDD/*0=$89038,16=$89039,32=$89262,48=$89263/0/,$89259,"","-"/WR2///235,,185/395,,160//"pomoc.html","9709")
def DIZANJE=(idd/*0=$89038,64=$89039/0/,$89260,"","-"/WR2///235,,185/395,,160//"pomoc.html","9709")
def TREBAC = (I/*0=$89039, 1=$89038/0/,$89100,"","."/WR2///235,,165/395,,160//"pomoc.html","9709")
DEF CNOM = (R3/0,359.999/0/$89140,$89101,"",$89013////235,,185/395,,160//"pomoc.html","9706")
DEF STATUS = (IDD//0/,$89261,,"-"/WR2///235,,185/395,,160//"pomoc.html","9709")
VS8=($89163,,se1)
VS7=($89157,,se1)

OUTPUT(NCCODE3)
  "_PROBE_MEASURING(""" SONDA """," DBROJSONDE "," xnom "," znom "," DUZMER "," BRZMER "," Msonde "," BRojsonde "," STATUS "," kordsys "," DOZRAZ " , " TREBAC " , " CNOM ")"
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
END_LOAD

//END


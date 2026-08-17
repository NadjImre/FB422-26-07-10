
//M(DressingSetup/$89151)
;FB422
;FEBRUAR 2026

DEF BrojToc = (S//"krug1"/$89642,$89190////235,5,190/375,5,95//"pomoc.html","9007")
DEF DBrojTocLevo = (I/1,9/1/$89643,,"D1"////500,5,20/505,5,35//"pomoc.html","9008")
DEF DBrojTocDesno = (I/1,9/1/$89643,,"D1"////500,,20/505,,35//"pomoc.html","9008")
DEF BrojAbriht = (S//"almaz1"/$89684,$89813////235,45,190/375,45,95//"pomoc.html","9301")
DEF DBrojAbrihtLevo = (I/1,9/1/$89685,,"D1"/wr2///500,45,20/505,45,35//"pomoc.html","9302")
DEF DBrojAbrihtDesno = (I/1,9/2/$89685,,"D2"/wr2///500,65,20/505,65,35//"pomoc.html","9302")
DEF UgaoBose = (R3/-180,180/0/,$89453,"B",$89072/LI3,///235,,165/375,,200//"pomoc.html","9044")
DEF NacinPrilaza = (I/*-1=$89607,0=$89601,1=$89602,2=$89603,3=$89604/0/,$89605,,"."/WR2///235,,165/375,,200//"pomoc.html","9015")
DEF XSAFE = (R1//0/,$89606,"X",////235,,165/375,,60),
ZSAFE = (R1//0/,,"Z",$89068/WR2///465,,25/465,,110)
DEF NacinAbrihtLevo = (I/* 0=$89135, 1="Samo precnik", 2="Samo celo", 3="Precnik i celo", 4="Konturno", 5="Sa rolnom" /0/,"Alat",,"-"/WR2///235/375,,200//"POMOC.HTML","9302")
DEF PROGABRIHTLEVO = (S//""/$89689,$89864,,".dsr"/WR2///235/375,,200//"pomoc.html","9314")
DEF NACINABRIHTDesno = (I/* 0=$89135, 10="Samo precnik", 20="Samo celo", 30="Precnik i celo", 40="Konturno"/0/,"Alat",,"-"/WR2///235/375,,200//"POMOC.HTML","9302")
DEF PROGABRIHTDESNO = (S//""/$89689,$89864,,".dsr"/WR2///235/375,,200//"pomoc.html","9314")
DEF MARPOSS = (IDD/0,9/0/$89696,"Broj Marposs cikusa","","-"////235,,180/375,,200//"pomoc.html","9311")
DEF OBLIK = (IDD/* 0=$89401, 1=$89402/0/$89400,$89400,,"."/wr2///235,,195/375,,200//"pomoc.html","9022")
DEF KORPOZ = (R4/-1,1/0/$89065,$89066,,$89068/LI3,///235,,190/375,,200)
DEF HLAD_A = (IDD/10,15/12/$89697,$89568,,$89067/WR2,ac2///235,,195/375,,200//"pomoc.html","9011")
DEF PODHODX = (R1/-99,99/3/,$89058,"AX"////235,,165/375,,60),
PODHODZ = (R1/-99,99/5/,,"AZ",$89068////465,,25/465,,110)
DEF KOMENT = (S///$89660,$89569,,"."////235,,80/375,,200//"pomoc.html","9024")
Def PADAJUCI=(IDD/* 0=$89862,2=$89863/0/,$89861,""," "/WR2///235,,180/375,,200)
DEF KOMADA = (IDD/0,100/0/$89055,$89199,"",$89073////235,,180/375,,200//"pomoc.html","9310")
DEF PREOSTALO = (IDD/0,100/0/$89696,$89167,"",$89073////235,,180/375,,200//"pomoc.html","9311")

DEF SMER = (I/* 0=$89191,1=$89192/0/,$89193,,"-"/wr2///235/375,,200)
DeF NACINABRIHT=(I////wr2///235/375,,200)
DEF SLIKA = (I///,,,/WR1///0,0,250,350/0,320,25,32) 

VS8=("OK",,SE1)
VS7=("Cancel",,SE1)


OUTPUT(NCCODE3)
  "_DRESSING_SETUP(""" BrojTOC """," DBROJTOCLevo ",""" BrojAbriht"""," DbrojAbrihtLevo ","  DbrojAbrihtDesno "," NacinAbriht ",""" ProgAbrihtLevo """,""" ProgAbrihtDesno """," Marposs "," NACINPRILAZA "," XSAFE "," ZSAFE "," UGAOBose "," Komada "," Preostalo "," HLAD_A "," OBLIK "," DBrojTocDesno "," KORPOZ "," PODHODX "," PODHODZ ",""" KOMENT  """)"
END_OUTPUT
                                                                                                                                                                    
PRESS(VS8)
  NacinAbriht = NacinAbrihtLevo+NacinAbrihtDesno
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
   NacinAbrihtLevo = NacinAbriht MOD 10
   NacinABrihtDesno = NacinAbriht / 10
END_LOAD
//END


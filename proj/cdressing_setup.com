
//M(DressingSetup/$89036)
;FB422
;FEBRUAR 2026

DEF BrojToc = (S//"krug1"/$89119,$89045////235,5,190/375,5,95//"pomoc.html","9007")

;izmena_c
;DEF DBrojTocLevo = (I/1,9/1/$89120,,"D1"////500,5,20/505,5,35//"pomoc.html","9008")
;DEF DBrojTocDesno = (I/1,9/1/$89120,,"D1"////500,,20/505,,35//"pomoc.html","9008")
DEF DBrojTocLevo = (I/1,9/1/$89120,,"D1"////500,5,20/505,5,22//"pomoc.html","9008")
DEF DBrojTocDesno = (I/1,9/2/$89120,,"D2"////500,,20/505,,22//"pomoc.html","9008")

DEF BrojAbriht = (S//"almaz1"/$89128,$89155////235,45,190/375,45,95//"pomoc.html","9301")
DEF DBrojAbrihtLevo = (I/1,9/1/$89129,,"D1"/wr2///500,45,20/505,45,22//"pomoc.html","9302")
DEF DBrojAbrihtDesno = (I/1,9/2/$89129,,"D2"/wr2///500,65,20/505,65,22//"pomoc.html","9302")
DEF UgaoBose = (R3/-180,180/0/,$89082,"B",$89013/LI3,///235,,165/375,,200//"pomoc.html","9044")
DEF NacinPrilaza = (I/*-1=$89111,0=$89105,1=$89106,2=$89107,3=$89108/0/,$89109,,"."/WR2///235,,165/375,,200//"pomoc.html","9015")
DEF XSAFE = (R1//0/,$89110,"X",////235,,165/375,,60),
ZSAFE = (R1//0/,,"Z",$89009/WR2///465,,25/465,,110)

;izmena_c
DEF SMER = (I///,$89057,"t",$89012/WR2///235/375,,200)

;izmena_c
;DEF NacinAbrihtLevo = (I/* 0=$89033, 1="Samo precnik", 2="Samo celo", 3="Precnik i celo", 4="Konturno", 5="Sa rolnom" /0/,"Alat",,"-"/WR2///235/375,,200//"POMOC.HTML","9302")
DEF NacinAbrihtLevo = (I/* 0=$89033, 1=$89019, 2=$89020, 3=$89021, 4=$89158,5=$89048,6=$89181,7=$89182,8=$89049/0/,$89130,,$89046/WR2///235,,165/375,,200//"POMOC.HTML","9302")
DEF PROGABRIHTLEVO = (S//""/$89130,$89162,,".dsr"/WR2///235/375,,200//"pomoc.html","9314")

;izmena_c
;DEF NACINABRIHTDesno = (I/* 0=$89033, 10="Samo precnik", 20="Samo celo", 30="Precnik i celo", 40="Konturno"/0/,$89130,,"-"/WR2///235/375,,200//"POMOC.HTML","9302")
DEF NACINABRIHTDesno = (I/* 0=$89033, 10=$89019, 20=$89020, 30=$89021, 40=$89158,50=$89181,60=$89182,80=$89049/0/,$89130,,$89047/WR2///235,,165/375,,200//"POMOC.HTML","9302")
DEF PROGABRIHTDESNO = (S//""/$89130,$89162,,".dsr"/WR2///235/375,,200//"pomoc.html","9314")

DEF MARPOSS = (IDD/0,9/0/$89131,$89179,"","-"////235,,180/375,,200//"pomoc.html","9311")
DEF OBLIK = (IDD/* 0=$89070, 1=$89071/0/$89069,$89069,,"."/wr2///235,,195/375,,200//"pomoc.html","9022")
DEF KORPOZ = (R4/-1,1/0/$89006,$89007,,$89009/LI3,///235,,190/375,,200)
DEF HLAD_A = (IDD/10,15/12/$89132,$89102,,$89008/WR2,ac2///235,,195/375,,200//"pomoc.html","9011")
DEF PODHODX = (R1/-99,99/3/,$89004,"AX"////235,,165/375,,60),
PODHODZ = (R1/-99,99/5/,,"AZ",$89009////465,,25/465,,110)
DEF KOMENT = (S///$89126,$89103,,"."////235,,80/375,,200//"pomoc.html","9024")
Def PADAJUCI=(IDD/* 0=$89160,2=$89161/0/,$89159,""," "/WR2///235,,180/375,,200)
DEF KOMADA = (IDD/0,100/0/$89002,$89053,"",$89014////235,,180/375,,200//"pomoc.html","9310")

;izmena_c
;DEF PREOSTALO = (IDD/0,100/0/$89131,$89043,"",$89014////235,,180/375,,200//"pomoc.html","9311")
DEF PREOSTALO = (IDD/0,100//$89131,$89043,"",$89014///"ds_workpieces_left"/235,,180/375,,200//"pomoc.html","9311")

;izmena_c
;DEF SMER = (I/* 0=$89046,1=$89047/0/,$89048,,"-"/wr2///235/375,,200)

;DeF NACINABRIHT=(I////wr2///235/375,,200)
DeF NACINABRIHT=(I////WR4///235/375,,200)
DEF SLIKA = (I///,,,/WR1///0,0,250,350/0,320,25,32) 

VS8=($89163,,SE1)
VS7=($89157,,SE1)


OUTPUT(NCCODE3)
  ;izmena_c
  ;"_DRESSING_SETUP(""" BrojTOC """," DBROJTOCLevo ",""" BrojAbriht"""," DbrojAbrihtLevo ","  DbrojAbrihtDesno "," NacinAbriht ",""" ProgAbrihtLevo """,""" ProgAbrihtDesno """," Marposs "," NACINPRILAZA "," XSAFE "," ZSAFE "," UGAOBose "," Komada "," Preostalo "," HLAD_A "," OBLIK "," DBrojTocDesno "," KORPOZ "," PODHODX "," PODHODZ ",""" KOMENT  """)"
  "_DRESSING_SETUP(""" BrojTOC """," DBROJTOCLevo ",""" BrojAbriht"""," DbrojAbrihtLevo ","  DbrojAbrihtDesno "," NacinAbriht ",""" ProgAbrihtLevo """,""" ProgAbrihtDesno """," Marposs "," NACINPRILAZA "," XSAFE "," ZSAFE "," UGAOBose "," Komada "," SMER "," HLAD_A "," OBLIK "," DBrojTocDesno "," KORPOZ "," PODHODX "," PODHODZ ",""" KOMENT  """)"
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

  ;izmena_c
NacinPrilaza.bc = 9
NACINABRIHTLevo.bc = 9
NACINABRIHTDesno.bc = 9
OBLIK.bc = 9
PADAJUCI.bc = 9

  ;izmena_c
  PROGABRIHTLEVO.wr = 4
  PROGABRIHTDESNO.wr = 4

  if NacinAbrihtLevo == 5
    smer.wr = 2
  else
    smer.wr = 4
  endif

  if NacinAbrihtLevo == 4
    PROGABRIHTLEVO.wr = 2
  endif
  if NacinAbrihtDesno == 40
    PROGABRIHTDESNO.wr = 2
  endif

END_LOAD


change(NacinAbrihtLevo)

  ;izmena_c
  PROGABRIHTLEVO.wr = 4
  PROGABRIHTDESNO.wr = 4

  if NacinAbrihtLevo == 5
    smer.wr = 2
  else
    smer.wr = 4
  endif

  if NacinAbrihtLevo == 4
    PROGABRIHTLEVO.wr = 2
  endif
  if NacinAbrihtDesno == 40
    PROGABRIHTDESNO.wr = 2
  endif

end_change

change(NacinAbrihtDesno)
 
  ;izmena_c
  PROGABRIHTLEVO.wr = 4
  PROGABRIHTDESNO.wr = 4
  if NacinAbrihtLevo == 4
    PROGABRIHTLEVO.wr = 2
  endif
  if NacinAbrihtDesno == 40
    PROGABRIHTDESNO.wr = 2
  endif
end_change
//END


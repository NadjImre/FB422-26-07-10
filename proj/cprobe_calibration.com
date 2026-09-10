//M(probe_calibration/$89097)
;FB422
;april 2026

DEF Sonda = (S//"zond"/,$89085,"","D"////335,25,170/475,25,100//"pomoc.html","9007"),
DBROJSonde = (I/1,9/1/,,////500,25,20/540,25,30)
Def OsaZaKalibraciju = (I/*0=$89033, 1="X", 2="Z"/0/,$89264,"","."/WR2///335,,170/475,,100)
DEF DuzMer = (R1/-100,100/10/,$89087,"B",$89009/LI3,///335,,170/475,,100//"pomoc.html","9044")

DEF BrzMer = (R1/1,1500/60/,$89086,"V",$89011/WR2///335,,170/475,,100//"pomoc.html","9015")

DEF XNOM = (R3/0,270/0/,$89098,"X",$89009////335,,170/475,,100)
DEF BrojSonde = (IDD/1,2/1/$89143,$89088," ","."/WR2///335,,170/475,,100//"pomoc.html","9708")
DEF Status=(IDD/0,16/0/,$89265,"","."/WR1///335,,170/475,,100)
VS8=($89163,,se1)
VS7=($89157,,se1)

OUTPUT(NCCODE2)
  "_PROBE_CALIBRATION(""" SONDA """," DBROJSONDE "," DuzMer "," BrzMer "," XNOM "," Status ")"
END_OUTPUT

PRESS(VS8)
  status = OsaZaKalibraciju+4*(BrojSonde-1)
  GC("NCCODE2")   
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

CHANGE(OsaZaKalibraciju)
  if(OsaZaKalibraciju==1)
    XNOM.gt="X"
  else
    XNOM.gt="Z"
  endif
END_CHANGE

LOAD
  LS("MENU","CMENI.COM",1)
  Rect(215,5,375,225,127,133,1)
  OsaZaKalibraciju = status mod 4
  BrojSonde = (status / 4) + 1

END_LOAD

//END

//M(probe_calibration/$89544)
;FB422
;april 2026

DEF Sonda = (S//"zond"/,$89464,"","D"////335,25,170/475,25,100//"pomoc.html","9007"),
DBROJSonde = (I/1,9/1/,,////500,25,20/540,25,30)
Def OsaZaKalibraciju = (I/*0="Off", 1="X", 2="Z"/0/,"Osa za Kalibraciju","","."/WR2///335,,170/475,,100)
DEF DuzMer = (R1/-100,100/10/,$89486,"B",$89068/LI3,///335,,170/475,,100//"pomoc.html","9044")

DEF BrzMer = (R1/1,1500/60/,$89484,"V",$89070/WR2///335,,170/475,,100//"pomoc.html","9015")

DEF XNOM = (R3/0,270/0/,$89545,"X",$89068////335,,170/475,,100)
DEF BrojSonde = (IDD/1,2/1/$89772,$89489," ","."/WR2///335,,170/475,,100//"pomoc.html","9708")
DEF Status=(IDD/0,16/0/,"Code","","."/WR1///335,,170/475,,100)
VS8=("OK",,se1)
VS7=($89842,,se1)

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

//M(merenje110/$89543//50,50,390,290///CB1)
;FB290

DEF Sonda = (S//"zond"/,$89464////235,25,190/375,25,95//"pomoc.html","9007"),
DBROJSonde = (I/1,9/1/,,"D"////500,25,20/500,25,40)

DEF DuzMer = (R1/-100,100/10/,$89486,"B",$89068/LI3,///235,,185/395,,160//"pomoc.html","9044")

DEF BrzMer = (I/1,1500/60/,$89484,"V",$89070/WR2///235,,185/395,,160//"pomoc.html","9015")

DEF ZNOM = (R3/-1000,1000/0/,$89546,"Z",$89068////235,,185/395,,160)

DEF BrojSonde = (I/1,2/1/$89772,$89489," ","."/WR2///235,,185/425,,130//"pomoc.html","9708")
DEF BRZMER_KOD=(I)

VS8=("OK",,se1)
VS7=($89842,,se1)



PRESS(VS8)
  IF(BROJSONDE==2) 
     BRZMER_KOD=-BRZMER
  ELSE
     BRZMER_KOD=BRZMER
  ENDIF
  GC("NCCODE2")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD
  LS("MENU","CMENI.COM",1)
  Rect(215,5,375,225,127,133,1)
  IF(BRZMER_KOD<0)
    BRZMER=-BRZMER_KOD
    BrojSonde=2
  ELSE
    BRZMER=BRZMER_KOD
    BrojSonde=1
ENDIF
END_LOAD

//END



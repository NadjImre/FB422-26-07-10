//M(SteadyRest)
;FB422 mart 2026


DEF Lineta = (I/* 0="Bez Linete",1="Sa Linetom"/0/,"Nacin rada","-","."/WR2///235,,185/395,,160)
DEF PozUose = (R4/0,400/0/,"Pozicija ose","U",$89068/WR2///235,,185/395,,160)
DeF UlazLinete=(R1/0,400/0/,"Pozicija ulaska","L1",$89068/WR2///235,,185/395,,160)
DeF IzlazLinete=(R1/0,400/0/,"Pozicija ulaska","L1",$89068/WR2///235,,185/395,,160)
DeF StatusLinete=(IDD/0,400/0/,"Status","",""/WR4///235,,185/395,,160)

VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE3)
  "_Steady_Rest_Setup(" Lineta "," PozUose "," UlazLinete "," IzlazLinete "," StatusLinete ")"
END_OUTPUT

PRESS(VS8)
  GC("NCCODE3")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

LOAD

END_LOAD

//END


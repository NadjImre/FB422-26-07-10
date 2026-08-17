//M(GrindingContour)
;FB422 mart 2026

DEF DefinicijaKonture = (I/* 0="Ravno",1="Korekcija konusa", 2="Korekcija u dve tacke", 3="Korisnicka kontura"/0/,"Definicija","","."/WR2///235,,185/395,,160)
DEF Korekcija1 = (R4/0,1/0/,"Korekcija na kraju","K1",$89068/WR2///235,,185/395,,160)
DEF Korekcija2 = (R4/0,1/0/,"Korekcija u sredini","K2",$89068/WR2///235,,185/395,,160)
DEF NazivKonture = (S///,"Naziv konture","","."/WR2///235,,185/395,,160)
Def NacinUlaza = (I//1//wr4)
Def ParamUlaza1 = (I//2//wr4)
Def ParamUlaza2 = (I//3//wr4)
Def NacinIzlaza = (I//4//wr4)
Def ParamIzlaza1 = (I//5//wr4)
Def ParamIzlaza2 = (I//6//wr4)

VS8=("OK",,se1)
VS7=($89842,,se1)

OUTPUT(NCCODE3)
  "_Contour_Setup(""" NazivKonture """," DefinicijaKonture "," Korekcija1 "," Korekcija2 "," NacinUlaza "," ParamUlaza1 "," ParamUlaza2 "," NacinIzlaza "," ParamIzlaza1 "," ParamIzlaza2  ")"
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


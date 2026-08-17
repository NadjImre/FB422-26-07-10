//M(Thread_StartEnd_Setup)
;skidanje prve i zadnje zavojnice sa navoja ("pritupljenje")
;sa masine FB422
;april 2026

Def Funkcija = (IDD/*0="Ugao pritupljenja", 1="Brusenje usecanjem"/0/,"Izaberi funkciju",,"-"/wr2///20,,100/125,,160)

Def UgaoPritupljenja = (R1//0/,"Ugao za pritupljenje",,$89072/wr2///20,,125/185,,100)
Def UgaoIzlaska = (R1//0/,"Ugao izlaska pritupljenja",,$89072/wr2///20,,125/185,,100)

Def UgaoUlazkaUsec = (R1//90/,"Ugao ulaska za usecanje",,$89072/wr2///20,,125/185,,100)
Def UgaoBrusenjaUsec = (R1//540/,"Ugao za brusenje usecanjem",,$89072/wr2///20,,125/185,,100)
Def UgaoIzlaskaUsec = (R1//90/,"Ugao izlaska za usecanje",,$89072/wr2///20,,125/185,,100)
Def BrojObrtaja = (R1//1/,"Broj obrtaja kod usecanja",,$89069/wr2///20,,125/185,,100)
Def BrzinaKamena= (R1//10/,"Brzina kamena kod usecanja",,$89074/wr2///20,,125/185,,100)

VS8=("OK",,SE1)
VS7=($89842,,SE1)

OUTPUT(NCCODE4)
   "_THREAD_STARTEND_SETUP(" Funkcija "," UgaoPritupljenja "," UgaoIzlaska "," UgaoUlazkaUsec "," UgaoBrusenjaUsec "," UgaoIzlaskaUsec "," BrojObrtaja "," BrzinaKamena ")" 
END_OUTPUT

PRESS(VS8)
  GC("NCCODE4")
  EXIT
END_PRESS

PRESS(VS7)
  EXIT
END_PRESS

Change(Funkcija)
  if(Funkcija==0)
    UgaoPritupljenja.wr=2
    UgaoIzlaska.wr=2
    UgaoUlazkaUsec.wr=4
    UgaoBrusenjaUsec.wr=4
    UgaoIzlaskaUsec.wr=4
    BrojObrtaja.wr=4
    BrzinaKamena.wr=4
  else
    UgaoPritupljenja.wr=4
    UgaoIzlaska.wr=4
    UgaoUlazkaUsec.wr=2
    UgaoBrusenjaUsec.wr=2
    UgaoIzlaskaUsec.wr=2
    BrojObrtaja.wr=2
    BrzinaKamena.wr=2
  endif
end_Change

LOAD
  if(Funkcija==0)
    UgaoPritupljenja.wr=2
    UgaoIzlaska.wr=2
    UgaoUlazkaUsec.wr=4
    UgaoBrusenjaUsec.wr=4
    UgaoIzlaskaUsec.wr=4
    BrojObrtaja.wr=4
    BrzinaKamena.wr=4
  else
    UgaoPritupljenja.wr=4
    UgaoIzlaska.wr=4
    UgaoUlazkaUsec.wr=2
    UgaoBrusenjaUsec.wr=2
    UgaoIzlaskaUsec.wr=2
    BrojObrtaja.wr=2
    BrzinaKamena.wr=2
  endif
END_LOAD

//END




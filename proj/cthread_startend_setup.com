//M(Thread_StartEnd_Setup)
;skidanje prve i zadnje zavojnice sa navoja ("pritupljenje")
;sa masine FB422
;april 2026

Def Funkcija = (IDD/*0=$89204, 1=$89205/0/,$89203,,"-"/wr2///20,,100/125,,160)

Def UgaoPritupljenja = (R1//0/,$89206,,$89013/wr2///20,,125/185,,100)
Def UgaoIzlaska = (R1//0/,$89207,,$89013/wr2///20,,125/185,,100)
Def UgaoUlazkaUsec = (R1//90/,$89208,,$89013/wr2///20,,125/185,,100)
Def UgaoBrusenjaUsec = (R1//540/,$89209,,$89013/wr2///20,,125/185,,100)
Def UgaoIzlaskaUsec = (R1//90/,$89210,,$89013/wr2///20,,125/185,,100)
Def BrojObrtaja = (R1//1/,$89211,,$89010/wr2///20,,125/185,,100)
Def BrzinaKamena= (R1//10/,$89212,,$89015/wr2///20,,125/185,,100)

VS8=($89163,,SE1)
VS7=($89157,,SE1)

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




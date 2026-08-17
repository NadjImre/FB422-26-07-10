
//S(Start)

HS3=($89075,,se1)
;aktivira vertikalni meni za brušenje
PRESS(HS3)
  LS("brusenje","ceditor.COM",1)
END_PRESS

HS4=($89151,,se1)
;aktivira vertikalni meni za poravanavnje
PRESS(HS4)
  LS("poravnavanje","ceditor.com",1)
END_PRESS

HS5=($89786,,se1)
;aktivira vertikalni meni za merenje
PRESS(HS5)
  LS("merenje","ceditor.com",1)
END_PRESS

HS6=("",,se2)
;HS6=($89463,,se1)
;aktivira vertikalni meni za navoje i profile
PRESS(HS6)
  ;LS("navoj","ceditor.com",1)
END_PRESS

//END

//S(brusenje)
;definicije za brušenje

;rezimi obrade "feed and speeds"
VS1=("Grinding%nSetup",,se1)
PRESS(VS1)
  LM("GrindingSetup","cgrinding_setup.com",1)
END_PRESS

;brusenje osnovne funkcije ->usecanje, oscilacije, kombinovano, čelo, konus
VS2=($89075,,se1)
PRESS(VS2)
  LM("Grinding","cgrinding.com",1)
END_PRESS

;podesavanje brusenja navoja
VS3=("Thread%nSetup",,se1)
PRESS(VS3)
  LM("ThreadSetup","cthread_setup.com",1)
END_PRESS

;brusenje navoja
VS4=("Thread%nGrinding",,se1)
PRESS(VS4)
  LM("ThreadGrinding","cthread_grinding.com",1)
END_PRESS

;brušenje sa mernom glavom
VS5=("Thread%nStart-End",,se1)
PRESS(VS5)
  LM("Thread_StartEnd_Setup","cthread_startend_setup.com")
END_PRESS

;podešavanje linete
VS6=("Steady rest%nSetup",,se1)
PRESS(VS6)
  LM("SteadyRest","csteady.com")
END_PRESS

;kontura brusenja
VS7=("Workpiece%nSetup",,se1)
PRESS(VS7)
  LM("WorkpieceSetup","cworkpiece.com")
END_PRESS

VS8=("<<",,se1)

PRESS(VS8)
  EXIT
END_PRESS

//END

//S(poravnavanje)

;Podesavanje oblika kamena
VS1=("Wheel%nSetup",,se1)
PRESS(VS1)
  LM("WheelSetup","cwheel_setup.com",1)
END_PRESS

;podesavanje abrihtera
VS2=("Dressing%nSetup",,se1)
PRESS(VS2)
  LM("DressingSetup","cdressing_setup.com",1)
END_PRESS

;PORAVNAVANJW
VS3=("Dressing",,se1)
PRESS(VS3)
  LM("dressing","cdressing.com",1)
END_PRESS

;korekcija precnika kamena - usaglasavanje stavrog precnika sa alatom
VS5=($89791,,se1)
PRESS(VS5)
  LM("Korekcija","cporavnavanje2.com",1)
END_PRESS

VS8=("<<",,se1)

PRESS(VS8)
  EXIT
END_PRESS

//END

//S(merenje)

;Podesavanje oblika kamena
VS1=("Measuring%nHead",,se1)
PRESS(VS1)
  LM("MeasurinHead","csonda.com",1)
END_PRESS

;rekalibracija
VS2=("Diameter%nrecalibration",,se1)
Press(Vs2)
    LM("probe_recalibration","cprobe_recalibration.com",1) 
End_Press

;aksialno pozicioniranje
VS3=("Measuring%nwith probe",,se1)
Press(Vs3)
    LM("probe_measuring","cprobe_measuring.com",1) 
End_Press

;kalibracija po obe ose
;tekstovi ne odgovaraju
VS4=("Probe%nCalibration",,se1)
PRESS(VS4)
    LM("probe_calibration","cprobe_calibration.com",1)
END_PRESS

;merenje sirine
VS5=("Width%nMeasurment",,se1)
PRESS(VS5)
    LM("probe_width","cprobe_width.com",1)
END_PRESS

;Orjentacjia po C
VS6=("C axis%nPosition,,se1)
PRESS(VS6)
    LM("probe_caxis_position","cprobe_caxis_position.com",1)
END_PRESS


;merenje navoja
VS7=("Thread%nmeasurment",,se1)
Press(Vs7)
    LM("probe_thread","cprobe_thread.com",1) 
End_Press


VS8=("<<",,se1)

PRESS(VS8)
  EXIT
END_PRESS

//END

//S(navoj)

VS1=("Thread%nSetup",,se1)

PRESS(VS1)
  LM("SetupNavoja","cnavoj.com",1)
END_PRESS

VS2=($89564,,se1)

PRESS(VS2)
  LM("ProfilKamena","cnavoj.com",1)
END_PRESS

VS3=($89674,,se1)

PRESS(VS3)
  LM("AbrihtNavoja","cnavoj.com",1)
END_PRESS

;rezimi obrade "feed and speeds"
VS4=($89171,,se1)
PRESS(VS4)
  LM("Rezimi22","crezimi_za_navoj.com",1)
END_PRESS

VS5=($89571,,se1)

PRESS(VS5)
  LM("BrusenjeProfila","cnavoj.com",1)
END_PRESS

VS6=($89866,,se1)

PRESS(VS6)
  LM("RadniPredmet","cnavoj.com",1)
END_PRESS

VS7=($89865 ,,se1)

PRESS(VS7)
  LM("Navoj","cnavoj.com",1)
END_PRESS


VS8=("<<",,se1)

PRESS(VS8)
  EXIT
END_PRESS

//END



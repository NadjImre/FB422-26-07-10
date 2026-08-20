Ovo su NC programi za mašinu FB422.
Programi podržavaju :
- 6 faza brušenja
- proizvoljan broj poravnavanja kamena u svakoj fazi
- rad sa mernom glavom 
- poravnavanje po konturi
- specijalni ciklusi merenja 

*** Brušenje prečnika :

-> _GRINDING.SPF podprogrami za brušenje prečnika pozivaju se preko njega, ovo je centralni program za brušenje 
-> _GRINDING_SETUP.SPF i _FEEDS.SPF podešavanje režima brušenja prečnika, samo podešavanje GUDova nema kretanja
- CGRINDING_SETUP.COM maska za kontrolu _Grinding_setup i Feeeds.spf 
- CGRINDING.COM maska za kontrolu _grinding.spf 
-> _WORKPIECE_SETUP.SPF za definisanje konture brušenja i rada sa linetama , koristi se samo uz konturno brušenje , nema kretanja samo podešavanje
- CWORKPIECE.COM maska za podešavanje _WORKPIECE_SETUP.SPF

PODPROGRAMI za brušenje su sledeći:
-> usecanje SH150.spf 
-> oscilacije SH140.spf
-> celo SH160.spf
-> celo i prečnik SH170.spf 
-> kontura SH840.spf 
- kombinovano brušenje - nema ga, ugovor ne traži
- kombinovano 2 - nema ga, ugovor ne traži

NAPOMENE:
- od cilindričnog brušenja (SH140/SH150/SH160/SH170 i SH840) samo konturno SH840 podržava linetu i definisanje konture brušenja; SH1xx nemaju linetu
- mernu glavu podržavaju svi programi uključujući konturno brušenje
- šest faza brušenja sa među poravnavanjem podržavaju svi programi
- ni jedan od programa ne podržava unutrašnje brušenje
- zvučna sonda: M8x samo uključuje prikaz na displeju; sonda šalje prekid 4, programi SH140/SH150/SH160/SH170 i SH840 reaguju ako je taj prekid programiran u Gr_interrupts za fazu

POMOĆNI PROGRAMI
-> SYSCONTURE.SPF - definiše jednostavne sistemske konture za brušenje, konus i korekcija cilindričnosti, nalazi se u SPF folderu
-> SH6201 - odskok na prekid 8
-> SH6202 - ASUB za prekid iz Gr_interrupts (1-7); zvučna sonda šalje 4. Samo ispis poruke, koriste SH140/150/160/170/840
-> TB200 - tablično definisanje konture

*** Brušenje navoja

-> _THREAD_GRINDING.SPF je glavni program za brušenje navoja preko njega pozivaju se podprogrami za brušenje 
-> _WORKPIECE_SETUP.SPF (isti kao za brušenje prečnika) podešava se kontura po kojoj se brusi, nema kretanja
-> _THREAD_SETUP.SPF podešavaju se režimi obrade 
- CTHREAD_GRINDING.COM maska za podešavanje _THREAD_GRINDING.SPF
- CTHREAD_SETUP.COM maska za podešavanje
- CWORKPIECE.COM maska za podešavanje _WORKPIECE_SETUP.SPF
-> _THREAD_STARTEND_SETUP.SPF program za podešavanje parametara pritupljenja, samo podešavanje bez kretanja
- CTHREAD_STARTEND_SETUP.COM maska podešavanje pritupljenja 

PODPROGRAMI brušenje navoja su sledeći:
-> oscilacije - program SH850.spf
-> pritupljenje levo i desno - predviđeni su programi SH831.spf i SH832.spf
-> usecanje navoja - SH811.spf je prazan okvir (avgust 2026), još nije napisan; maska i _THREAD_GRINDING ga i dalje zovu

POMOĆNI PROGRAMI
-> SYSCONTURE.SPF - definiše jednostavne sistemske konture za brušenje (isti kao za cilindrično brušenje)
-> SH6201 - odskok na prekid 8 (SH850/SH831/SH832)
-> TB200 - tablično definisanje konture
-> _DRESSING - među-poravnavanje
- SH6202 navojni ciklusi ne koriste (nema reakcije na prekid 4)

NAPOMENE
- ni jedan program ne podržava leđno brušenje što su stari programi za navoj podržavali
- nije podržano unutrašnje brušenje
- nije podržan rad sa zvučnom sondom: M81 samo uključuje prikaz na displeju, nema reakcije na prekid 4 (Gr_interrupts)
- lineta je podržana, programi imaju posebnu sekciju za ulaz i izlaz linete; podešava se kroz _WORKPIECE_SETUP

*** Poravnavanje kamena

-> _WHEEL_SETUP_LEFT.SPF je program za podešavanje oblika kamena za levi bok, omogućava podešavane za čelo u dva oblika, čelo i prečnik sa radijusom prelaza u dva oblika i konus u kombinaciji sa čelom ili bez, nije potreban za cilindrično poravnavanje kao ni za poravnavanje navoja i poravnavanje po korisničkom profilu
-> _WHEEL_SETUP_RIGHT.SPF je isto samo za desni bok
- CWHEEL_SETUP.COM maska za podešavanje _WHEEL_SETUP_LEFT.SPF i _WHEEL_SETUP_RIGHT.SPF 
-> _DRESSING_SETUP.SPF služi za podešavanje parametara poravnavanja, mora biti pozvan pre poravnavanja ili pre brušenja ako brušenje koristi među poravnavanja, nema nikakvih kretanja iz ovog programa
- CDRESSING_SETUP.COM - maska za podešavanje 
-> _DRESSING je samo poravnavanje uz zadavanje nekih parametara
- CDRESSING - maska za podešavanje poravnavanja

KONTURE za poravnavanje
Poravnavanje sve radi preko kontura, za neke česte i jednostavne stvari postoje fabrički definisane konture. Ove konture su u folderu DRS :

- PLANE_LEFT.DRS - cilindrično poravnavanje u levo, nula na levoj ivici kamena, počine skroz desno i ide u levo
- PLANE_RIGHT.DRS - cilindrično poravnavanje u desno, nula na desnoj ivici kamena , počine skroz levo i ide u desno
- FACE_LEFT.DRS - poravnavanje levog boka kamena pod zadatim uglom sa opcionom fazetom
- FACE_LEFT2.DRS - poravnavanje levog boka sa upušteno i opcionom fazetom
- FACE_RIGHT.DRS - isto kao levi samo za desni bok
- FACE_RIGHT2.DRS - isto kao levi samo za desni bok
- FULL_LEFT.DRS - puno poravnavanje leve strane kamena počinje skroz desno poravnava prečnik, opciono konus sa leve strane, radijus prelaza i levo čelo pod uglom sa opcionom fazetom
- FULL_RIGHT.DRS - isto samo za desno čelo kamena
- FULL_LEFT2.DRS - puno poravnavanje kao i prethodni samo čelo nije pod uglom nego upušteno
- FULL_RIGHT2.DRS - isto samo za desno čelo kamena

Pomoćni programi :
-> AL600 za odskok (SETINT 8 iz _DRESSING); ne radi ispravno kod poravnavanja čela

*** MERENJE SA SONDOM RENISHOW

Programi za merenje sa sondom su :
-> _PROBE_CALIBRATION - kalibracija sonde po X ili Z osi , ne radi nikakva kretanja samo poziva odgovarajući pod program
-> _PROBE_RECALIBRATION - radi rekalibraciju sonde - podešava parametre bez kretanja i poziva pod program MS140.SPF
-> _PROBE_MEASURING - merenje po X ili Z - osam načina: aksijalno 1-4 (samo merenje, korekcija, rekalibracija, udar) i prečnik 5-8 (isto); poziva MS120 za Z ili MS140 za X i obrađuje rezultate merenja
-> _PROBE_WIDTH - merenje sredine žljeba - tri mogućnosti : merenje bez korekcije, merenje sa korekcijom Z ose i rekalibracija polozaja sonde. Samo priprema parametre, merenje radi pozivajući MS150
-> _PROBE_CAXIS - merenje po C, traži ulaznu tačku u žljeb po obimu komada, poziva MS130 (treba testirati)
-> _PROBE_THREAD - merenje srednjeg prečnika navoja, isto ima tri varijante - samo merenje, merenje i korekcija i rekalibracija. Samo priprema parametre i poziva MS160

Pomoćni programi :
-> MS100 - kalibracija po X osi
-> MS110 - kalibracija po Z osi
-> MS120 - merenje po Z osi sa ponavljanjem u svakoj tački i okretanjem komada može da meri poziciju po Z ili aksijalni udar
-> MS130 - traženje i merenje pozicije žljeba po obimu komada (po C osi)
-> MS140 - merenje prečnika komada u više tačaka okretanjem komada sa mogućnošću ponavljanja u svakoj tački, meri prečnik i/ili radijalni udar
-> MS150 - određivanje centar žljeba po Z osi 
-> MS160 - merenje srednjeg prečnika navoja i ugla ulaska u žljeb

Maske za podešavanje
- CPROBE_CALIBRATION.COM - podešavanje _PROBE_CALIBRATION 
- CPROBE_RECALIBRATION.COM - podešavanje _PROBE_RECALIBRATION
- CPROBE_MEASURING.COM - podešavanje _PROBE_MEASURING
- CPROBE_WIDTH.COM - podešavanje _PROBE_WIDTH
- CPROBE_CAXIS_POSITION.COM - podešavanje _PROBE_CAXIS 
- CPROBE_THREAD.COM - podešavanje _PROBE_THREAD

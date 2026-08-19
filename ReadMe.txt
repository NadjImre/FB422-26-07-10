Ovo su NC programi za mašinu FB422.
Programi podržavaju :
- 6 faza brušenja
- proizvoljan broj poravnavanja kamena u svakoj fazi
- rad sa mernom glavom 
- poravnavanje po konturi
- specijalni ciklusi merenja 

*** Brušenje prečnika :

- _GRINDING.SPF podprogrami za brušenje prečnika pozivaju se preko njega, ovo je centralni program za brušenje 
- _GRINDING_SETUP.SPF i _FEEDS.SPF podešavanje režima brušenja prečnika, samo podešavanje GUDova nema kretanja
- CGRINDING_SETUP.COM maska za kontrolu _Grinding_setup i Feeeds.spf 
- CGRINDING.COM maska za kontrolu _grinding.spf 
- _WORKPIECE_SETUP.SPF za definisanje konture brušenja i rada sa linetama , koristi se samo uz konturno brušenje , nema kretanja samo podešavanje
- CWORKPIECE.COM maska za podešavanje _WORKPIECE_SETUP.SPF

PODPROGRAMI za brušenje su sledeći:
- usecanje SH150.spf 
- oscilacije SH140.spf
- celo SH160.spf
- celo i prečnik SH170.spf 
- kontura SH840.spf 
- kombinovano brušenje - nema ga, ugovor ne traži
- kombinovano 2 - nema ga, ugovor ne traži

NAPOMENE:
- samo program za brusenje konturno podražava linetu i definisanje konture brušenja 
- mernu glavu podržavaju svi programi osim konturnog brušenja
- šest faza brušenja sa među poravnavanjem podržavaju svi programi
- ni jedan od programa ne podržava unutrašnje brušenje

POMOĆNI PROGRAMI
- SYSCONTURE.SPF - definiše jednostavne sistemske konture za brušenje, konus i korekcija cilindričnosti, nalazi se u SPF folderu

*** Brušenje navoja

- _THREAD_GRINDING.SPF je glavni program za brušenje navoja preko njega pozivaju se podprogrami za brušenje 
- _WORKPEICE_SETUP.SPF (isti kao za  brušenje prečnika) podešava se kontura po kojoj se brusi, nema kretanja
- _THREAD_SETUP.SPF podešavaju se režimi obrade 
- CTHREAD_GRINDING.COM maska za podešavanje _THREAD_GRINDING.SPF
- CTHREAD_SETUP maska za podešavanje
- CWORKPIECE.COM maska za podešavanje _WORKPIECE_SETUP.SPF
- CTHREAD_STARTEND_SETUP program za podešavanje parametara pritupljenja, samo podešavanje bez kretanja
- CTHREAD_STARTEND_SETUP maska podešavanje pritupljenja 

PODPROGRAMI brušenje navoja su sledeći:
- oscilacije - program SH850.spf
- usecanje navoja - predviđen je program SH811.spf koji nije testiran i nije skroz sigurno ni šta se tačno nalazi u fajlu.
- pritupljenje levo i desno - predviđeni su programi SH381.spf i SH382.spf  

POMOĆNI PROGRAMI
- SYSCONTURE.SPF - definiše jednostavne sistemske konture za brušenje (isti kao za cilindrično brušenje)

NAPOMENE
- ni jedan program ne podržava leđno brušenje što su stari programi za navoj podržavali
- nije podržano unutrašnje brušenje
- nije podržan rad sa zvučnom sondom


*** Poravnavanje kamena

- _WHEEL_SETUP.SPF je program za podešavanje oblika kamena, omogućava podešavane za čelo u dva oblika, čelo i prečnik sa radijusom prelaza u dva oblika i konus u kombinaciji sa čelom ili bez, nije potreban za cilindrično poravnavanje kao ni za poravnavanje navoja i poravnavanje po korisničkom profilu
- CWHEEL_SETUP.COM maska za podešavanje _WHEEL_SETUP.SPF 
- _DRESSING_SETUP.SPF služi za podešavanje parametara poravnavanja, mora biti pozvan pre poravnavanja ili pre brušenja ako brušenje koristi među poravnavanja, nema nikakvih kretanja iz ovog programa
- CDRESSING_SETUP.COM - maska za podešavanje 
- _DRESSING je samo poravnavanje uz zadavanje nekih parametara
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


*** MERENJE SA SONDOM RENISHOW

Programi za merenje sa sondom su :
- _PROBE_CALIBRATION - kalibracija sonde po X ili Z osi , ne radi nikakva kretanja samo poziva odgovarajući pod program
- _PROBE_RECALIBARTION - radi rekalibraciju sonde - podešava parametre bez kretanja i poziva pod program MS140.SPF
- _PROBE_MEASURING - merenje po X ili Z - ima četiri moguće načina reda - samo merenje, merenje sa korekcijom, merenje sa rekalibracijom i merenje udara, podešava parametre, poziva pod programe (MS120 za merenje po Z ili MS140 za merenje po X) i obrađuje rezultate merenja.
- _PROBE_WIDTH - merenje sredine žljeba - ima ti mogućnosti : merenje bez korekcije, merenje sa korekcijom Z ose i reklaibracija polozaja sonde. Samo priprema parametre, merenje radi pozivajući MS150
- _PROBE_CAXIS - merenje po C, traži ulaznu tačku u žljeb po obimu komada 
- _PROBE_THREAD - merenje srednjeg prečnika navoja, isto ima tri varijante - samo merenje, merenje i korekcija i rekalibracija. Samo priprema parametre i poziva MS160

Pomoćni programi :
- MS100 - kalibracija po X osi
- MS110 - kalibracija po Z osi
- MS120 - merenje po Z osi sa ponavljanjem u svakoj tački i okretanjem komada može da meri poziciju po Z ili aksijalni udar
- MS130 - traženje i merenje pozicije žljeba po obimu komada (po C osi)
- MS140 - merenje prečnika komada u više tačaka okretanjem komada sa mogućnošću ponavljanja u svakoj tački, meri prečnik i/ili radijalni udar
- MS150 - određivanje centar žljeba po Z osi 
- MS160 - merenje srednjeg prečnika navoja i ugla ulaska u žljeb

Maske za podešavanje
-CPROBE_CALIBRATION.COM - podešavanje _PROBE_CALIBRATION 
-CPROBE_RECALIBARTION.COM - podešavanje _PROBE_RECALIBARTION
-CPROBE_MEASURING.COM - podešavanje _PROBE_MEASURING
-CPROBE_WIDTH.COM - podešavanje _PROBE_WIDTH
-CPROBE_CAXIS.COM - podešavanje _PROBE_CAXIS 
-CPROBE_THREAD.COM - podešavanje _PROBE_THREAD

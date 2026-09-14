Ovo su NC programi za mašinu FB422.
Programi podržavaju :
- 6 faza brušenja
- proizvoljan broj poravnavanja kamena u svakoj fazi
- rad sa mernom glavom 
- poravnavanje po konturi
- specijalni ciklusi merenja 

Tekstovi maski su u lng/myalz_eng.txt i lng/myalz_rus.txt (ID 89000-89309). Ulaz editora je proj/ceditor.com.

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

Profil kamena za navoj nije ovde: ide kroz poravnavanje (CTHREAD_WHEEL_SETUP + način 8 u CDRESSING_SETUP).

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

Meniji: ceditor.com -> poravnavanje VS1 oblik kamena, VS2 setup abrihtera, VS3 poravnavanje, VS5 Thread Profil.

-> _WHEEL_SETUP_LEFT.SPF je program za podešavanje oblika kamena za levi bok, omogućava podešavane za čelo u dva oblika, čelo i prečnik sa radijusom prelaza u dva oblika i konus u kombinaciji sa čelom ili bez, nije potreban za cilindrično poravnavanje kao ni za poravnavanje navoja i poravnavanje po korisničkom profilu
-> _WHEEL_SETUP_RIGHT.SPF je isto samo za desni bok
- CWHEEL_SETUP.COM maska za podešavanje _WHEEL_SETUP_LEFT.SPF i _WHEEL_SETUP_RIGHT.SPF 
-> _THREAD_WHEEL_SETUP.SPF upisuje geometriju navojnog profila u GUD (Thread_Type, Th_*, Ds_X*, Ds_Rib*); konturu bira _DRESSING_SETUP način 8, ne ova maska. AX/AZ u maski su samo prikaz.
- CTHREAD_WHEEL_SETUP.COM maska Thread Profil
  Tipovi: 0 metrički, 1 cevni, 2 trapezni, 3 testerasti, 4 obli, 5 univ. trougao, 6 univ. trapez.
  Tipovi 2, 3 i 6 idu na THREAD_TRAP_* konture, ostali na THREAD_TRI_*.
  IZRAČUNAJ za metrički računa samo H, A, B, R1 iz koraka; R2 i X1 se zadaju ručno.
  Ht i Bs su samo prikaz (projektor), ne idu u NC.
  Višezubni kamen: n, s, d (Ds_RibNum / Ds_RibDist / Ds_RibDelta) važi samo za FULL konture; LEFT/RIGHT su jedan zub. Podrazumevano n=1, s=0, d=0.
-> _DRESSING_SETUP.SPF služi za podešavanje parametara poravnavanja, mora biti pozvan pre poravnavanja ili pre brušenja ako brušenje koristi među poravnavanja, nema nikakvih kretanja iz ovog programa. Upisuje podhod (XL/XR i inc X/Z) i Ds_OdskokX, zatim zove _START_Z_POSITION_LEFT/RIGHT.
- CDRESSING_SETUP.COM - maska za podešavanje
  Način levo 1-8, desno 10/20/30/40/50/60/80:
  1 samo prečnik (PLANE), 2 samo čelo (FACE), 3 prečnik i čelo (FULL), 4 korisnička kontura (.DRS ime iz maske),
  5 levo ROLIK / desno FACE_RIGHT2, 6 levo FACE_LEFT2 / desno FULL_RIGHT2, 7 levo FULL_LEFT2, 8 Navoj.
  Navoj: jedna strana 8 ili 80 bira *_FULL; obe strane 8+80 biraju *_LEFT i *_RIGHT.
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
- ROLIK.DRS - poravnavanje profilnom rolnom (zadrška ds_time), samo leva strana način 5
- THREAD_TRI_FULL.DRS / THREAD_TRI_LEFT.DRS / THREAD_TRI_RIGHT.DRS - trougao (metrički, cevni, obli, univ. trougao)
- THREAD_TRAP_FULL.DRS / THREAD_TRAP_LEFT.DRS / THREAD_TRAP_RIGHT.DRS - trapez (trapezni, testerasti, univ. trapez)
  FULL radi petlju 1..Ds_RibNum; LEFT/RIGHT su jedan bok jedne niti.

Pomoćni programi :
-> _START_Z_POSITION_LEFT.SPF / _START_Z_POSITION_RIGHT.SPF - iz konture (CONTPRON) uzimaju početnu Z (Ds_PodhodZL/ZR), smer G41/G42 (ds_direction_L/R) i krajnju Z za odskok (Ds_OdskokZL/ZR i Ds_OdskokZ). Zove ih _DRESSING_SETUP.
-> AL600 odskok na SETINT 8 iz _DRESSING. Koordinate Ds_OdskokX (prilaz na konturu, isti kao PODHODXVAR) i Ds_OdskokZ (krajnja Z aktivne konture). Ako je trenutni X u WCS < 0 prvo G0 po Z pa po X, inače samo po X. Za čelo i kosine još treba proveriti.

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

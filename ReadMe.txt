Ovo su NC programi za mašinu FB422.
Programi podržavaju :
- 6 faza brušenja
- proizvoljan broj poravnavanja kamena u svakoj fazi
- rad sa mernom glavom 
- poravnavanje po konturi
- specijalni ciklusi merenja 

Tekstovi maski su u lng/myalz_eng.txt i lng/myalz_rus.txt (ID 89000-89310). Ulaz editora je proj/ceditor.com.

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
  Živi grafik crta iste tačke kao FULL* (F od kraja R; F=0 ulaz u čelo pod A). Ako H od nule ne ponese konus+R+F (+K kod tipa 2) i donji luk, polje H je crveno (89310). Statične slike (al303…) nisu u tom sistemu. 
-> _THREAD_WHEEL_SETUP.SPF upisuje geometriju navojnog profila u GUD (Thread_Type, Th_*, Ds_X*, Ds_Rib*); konturu bira _DRESSING_SETUP način 8, ne ova maska. AX/AZ u maski su samo prikaz.
- CTHREAD_WHEEL_SETUP.COM maska Thread Profil
  Tipovi: 0 metrički, 1 cevni, 2 trapezni, 3 testerasti, 4 obli, 5 univ. trougao, 6 univ. trapez.
  Tipovi 2, 3 i 6 idu na THREAD_TRAP_* konture, ostali na THREAD_TRI_*.
  IZRAČUNAJ za metrički računa samo H, A, B, R1 iz koraka; R2 i X1 se zadaju ručno.
  Ht i Bs su samo prikaz (projektor), ne idu u NC.
  Višezubni kamen: n, s, d (Ds_RibNum / Ds_RibDist / Ds_RibDelta) važi samo za FULL konture; LEFT/RIGHT su jedan zub. Podrazumevano n=1, s=0, d=0.
  Crtanje je u CTHREAD_CALC.COM (LOAD: LB Proracun). VS5 uključuje grafik, VS6 osvežava; na CHANGE se ne crta (sporo). R=0 se ne crta. Skraćeni zub (d) zadržava isto W. PNG slike profila ostaju odvojene od grafikona.
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
- FACE_LEFT.DRS - poravnavanje levog boka kamena pod zadatim uglom sa opcionom fazetom; ugao A ide od kraja F, H ostaje od nule
- FACE_LEFT2.DRS - poravnavanje levog boka sa upušteno i opcionom fazetom
- FACE_RIGHT.DRS - isto kao levi samo za desni bok
- FACE_RIGHT2.DRS - isto kao levi samo za desni bok
- FULL_LEFT.DRS - puno poravnavanje leve strane: prečnik, opciono konus, R i čelo pod A sa opcionom fazetom. Tačke se računaju pa G1/G2/G3 CR= (nema RND na R). F se meri od kraja R; F=0 ide R u čelo pod A. H je od nule; ako Xe predje početak donjeg luka (Xf) — MSG i M00 petlja. Bez čela samo prečnik/konus.
- FULL_RIGHT.DRS - isto za desno čelo (Z u minus, G2/G3 zamenjeni)
- FULL_LEFT2.DRS - kao FULL_LEFT, čelo upušteno (K); provera H je Xr naspram Xf
- FULL_RIGHT2.DRS - isto za desno čelo kamena
- ROLIK.DRS - poravnavanje profilnom rolnom (zadrška ds_time), samo leva strana način 5
- THREAD_TRI_FULL.DRS / THREAD_TRI_LEFT.DRS / THREAD_TRI_RIGHT.DRS - trougao (metrički, cevni, obli, univ. trougao)
- THREAD_TRAP_FULL.DRS / THREAD_TRAP_LEFT.DRS / THREAD_TRAP_RIGHT.DRS - trapez (trapezni, testerasti, univ. trapez)
  FULL radi petlju 1..Ds_RibNum; LEFT/RIGHT su jedan bok jedne niti.

Pomoćni programi :
-> _START_Z_POSITION_LEFT.SPF / _START_Z_POSITION_RIGHT.SPF - iz konture (CONTPRON) uzimaju početnu Z (Ds_PodhodZL/ZR), smer G41/G42 (ds_direction_L/R) i krajnju Z za odskok (Ds_OdskokZL/ZR i Ds_OdskokZ). Zove ih _DRESSING_SETUP.
-> AL600 odskok na SETINT 8 iz _DRESSING. Koordinate Ds_OdskokX (prilaz na konturu, isti kao PODHODXVAR) i Ds_OdskokZ (krajnja Z aktivne konture). Ako je trenutni X u WCS < 0 prvo G0 po Z pa po X, inače samo po X. Za čelo i kosine još treba proveriti.

*** MERENJE SA SONDOM RENISHOW

Meni ceditor.com -> merenje: VS1 kalibracija, VS2 prečnik, VS3 aksijalno, VS4 cilindričnost, VS5 širina, VS6 C, VS7 navoj.

Programi za merenje sa sondom su :
-> _PROBE_CALIBRATION - kalibracija ili samo merenje po X (MS100) ili Z (MS110). Status: osa (1=X, 2=Z), sonda 1/2, bit 8 = samo merenje (inače kalibracija), ponavljanja 1-8. Nema kretanja do sonde, samo poziva MS1xx.
-> _PROBE_RECALIBRATION - rekalibracija prečnika (MS140), parametri iz poziva; maske nema, zovu ga WKS programi. Niski bitovi statusa su broj pokušaja, ne način rada. Pre merenja me_status je 0, da MS140 ne dira alat. Posle svakog merenja $TC_DP4 ide za pola odstupanja, ponovo dok |odstupanje| ne padne na 0.002 ili dok se pokušaji ne potroše.
-> _PROBE_DIAMETER - jedan presek, MS140. me_offset se na ulazu nulira. Zaokret, prilaz, povratak, dizanje, ugao C, broj tačaka i ponavljanja dolaze sa maske.
  Način 0 samo zapiše da merenje nije zadato. Način 1 i 4 mere i proveravaju toleranciju prečnika i udara; van nje SETAL(65002). Način 2 isto proveri, pa u fine koordinatnog sistema upiše pomeraj X = −0.5×odstupanje. Način 3 ostavlja status, pa dužinu alata rekalibriše MS140 ($TC_DP4, pola odstupanja, dok ne uđe u toleranciju ili ne istekne broj ponavljanja). Način 5 u ciklusu kalibriše $TC_DP4 posle jednog merenja; maska ga ne nudi.
  Izveštaj: zaglavlje ciklusa, tabele tačaka iz MS127.
-> _PROBE_AXIAL - isti raspored parametara kao prečnik, merenje radi MS120. Toleranciju, korekciju okvira i rekalibraciju ne radi ovaj ciklus nego MS120.
  Način 1 i 4: me_actual_position je prosek, alarm na položaj i aksijalni udar. Način 2: fine Z = −odstupanje. Način 3: MS120 pomera $TC_DP5 za celo odstupanje i ponavlja dok ne uđe u toleranciju. Način 5 (dužina alata posle jednog merenja) postoji u MS120; maska ga ne nudi.
-> _PROBE_CYLINDRICITY - prečnik u 1..8 preseka od Z1 do Z2 i cilindričnost. Jedan presek ostaje na Z1, inače su ravnomerno raspoređeni. Svaki presek zove MS140. Između preseka povratak je način 16, bez podizanja sonde; na poslednjem važe povratak i dizanje sa maske. Zaokret (X/Z, ugao B, prilaz) i prečnik završetka idu u MS140. Posle petlje me_offset se vraća na 0.
  Način 0 ne meri. Način 1 i 2 mere sa pomerajem me_cyl_offset[presek] i proveravaju toleranciju prečnika, udar preseka i cilindričnost. Korekcija koordinatnog sistema se ne upisuje, zato su način 1 i 2 u ciklusu isti. Način 3 je rekalibracija pomeraja: meri sa me_offset=0 i bez izmene dužine alata (MS140 vidi način 1), zatim me_cyl_offset[i] = nominalni − prosek preseka. Alarm se ne diže. Način 4 je ručni setup: me_offset=0, jedan MS140 tamo gde je sonda dovedena, bez petlje i bez zbirnog izveštaja.
  Cilindričnost je (najveći − najmanji prečnik svih preseka) / 2. Izveštaj u me_report_file: zaglavlje opsega, red pred svaki presek, tabele tačaka iz MS127, pa zbir srednjeg prečnika i cilindričnosti. Van tolerancije SETAL(65002), M00, M96. Tolerancija 0 isključuje tu proveru.
  GUD u MGUD, učitati definiciju: me_cyl_offset[8], me_cyl_max/min/avg/span[8], me_cyl_tolerance. Posle učitavanja niz pomeraja kreće od nule dok se ne uradi rekalibracija.
-> _PROBE_WIDTH - sredina žleba, MS150. Ima zaokret, prilaz, povratak, C, broj tačaka i ponavljanja. U pozivu je sonda fiksno 23. Širina sa maske ide u me_w_width. Nominalni prečnik i Z se ne prepisuju u me_w_diameter i me_w_position.
  Način 1 proverava |me_w_result| i diže alarm. Način 2 upisuje fine Z = −me_w_result. Način 3 pomera sačuvani me_w_position za tu grešku. Način 4 MS150 meri gde je sonda dovedena i pamti nađeni prečnik, sredinu i širinu; ciklus posle toga ne proverava toleranciju.
-> _PROBE_CAXIS - položaj žleba po C, MS130. Poseban hod i brzina po C, zaokret, prilaz, povratak i dizanje. Nema broja ponavljanja ni ugaonih tačaka.
  Način 1 proverava odstupanje ugla. Način 2 upisuje fine C = −odstupanje. Način 3, ako je unutar tolerancije, pamti izmereni ugao u me_c_calibration. Način 4 ne prilazi: MS130 skenira od trenutnog položaja. Izveštaj piše MS130.
-> _PROBE_THREAD - srednji prečnik navoja, MS160. Maska šalje nominalni prečnik, početni prečnik i Z, ali ciklus te tri vrednosti ne prepisuje u me_th_*. Korak i korak merenja idu u me_th_pitch i me_th_step. Nema zaokreta ni prilaza.
  Način 1 poredi me_th_CError sa tolerancijom. Način 2 i 3 gledaju promenljivu mode, koja se ne dodeljuje, pa korekcija okvira i rekalibracija iz maske ne rade. Način 4 MS160 vodi na svoju granu kalibracije.

_PROBE_MEASURING.SPF više nema. CPROBE_DIAMETER i CPROBE_AXIAL zovu svoje cikluse. Staro ime još zovu PROBE_DIAM14_FACE na kraćem i dužem valu.

Pomoćni programi :
-> MS100 - kalibracija / merenje po X: petlja ponavljanja, log u me_report_file; kalibracija $TC_DP4 sa poslednjeg MCS (target/2), merenje ispisuje prosek WCS
-> MS110 - isto po Z: hod Z+me_distance, kalibracija $TC_DP5 = MCS-target
-> MS120 - položaj po Z i aksijalni udar, više tačaka i ponavljanja, zaokret i ručni prilaz kad je status > 3. Tu su provera tolerancije, fine Z i rekalibracija $TC_DP5. Izveštaj preko MS127.
-> MS130 - traženje žleba po obimu, korak me_c_span, zaokret i izveštaj. Način 4 preskače prilaz.
-> MS140 - prečnik i radijalni udar, više tačaka i ponavljanja. Tačka je $AA_MW[X]+me_offset. Toleranciju ne proverava; to rade _PROBE_DIAMETER i _PROBE_CYLINDRICITY. Način 3 sam pomera $TC_DP4. Status > 3 meri bez prilaza. Za način 1 i 4 ostavlja me_actual_diameter. Izveštaj preko MS127.
-> MS150 - sredina žleba u više tačaka, prilaz kao kod MS120. me_w_result je odstupanje sredine. Način 4 pamti prečnik, sredinu, širinu i C, pa staje na M00.
-> MS160 - srednji prečnik navoja i ulaz u žleb. Čita me_th_*. Način 4 je kalibracija unutar ciklusa.

Maske za podešavanje
- CPROBE_CALIBRATION.COM - osa X/Z, sonda, kalibracija ili merenje, broj ponavljanja
- CPROBE_DIAMETER.COM - maska _PROBE_DIAMETER. Načini: bez merenja, samo merenje, korekcija okvira, rekalibracija alata, ručni setup. Zaokret, X i Z, hod, brzina, dozvola prečnika i udara, broj tačaka i ponavljanja, povratak, dizanje, C. VS5 puni X iz me_actual_diameter, Z iz me_actual_position i C iz me_actual_CPosition.
- CPROBE_AXIAL.COM - isto za _PROBE_AXIAL. Dozvola udara je aksijalna. VS5 puni ista tri polja.
- CPROBE_CYLINDRICITY.COM - maska _PROBE_CYLINDRICITY. Nominalni prečnik, Z1, Z2, broj preseka, hod, brzina, dozvole D/R/C, koordinatni sistem, zaokret, povratak i dizanje. VS5 iz ručnog merenja puni nominalni prečnik iz me_actual_diameter i Z1 iz me_actual_position.
- CPROBE_WIDTH.COM - maska _PROBE_WIDTH. Načini: bez merenja, samo merenje, korekcija, rekalibracija, ručni setup. Nema dugmeta za preuzimanje iz ručnog merenja. Poziv fiksira podizanje sonde na 23.
- CPROBE_CAXIS_POSITION.COM - maska _PROBE_CAXIS. Nominalni prečnik i Z, kalibracioni ugao C, hod po X, korak i brzina po C, dozvola ugla, zaokret i povratak.
- CPROBE_THREAD.COM - maska _PROBE_THREAD. Dva prečnika, Z, korak, korak merenja, broj sonde za podizanje i C. Nema zaokreta ni prilaza. Povratak je stari izbor 0/16/32/48.
  Nema više CPROBE_MEASURING.COM ni CPROBE_RECALIBRATION.COM.

Proba izmene ----
#
# ---------- Remove crap before the heavy post-processing -------------------

echo "--------------- Custom Delete: IMAGESET ------------------------"
php $TEST_PATH/Release/delete_releases.php searchname=like="imageset" adddate=smaller=333 ignore # Remove these here not with blacklists
echo "--------------- Custom Delete: General Bob@home etc  ------------------------"
php $TEST_PATH/Release/delete_releases.php fromname=equals="Bob <bob@home>" size=smaller=419430400 adddate=smaller=333 ignore # What is this?
php $TEST_PATH/Release/delete_releases.php fromname=equals='Bob <bob@home.me>' size=smaller=419430400 adddate=smaller=333 ignore # Cannot assemble - Now 17
php $TEST_PATH/Release/delete_releases.php fromname=equals='Bob <bobb@home.me>' size=smaller=419430400 adddate=smaller=333 ignore # Cannot assemble - Now 17
php $TEST_PATH/Release/delete_releases.php fromname=equals='Bob <bob@newhome.me>' size=smaller=419430400 adddate=smaller=333 ignore # Cannot assemble - Sept 17
php $TEST_PATH/Release/delete_releases.php fromname=equals='Bob <bob@homeblock.me>' size=smaller=419430400 adddate=smaller=333 ignore # Cannot assemble - Sept 17
php $TEST_PATH/Release/delete_releases.php fromname=equals='Bob <bob@homenew.me>' size=smaller=419430400 adddate=smaller=333 ignore # Cannot assemble - Sept 17
php $TEST_PATH/Release/delete_releases.php fromname=equals='Bob <bob@home.mex>' size=smaller=419430400 adddate=smaller=333 ignore # Cannot assemble - Sept 17
php $TEST_PATH/Release/delete_releases.php fromname=equals='Bob <bob@homef.me>' adddate=smaller=333 ignore # Cannot assemble - Sept 17 
php $TEST_PATH/Release/delete_releases.php fromname=equals='Bob <bob@otherhome.me>' size=smaller=419430400 adddate=smaller=333 ignore # Cannot assemble - Oct 17  
php $TEST_PATH/Release/delete_releases.php fromname=equals='Bob <bob@usenet.me>' size=smaller=419430400 adddate=smaller=333 ignore # Cannot assemble - Oct 17  
echo "--------------- Custom Delete: General CoreX <CoreX@ssl.local> ------------------------"
php $TEST_PATH/Release/delete_releases.php fromname=equals="CoreX <CoreX@ssl.local>" adddate=smaller=333 ignore # Flood of crapolada
#echo "--------------- Custom Delete: General COMPRESSED ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies name=like="[COMPRESSED]" adddate=smaller=333 ignore # Executable crap 
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day name=like="[COMPRESSED]" adddate=smaller=333 ignore # Executable crap 
#echo "--------------- Custom Delete: 3d ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.3d fromname=equals="mojiz <mojiz@rapidpich.ir>" adddate=smaller=333 ignore # Junk rars unable to decode
#echo "--------------- Custom Delete: aa ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.aa fromname=like='by_DRM_<%.com>' adddate=smaller=333 ignore # Passworded - Feb 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.aa fromname=like='by_DRM_<%web.de>' adddate=smaller=333 ignore # Passworded - Feb 17
echo "--------------- Custom Delete: amazing ------------------------"
# php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing name=like="Unpacker" adddate=smaller=333 ignore # !!! Lotsafake looking PC releases
# php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing name=like="[RAR]" fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' adddate=smaller=333 ignore # Lotsafake looking PC releases
# php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing name=like="[PACKED]" fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' adddate=smaller=333 ignore # Lotsafake looking PC releases
# php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing name=like="[UNPACKER]" fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' adddate=smaller=333 ignore # Lotsafake looking PC releases
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' size=smaller=52428800 adddate=smaller=333 ignore # Lotsafake looking PC releases
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='ThePirateBay MIRROR <ssl-news.info@local>' adddate=smaller=333 ignore # Lots of fake looking PC releases
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals="kunzis@gmail.com (Kunzis)" adddate=smaller=333 ignore # Lots of small exe fakes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals="konzus@gmail.com (Konzus)" adddate=smaller=333 ignore # Lots of small exe fakes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals="sane7136@address.com (Surizius)" adddate=smaller=333 ignore # Lots of small exe fakes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals="jon7721@gmail.com (jon7721)" adddate=smaller=333 ignore # Lots of small exe fakes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals="mhartell5555@gmail.com (hart)" adddate=smaller=333 ignore # Lots of small exe fakes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals="luke_ka1883@live.com (Galun)" adddate=smaller=333 ignore # Lots of small exe fakes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals="talia7@gmail.com (talia)" adddate=smaller=333 ignore # Lots of small exe fakes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals="lolak@gmail.com (Lolak)" adddate=smaller=333 ignore # Lots of small exe fakes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals="janusch@gmail.com (Janusch)" adddate=smaller=333 ignore # Lots of small exe fakes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='tom.kamkp@gmail.com (Lokal)' adddate=smaller=333 ignore # Fakes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='kerster001@cox.net (SeanMPC)' adddate=smaller=333 ignore # Fake warez Nov 16
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='tom.kama@gmail.com (Kamoskaz)' adddate=smaller=333 ignore # Fake warez Dec 16
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='buymore@suprnova.com' adddate=smaller=333 ignore # Good releases but hashed: The "4" in the middle is constant b70ef4390eac4bfba1e6a59caa95c332
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals="Yenc@power-post.org (Yenc-PP-A&A)" totalpart=equals=1 size=smaller=61457280 adddate=smaller=333 ignore # Lots of small exe fakes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='Tinus Plotseling <Stb@stb.com>' size=smaller=104857600 adddate=smaller=333 ignore # The smaller EXE releases hanging p7zip - Dec 16
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='Aiquanif@power-post.com (Aiquanif)' adddate=smaller=333 ignore # Unable to assemble - Jan 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='Eithulee@power-post.com (Eithulee)' adddate=smaller=333 ignore # Unable to assemble - Jan 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='klipsaver.com <wettermil@fresh.com>' adddate=smaller=333 ignore # Passworded - Feb 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='jeevesraylo@msn.com (Jeeves Raylo)' adddate=smaller=333 ignore # Fake warez - Jun 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.amazing fromname=equals='jerome7843@shaw.ca (Jerome Will)' adddate=smaller=333 ignore # Fake warez - Dec 17
echo "--------------- Custom Delete: ath ------------------------"
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ath fromname=equals='ginoac@nzb.to (GinoAc)' adddate=smaller=333 ignore # Fake warez - Dec 16
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ath fromname=equals='n3rdinger <n3rd@hush.ai.net>' adddate=smaller=333 ignore # Passworded - Jan 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ath name=like='<<house-of-usenet.com>><<Hitnews>>' adddate=smaller=333 ignore # Passworded - Apr 17
#echo "--------------- Custom Delete: audiobooks ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.audiobooks fromname=equals='"Assassin" <Assassin@network.org>' adddate=smaller=333 ignore # Passworded - Mar 17
#echo "--------------- Custom Delete: big ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.big fromname=equals="Yenc@power-post.org (Yenc-PP-A&A)" size=smaller=61457280 adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.big fromname=like='"ScReaM"_<%.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.big fromname=like='"H.O.P.-X.x.X"%.com>' adddate=smaller=333 ignore # Passworded - Jan 17
echo "--------------- Custom Delete: bloaf ------------------------"
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.bloaf fromname=equals='Formatx <12345@free.com>' adddate=smaller=333 ignore # Passworded - Jan 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.bloaf fromname=equals='"Stop" <The@Violen.ce>' adddate=smaller=333 ignore # Passworded - Jan 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.bloaf fromname=like='"H.O.P.-X.x.X"%.com>' adddate=smaller=333 ignore # Passworded - Jan 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.bloaf fromname=like='"<<< USC >>>" <USC@web.de>' adddate=smaller=333 ignore # Passworded - Jan 17
#echo "--------------- Custom Delete: blu-ray ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.blu-ray fromname=equals='BD50@BD25.yew (BD50)' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.blu-ray fromname=equals='TommyBoy <JBinUp@JBinUp.local>' adddate=smaller=333 ignore # Passworded - Jan 17
echo "--------------- Custom Delete: boneless ------------------------"
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.boneless fromname=equals='dadidudo <dadidudo123456@gmail.com>' adddate=smaller=333 ignore # Passworded - Mar 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.boneless fromname=equals='Yenc@power-post.org (Yenc-PP-A&A)' name=like='"6thd%"_____[___/___]_-_"' adddate=smaller=333 ignore # Passworded - Mar 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.boneless fromname=equals='extrasets <info@starstruck98.com>' adddate=smaller=333 ignore # Passworded - Apr 17
#echo "--------------- Custom Delete: comp ------------------------"
echo "--------------- Custom Delete: conspiracy ------------------------"
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.conspiracy fromname=equals='defacor@newsconnection.eu (defacor)' adddate=smaller=333 ignore # Fake looking warez - Dec 17
#echo "--------------- Custom Delete: cores ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.cores fromname=equals="yEncBin@Poster.com (yEncBin)" searchname=like="Art-of-Use.net" adddate=smaller=333 ignore # Passworded
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.cores fromname=equals='"Dr.Gonzo" <Dr.Gonzo@usenet-of-outlaws.de>' adddate=smaller=333 ignore # Passworded Jan 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.cores fromname=equals="Matrix_Neo <Wichpillareyougonnatake@1011011011.com>" adddate=smaller=333 ignore # Passworded stuff goes to misc
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.cores fromname=like='"<<<%>>>"%@web.de>' adddate=smaller=333 ignore # Passworded stuff goes to misc
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.cores searchname=like="have_fun_und_besucht_uns_unter" adddate=smaller=333 ignore # Passworded
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.cores fromname=equals='<Ren & Stimpy@Newz.org> (R & S)' adddate=smaller=333 ignore # Passworded and/or unable to decypher - Dec 16
#echo "--------------- Custom Delete: dvd ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvd fromname=equals='DiscError <discerror@yahoo.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#echo "--------------- Custom Delete: dvd5 ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvd5 fromname=equals='bourne@has.no.mail.com (lecter)' adddate=smaller=333 ignore # Passworded - Jan 17
#echo "--------------- Custom Delete: dvd9 ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvd9 fromname=equals='sysclop <sysclop@sysclop.com>' adddate=smaller=333 ignore # Passworded - Feb 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvd9 fromname=equals='H.Greggerson <H.Greggerson4325@gmail.com>' adddate=smaller=333 ignore # Passworded - Feb 17
#echo "--------------- Custom Delete: dvdnordic.org ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvdnordic.org fromname=equals='jens@nomail.ggg (Jens Jensen)' adddate=smaller=333 ignore # Passworded - Feb 17
#echo "--------------- Custom Delete: dvd.movies ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvd.movies fromname=equals='ywngt@yahoo.co.uk (ywngt)' adddate=smaller=333 ignore # Passworded - Jan 17
#echo "--------------- Custom Delete: dvd.classics ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvd.classics fromname=equals='John <John@somewhere.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvd.classics fromname=equals='lzlover <lzlover@saph.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvd.classics fromname=equals='squawky <squawkycawky@slinkyclinky.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvd.classics fromname=equals='antique@old.stuff.eu (antique)' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvd.classics fromname=equals='antique@fuck.u.suckers.com (antique)' adddate=smaller=333 ignore # Passworded - Jan 17
#echo "--------------- Custom Delete: dvd-r ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.dvd-r searchname=like="private_BH" adddate=smaller=333 ignore # Cannot decode and collect
#echo "--------------- Custom Delete: e-book ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.e-book fromname=equals='nick96 <nick96@gmail.com>' size=smaller=32000 adddate=smaller=333 ignore # SPAMMer Nov 16
#echo "--------------- Custom Delete: erotica ------------------------"   
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.erotica fromname=equals="support@razor.com (Razor1911)" adddate=smaller=333 ignore # fakes 
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.erotica fromname=equals='"B-Seadragon" <keineadresse@web.de>' adddate=smaller=333 ignore # Passworded 
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.erotica fromname=equals='oz <oz@lot.com>' adddate=smaller=333 ignore # Unable to decode - thx to Fossil01
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.erotica fromname=equals='"Studman" <Studmant@web.de>' adddate=smaller=333 ignore # Passworded
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.erotica fromname=equals='WarezGeek@WarezGeek.org (WarezGeek)' adddate=smaller=333 ignore # Fake exes - Dec 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.erotica name=like='brothers-of-usenet.net_empfehlen_useindex.net%free_Invites_by_B-DeadAngel' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.erotica fromname=equals='"HOU-UPLOADER" <hou@web.de>' adddate=smaller=333 ignore # Passworded - Feb 17
echo "--------------- Custom Delete: etc ------------------------"   
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.etc fromname=equals="sane7136@address.com (Surizius)" adddate=smaller=333 ignore # exe fakes 
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.etc fromname=equals="troyc3747@gmail.com (troy)" adddate=smaller=333 ignore # exe fakes 
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.etc fromname=equals="mopsis118@gmail.com (Mopsis)" adddate=smaller=333 ignore # exe fakes 
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.etc fromname=equals='klonnkkk.183@gmail.com (Kloank)' adddate=smaller=333 ignore # Legit looking exes
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.etc fromname=equals="SSL-News.info <ssl-news.info@ssl.local>" searchname=like="BRRip.HQ.AC3.DD5.1" adddate=smaller=333 ignore # Codec crap Aug 2016
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.etc fromname=equals='wellwhatsthis@dun.no (dunno)' adddate=smaller=333 ignore # Fake exes Nov 16 
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.etc fromname=equals='aaaaps@msoft.com (msoft)' adddate=smaller=333 ignore # Fake exes Nov 16 
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.etc fromname=equals='jeevesraylo@msn.com (Jeeves Raylo)' adddate=smaller=333 ignore # Fake warez Jun 17 
# php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.etc fromname=like='"ScReaM" <%.com>' adddate=smaller=333 ignore # Passworded - Mar 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.etc fromname=equals='jerome7843@shaw.ca (Jerome Will)' adddate=smaller=333 ignore # Fake warez - Dec 17
echo "--------------- Custom Delete: frogs ------------------------"
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.frogs fromname=equals='Not Me <dontever@email.me>' adddate=smaller=333 ignore # Small stuff, unknown - Jan 17
#echo "--------------- Custom Delete: ftd ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ftd fromname=equals='support@123systems.com (ariana)' adddate=smaller=333 ignore # Fake warez - Dec 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ftd fromname=equals='Newsconnection.co.uk <News@Newsconnection.local>' size=smaller=200000 adddate=smaller=333 ignore # Fake passworded ebooks - Dec 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ftd fromname=equals='"JBINUP" <JBINUP@JBINUP.net>' adddate=smaller=333 ignore # Passworded - Feb 17
#echo "--------------- Custom Delete: ftn ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ftn fromname=equals='NoChances <NoChances@Wellby.com>' adddate=smaller=333 ignore # Fake warez - Apr 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ftn fromname=equals='Yellow <Yellow@Bus.org>' adddate=smaller=333 ignore # Fake warez - Apr 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ftn fromname=equals='Atlantis <Atlantis@Moore.com>' adddate=smaller=333 ignore # Fake warez - Apr 17
#echo "--------------- Custom Delete: ghosts ------------------------"   
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ghosts fromname=equals="jane.juneee@gmail.com (June)" adddate=smaller=333 ignore # Small exe files
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ghosts fromname=equals="ha.kak09@gmail.com (hajunz)" adddate=smaller=333 ignore # Small exe files
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ghosts fromname=equals="janusch@gmail.com (Janusch)" adddate=smaller=333 ignore # Small exe files
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ghosts fromname=equals='tom.kamkp@gmail.com (Lokal)' adddate=smaller=333 ignore # Fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ghosts fromname=equals='tammy.golp96@gmail.com (Korinzuas)' adddate=smaller=333 ignore # Legit looking warez
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ghosts fromname=equals='klonnkkk.183@gmail.com (Kloank)' adddate=smaller=333 ignore # Legit looking exes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ghosts fromname=equals='starwarsfangiirl@gmail.com (kaliniiplad)' adddate=smaller=333 ignore # Legit looking exes - Nov 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ghosts fromname=equals='tom.kama@gmail.com (Kamoskaz)' adddate=smaller=333 ignore # Fake warez Dec 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.ghosts fromname=equals='them.mo190@gmail.com (kalano)' adddate=smaller=333 ignore # Fake looking warez - Feb 17
#echo "--------------- Custom Delete: hdtv ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.hdtv fromname=equals='swamp <swamp@chucky.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#echo "--------------- Custom Delete: hdtv.repost ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.hdtv.repost fromname=equals='Santa <Christ@mas.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.hdtv.repost fromname=equals='Peter <dont@bother.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.hdtv.repost fromname=equals='#cripples <masturb@ting.in.wheelchairs>' adddate=smaller=333 ignore # Passworded mostly - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.hdtv.repost fromname=equals='Yenc@power-post.org (jayhsong)' adddate=smaller=333 ignore # Just a crappy poster - Jan 17
#echo "--------------- Custom Delete: inner-sanctum ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.inner-sanctum fromname=equals='nEwZ[NZB] <pr3d@NET.world>' size=smaller=65536 adddate=smaller=333 ignore # Posting NFOs only without any RARs - Nov 16
##php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.inner-sanctum fromname=equals="nEwZ[NZB] <pr3d@NET.world>" searchname=like=xxx adddate=smaller=333 ignore # Sometimes spams wordpress shite - Still 100's per loop! Jan 16
#echo "--------------- Custom Delete: insiderz ------------------------"   
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.insiderz fromname=equals="yEncBin@Poster.com (yEncBin)" searchname=like="Art-of-Use.net" adddate=smaller=333 ignore # Passworded
#echo "--------------- Custom Delete: mac ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mac fromname=equals="De Goeiste <goeiste@mac.com>" adddate=smaller=333 ignore # crashes p7zip, pity 70 odd releases look OK
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mac fromname=equals='oops <ididit@again.com>' adddate=smaller=333 ignore # Passworded - Feb 17
echo "--------------- Custom Delete: misc ------------------------"
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.misc fromname=equals='blinis@botlon.com (blinis)' adddate=smaller=333 ignore # new codec crap # July 16
## php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.misc fromname=equals='Bob <bob@home.me>' adddate=smaller=333 ignore # Various small releases unable to decode - Jan 17 - Single file rels
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.misc fromname=equals='N/A@posting.cc (N/A)' adddate=smaller=333 ignore # Passworded - Mar 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.misc fromname=equals='batman <i.am@batman.com>' adddate=smaller=333 ignore # Passworded - Mar 17
#echo "--------------- Custom Delete: mom ------------------------"
### php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals="anonymous@anonymous.com (Pilou)" searchname=like="NextDownload" ignore # doesnt assemble
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals="NBM@Here.com (NBM)" adddate=smaller=333 ignore # doesnt assemble correctly
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals="jbinup <JBinUp@JBinUp.local>" searchname=like="SecretUsenet.com%Attention%PW%needed%" adddate=smaller=333 ignore # Passworded
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals="yEncBin@Poster.com (yEncBin)" searchname=like="Art-of-Use.net" adddate=smaller=333 ignore # Passworded
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals="Kainan <Kainan@upload>" searchname=like="newsconnection.eu" adddate=smaller=333 ignore # Passworded
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals="blinis@botlon.com (blinis)" adddate=smaller=333 ignore # new codec crap July 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' size=smaller=5242880 searchname=like='toorbox_Datenbank_ebook' adddate=smaller=333 ignore # German ebooks Nov 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='<Ren & Stimpy@Newz.org> (R & S)' adddate=smaller=333 ignore # Unable to decode these small releases Nov 16
## back from daily
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals="Yenc@power-post.org (Yenc-PP-A&A)" size=smaller=52428800 adddate=smaller=333 ignore #
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='Tinus Plotseling <Stb@stb.com>' size=smaller=104857600 adddate=smaller=333 ignore # The smaller EXE releases hanging p7zip - Dec 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='klas435treup.com <pukkles@dikkers.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='ratte <mausi@web.de>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='satje@hulker.com <dsykserp@shipzze.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='kraunt <kraunt@biz.de>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='pilsterszag.com <miljones@junkope.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='yufga <bzix@hUnt.fr>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='julliusmik.com <sammy657@vulletre.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='gashck <traun@fra.land>' adddate=smaller=333 ignore # Passworded - Feb 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='perfectnoob@hotmail.com (Camaro)' adddate=smaller=333 ignore # Passworded - Feb 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom fromname=equals='TiMnZb <ssl-news.info@ssl.local>' adddate=smaller=333 ignore # Passworded - Feb 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mom searchname=like='usenet-space-cowboys.online' adddate=smaller=333 ignore # Passworded - Mar 17
#echo "--------------- Custom Delete: moovee ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.moovee fromname=equals='nEwZ[NZB] <pr3d@NET.world>' adddate=smaller=333 ignore # Fake XXX Dec 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.moovee fromname=equals='Rat2017 <Rat2017@gmail.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#echo "--------------- Custom Delete: monter-movies ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.monter-movies fromname=equals='noname@yes.com' adddate=smaller=333 ignore # Passworded - Jan 17 
#echo "--------------- Custom Delete: movies ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies fromname=equals="Yanc@power-post.org <Yanc@power-post.org>" size=smaller=1048576 adddate=smaller=333 ignore # Exe's Jan 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies fromname=equals="support@razor.com (Razor1911)" ignore adddate=smaller=333 # fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies fromname=equals='Fake@address.com (Yenc-PP-GB-12b4)' ignore adddate=smaller=333 # Small exe's
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies fromname=equals="SSL-News.info <ssl-news.info@ssl.local>" searchname=like="BRRip.HQ.AC3.DD5.1" ignore adddate=smaller=333 # Codec crap Aug 2016
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies fromname=equals='WarezGeek@WarezGeek.org (WarezGeek)' adddate=smaller=333 ignore # fakes Nov 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies fromname=equals='Yenc@power-post.org (Yenc-PP-A&A)' size=smaller=20000 adddate=smaller=333 ignore # fakes Nov 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' size=smaller=52428800 adddate=smaller=333 ignore # fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies fromname=equals='WarezZz@Ware.org (WarezZz)' adddate=smaller=333 ignore # Fake warez - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies fromname=equals='provide@4u.net <provide@4u.net>' adddate=smaller=333 ignore # Tiny fake warez - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies fromname=equals='"RapidTurk" <support@rapidturk.com>' adddate=smaller=333 ignore # Passworded - Jan 17
#echo "--------------- Custom Delete: movies.divx ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.divx fromname=equals='Cinema@providers.com (Cinema)' adddate=smaller=333 ignore # new codec shite
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.divx fromname=equals='HD@moviez.com (MovieHD)' adddate=smaller=333 ignore # new codec shite
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.divx fromname=equals='timefor@moviez.com (Time4Movies)' adddate=smaller=333 ignore # new codec shite
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.divx fromname=equals="blinis@botlon.com (blinis)" adddate=smaller=333 ignore # new codec crap July 16
#echo "--------------- Custom Delete: movies.french ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.french fromname=equals='Yenc@power-post.org (Yenc-PP-A&A)' size=smaller=52428800 ignore # crypted
#echo "--------------- Custom Delete: movies.mkv ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.mkv fromname=equals='jox <jox@tatu.in>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.mkv fromname=equals='45142 <14652@mv.in>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.mkv fromname=equals='jpop <russia@tatu.in>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.mkv fromname=equals='animbkp <anim@tatu.in>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.mkv fromname=equals='russia <ru@tatu.in>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.mkv fromname=equals='Yenc@power-post.org (Yenc-PP-A&A)' name=like='{%-%-%-%-%}' adddate=smaller=333 ignore # Unable to decode - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.movies.mkv fromname=equals='sircf <abuse@usenet.nntp>' adddate=smaller=333 ignore # Passworded - Fec 17
#echo "--------------- Custom Delete: mp3 ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mp3 searchname=like='SecretUsenet.com%Attention%PW' adddate=smaller=333 ignore # Passworded
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.mp3 searchname=like='brothers-of-usenet.net_empfehlen_useindex.net%free_Invites_by_B-DeadAngel' adddate=smaller=333 ignore # Passworded - Jan 17
#echo "--------------- Custom Delete: multimedia ------------------------"
### php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.multimedia fromname=equals='JBinUpUsenetUploader ... <JBinUpUsenet@Uploader.com>' adddate=smaller=333 ignore # Unable to decode 4 in the middle constant Nov 16 - Single file
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.multimedia fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' name=like='{%-%-%-%-%}' adddate=smaller=333 ignore # Unable to decode - Dec 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.multimedia fromname=equals="support@razor.com (Razor1911)" adddate=smaller=333 ignore # Lots of uniform size apparent fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.multimedia fromname=equals='nosendemails@me.com.bk (radombk)' adddate=smaller=333 ignore # Passworded
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.multimedia fromname=equals='WarezGeek@WarezGeek.org (WarezGeek)' adddate=smaller=333 ignore # Fake exes - Dec 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.multimedia fromname=equals='Magnum Opus <sir@john.doe>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.multimedia fromname=equals='janpaweldrugigmd <piwnica2137@pozdrawiam1488.org>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.multimedia fromname=equals='genex@genex.com' adddate=smaller=333 ignore # Passworded - Jan 17
#echo "--------------- Custom Delete: music ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.music fromname=like='"<<<%>>>"_<%.com>' searchname=like='11B6S' adddate=smaller=333 ignore # Passworded - Jan 17
#echo "--------------- Custom Delete: nl ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.nl fromname=equals='zon@zombie.to (Zombie)' adddate=smaller=333 ignore # Posting badly formed passworded releases - Jan 17
#echo "--------------- Custom Delete: pcgame ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.pcgame fromname=equals='heinse_maik@yahoo.de (iloadup)' adddate=smaller=333 ignore # Fake exe releases Nov 16
#echo "--------------- Custom Delete: pwp ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.pwp fromname=equals='luke_noppyg@gmail.com (lukeynop)' adddate=smaller=333 ignore # Crap EXEs - Mar 17
echo "--------------- Custom Delete: tatu ------------------------"
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.tatu fromname=equals='fieDooPo@power-post.com (fieDooPo)' adddate=smaller=333 ignore # Unable to decode badly posted - Jan 17
#echo "--------------- Custom Delete: teevee ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.teevee fromname=equals="sane7136@address.com (Surizius)" adddate=smaller=333 ignore # lotsa little exes
#echo "--------------- Custom Delete: test ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.test fromname=equals="Bob <bob@home>" name=like="NewCrypt3dSuff0nly" adddate=smaller=333 ignore # passworded
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.test searchname=like="Crypt3dSuff0nly" adddate=smaller=333 ignore # Encrypted
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.test fromname=equals="support@easynews.com (Yenc-PP-A&A)" adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.test fromname=equals="support@easynews.com (Yenc-PP-GB-12b4)" adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.test fromname=equals="SSL-News.info <ssl-news.info@ssl.local>" searchname=like="BRRip.HQ.AC3.DD5.1" adddate=smaller=333 ignore # Codec crap Aug 2016
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.test fromname=equals="Deany@botlon.com (Deanys)" adddate=smaller=333 ignore # Codec crap Aug 2016
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.test fromname=equals='Mack <Mazzle.Manhazzle@gmazzle.com>' adddate=smaller=333 ignore # Unable to decode - from Fossil01
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.test fromname=equals="Yenc@power-post.org (Yenc-PP-A&A)" size=smaller=62914560 adddate=smaller=333 ignore # Fakes exes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.test fromname=equals='Powerpeter@powerpost.com (PowerPeter)' adddate=smaller=333 ignore # Fakes warez - Nov 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.test fromname=equals='TommyBoy <JBinUp@JBinUp.co>' adddate=smaller=333 ignore # Passworded - Feb 16
#echo "--------------- Custom Delete: the-terminal ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.the-terminal fromname=equals='"@Altair" <abc@def.net>' adddate=smaller=333 ignore # Passworded - Mar 17
#echo "--------------- Custom Delete: town ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.town searchname=like="TOWN%www.town.ag%PORNO%www.ssl-news.info" adddate=smaller=333 ignore
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.town fromname=like="%anime@town.ag%" adddate=smaller=333 ignore # Do here rather than with blacklist
#echo "--------------- Custom Delete: triballs ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.triballs fromname=equals="Deany@botlon.com (Deanys)" adddate=smaller=333 ignore # Codec crap Aug 2016
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.triballs fromname=equals="Blacksol@mars.com (Blacksol)" adddate=smaller=333 ignore # Codec crap Aug 2016
## echo "--------------- Custom Delete: tun ------------------------"
#echo "--------------- Custom Delete: tv ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.tv fromname=equals="Blacksol@mars.com (Blacksol)" adddate=smaller=333 ignore # Codec crap Aug 2016
#echo "--------------- Custom Delete: u-4all ------------------------"
### php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.u-4all fromname=equals='JBinUpUsenetUploader ... <JBinUpUsenet@Uploader.com>' adddate=smaller=333 ignore # Unable to decode 4 in the middle constant Nov 16 - Single files
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.u-4all fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' name=like='{%-%-%-%-%}' adddate=smaller=333 ignore # Unable to decode - Dec 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.u-4all fromname=equals='"uniQue" <up@load.org>' adddate=smaller=333 ignore # Passworded - Dec 16
#echo "--------------- Custom Delete: u4all ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.u4all fromname=equals="Yenc@power-post.org (Yenc-PP-A&A)" size=smaller=52428800 adddate=smaller=333 ignore # Lots of small exe fakes
#echo "--------------- Custom Delete: u4e ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.u4e fromname=equals="munzah11@outlook.com (munzah11)" adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.u4e fromname=equals="Yenc@power-post.org (Yenc-PP-A&A)" size=smaller=61457280 adddate=smaller=333 ignore # Lots of small exe fakes
#echo "--------------- Custom Delete: usc ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usc fromname=equals="munzah11@outlook.com (munzah11)" adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usc fromname=equals="ha.kak09@gmail.com (hajunz)" adddate=smaller=333 ignore # Small exe files
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usc fromname=equals="janusch@gmail.com (Janusch)" adddate=smaller=333 ignore # Small exe files
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usc searchname=like='Gespenster_Geschichten%Usenet-Space-Cowboys.online >>No.1 NZB source<<<' adddate=smaller=333 ignore # German ebooks 
#echo "--------------- Custom Delete: usenet-space-cowboys ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals="sieruos137@outlook.org (Sieruos)" adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals="jon7721@gmail.com (jon7721)" adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals="jonas.weidel@web.de (Sizerion)" adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals="mhartell5555@gmail.com (hart)" adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals="hansm@gmail.com (hans)" adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals="MatiX89@gmail.com (MatiX)" adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals="lok.anz39@gmx.de (Lokanzu)" adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals='tom.kong009@yahoo.com (Lozanuklo)' adddate=smaller=333 ignore # Warez
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals="Yenc@power-post.org (Yenc-PP-A&A)" size=smaller=67108864 adddate=smaller=333 ignore # Lots of small exe fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals='kerster001@cox.net (SeanMPC)' adddate=smaller=333 ignore # Fake warez Nov 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals='klonnkkk.183@gmail.com (Kloank)' adddate=smaller=333 ignore # Legit looking warez - Nov 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet-space-cowboys fromname=equals='idk.okan901@gmail.com (lokamos)' adddate=smaller=333 ignore # Legit looking warez - Jan 17
#echo "--------------- Custom Delete: usenet2day ------------------------"
###php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day name=like="Unpacker" adddate=smaller=333 ignore # !!! Lotsafake looking PC releases
###php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' size=smaller=52428800 adddate=smaller=333 ignore # fakes
###php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day name=like="[RAR]" fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' adddate=smaller=333 ignore # Lotsafake looking PC releases
###php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day name=like="[PACKED]" fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' adddate=smaller=333 ignore # Lotsafake looking PC releases
###php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day name=like="[UNPACKER]" fromname=equals='SSL-News.info <ssl-news.info@ssl.local>' adddate=smaller=333 ignore # Lotsafake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='ThePirateBay MIRROR <ssl-news.info@local>' adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='headyow@yahoo.de (headyow)' adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals="admin@sokali.com (Yenc-PP-A&A)" adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals="support@easynews.com (Yenc-PP-GB-12b4)" adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals="jonas.weidel@web.de (Sizerion)" adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals="jahnunsinos007@gmail.com (Jahnunsinos007)" adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals="info@usefullgames.org (Usefull)" adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals="hansh@gmail.com (hans)" adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals="Mhammel7@gmail.com (Mark)" adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals="talia7@gmail.com (talia)" adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals="MatiX89@gmail.com (MatiX)" adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals="tom.ekk@gmail.com (Nunzada)" adddate=smaller=333 ignore # Lots of fake looking PC releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals="HoonLee <Hoon@Lee.net>" adddate=smaller=333 ignore # Passworded releases
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='KaiProctor <Kai@Proctor.net>' adddate=smaller=333 ignore # Passworded or hashed
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='tom.kamkp@gmail.com (Lokal)' adddate=smaller=333 ignore # Fakes
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='starwarsfangiirl@gmail.com (kaliniiplad)' adddate=smaller=333 ignore # Warez that might be legit
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='matti@gmail.com (Matti)' adddate=smaller=333 ignore # Fakes Nov 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='matthias.deffner@haiger.de (Matthias-Deffner)' adddate=smaller=333 ignore # Fakes Nov 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='Fake@address.com (Yenc-PP-GB-12b4)' adddate=smaller=333 ignore # Exe's looking very fake like
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='kerster001@cox.net (SeanMPC)' adddate=smaller=333 ignore # Fake warez Nov 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='janusch@gmail.com (Janusch)' adddate=smaller=333 ignore # Fake passworded warez Nov 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='tom.kama@gmail.com (Kamoskaz)' adddate=smaller=333 ignore # Fake warez Dec 16
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='mop.ppel@gmail.com (moporius)' adddate=smaller=333 ignore # Legit looking warez - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='Eroalos <Ero@alos.net>' adddate=smaller=333 ignore # Unable to decode legit looking - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='TalsLaspo <Tals@Laspo.net>' adddate=smaller=333 ignore # Unable to decode legit looking - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='ieseeZuj@power-post.com (ieseeZuj)' adddate=smaller=333 ignore # Unable to decode badly posted - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='Jdlamsjidpa <Jdl@amsjidpa.net>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='AlspPso <Alsp@Pso.net>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='KslapMp <Dslap@Mp.net>' adddate=smaller=333 ignore # Passworded - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='them.mo190@gmail.com (kalano)' adddate=smaller=333 ignore # Fake looking warez - Jan 17
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='luke_noppyg@gmail.com (lukeynop)' adddate=smaller=333 ignore # Crap EXEs - Mar 17
php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.usenet2day fromname=equals='jerome7843@shaw.ca (Jerome Will)' adddate=smaller=333 ignore # Fake warez - Dec 17
#echo "--------------- Custom Delete: warez ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.warez fromname=equals='WarezGeek@WarezGeek.org (WarezGeek)' adddate=smaller=333 ignore # Fake exes - Dec 16
#echo "--------------- Custom Delete: x ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.x fromname=equals="Yenc@power-post.org (Yenc-PP-A&A)" size=smaller=52428800 adddate=smaller=333 ignore # too much crap
#php $TEST_PATH/Release/delete_releases.php groupname=equals=alt.binaries.x fromname=equals="Matrix_Neo <Wichpillareyougonnatake@1011011011.com>" adddate=smaller=333 ignore # Passworded stuff goes to misc
#echo "--------------- Custom Delete: dk.binaries.film ------------------------"
#php $TEST_PATH/Release/delete_releases.php groupname=equals=dk.binaries.film fromname=equals='Rat2017 <Rat2017@gmail.com>' adddate=smaller=333 ignore # Passworded - Feb 17
#
echo "--------------- Custom Delete: Passworded - Part 2------------------------"
php $TEST_PATH/Release/delete_releases.php name=like='Password%Protected' adddate=smaller=333 ignore # Passworded across several groups # Jan 16 moved to part 2 for tuning

echo " ================== Inline Purge Fin ================== "
echo

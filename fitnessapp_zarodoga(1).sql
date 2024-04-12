-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 12. 10:29
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `fitnessapp_zarodoga`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `blog`
--

CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL,
  `blog_uzenet` text NOT NULL,
  `blog_datum` varchar(255) NOT NULL,
  `nyelv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `blog`
--

INSERT INTO `blog` (`blog_id`, `blog_uzenet`, `blog_datum`, `nyelv`) VALUES
(33, 'Lesznek akik lebeszélnek, mert valójában legbelül nem esne nekik jól ha neked sikerülne.', '2024-02-03', 1),
(34, 'Nem a súly nehéz, hanem Te vagy csicska\r\n', '2024-01-23', 1),
(35, '\r\nI hated every minute of training, but I said, ‘Don’t quit. Suffer now and live the rest of your life as a champion.', '2023-11-22', 0),
(36, 'uziiii', '2004-02-13', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csevego`
--

CREATE TABLE `csevego` (
  `csevego_id` int(11) NOT NULL,
  `csevego_email` varchar(255) NOT NULL,
  `csevego_uzenet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `csevego`
--

INSERT INTO `csevego` (`csevego_id`, `csevego_email`, `csevego_uzenet`) VALUES
(52, 'Kasza.Tibcsi@gmail.com', 'Az új számom nagyon menő lett, ajánlom minden kedves edzőtársamnak. Remélem nektek is tetszik várom ra a lájkolat!!!'),
(75, 'kiskaracsony@gmail.com', 'Hagyj üzenetet');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `felhasznalo_id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `felhasznalo_cel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`felhasznalo_id`, `username`, `password`, `felhasznalo_cel`) VALUES
(1, 'user1', '', 3),
(2, 'user2', '', 1),
(3, 'user3', '', 2),
(4, 'user4', '', 1),
(5, 'user5', '', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo_cel`
--

CREATE TABLE `felhasznalo_cel` (
  `cel_id` int(11) NOT NULL,
  `cel_elnevezes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalo_cel`
--

INSERT INTO `felhasznalo_cel` (`cel_id`, `cel_elnevezes`) VALUES
(1, 'Izomtömeg növelés'),
(3, 'Szálkásítás');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `film`
--

CREATE TABLE `film` (
  `film_id` int(11) NOT NULL,
  `film_cim` varchar(50) NOT NULL,
  `film_datum` date NOT NULL,
  `film_hossz` int(11) NOT NULL,
  `film_kep` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `film`
--

INSERT INTO `film` (`film_id`, `film_cim`, `film_datum`, `film_hossz`, `film_kep`) VALUES
(1, 'Wandavision', '0000-00-00', 0, '1.png'),
(2, 'Loki', '0000-00-00', 0, '2.png'),
(3, 'Falcon and the winter soldier', '0000-00-00', 0, '3.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gyakorlatok`
--

CREATE TABLE `gyakorlatok` (
  `gyakorlat_id` int(11) NOT NULL,
  `gyakorlat_nev` varchar(100) NOT NULL,
  `izomcsoport` int(100) NOT NULL,
  `gyakorlat_leiras` text NOT NULL,
  `gyakorlat_img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `gyakorlatok`
--

INSERT INTO `gyakorlatok` (`gyakorlat_id`, `gyakorlat_nev`, `izomcsoport`, `gyakorlat_leiras`, `gyakorlat_img`) VALUES
(17, 'Guggolás rúddal', 19, 'Állj a rúddal a vállaid hátsó és alsó részén tartva, tarts a vállszélességűnél kissé szélesebb fogást.\nÁllj a lábaiddal széles terpeszben, a lábfejedet kissé kifelé fordítsd. Tarts egyenes hátat és feszítsd meg a rekeszizmaidat. Lassan hajlítsd meg a térdeidet és ügyelj arra, hogy a súly közvetlenül lefelé mozogjon. Menj le addig, amíg a combod legalább párhuzamos nem lesz a padlóval. Lassan nyomd fel magad a lábaiddal a kiindulási pozícióba.', 'guggolasruddal.gif'),
(18, 'Román felhúzás', 19, ' Állj a súlyzóval vagy rúddal a kezedben, tarts a vállszélességűnél kissé szélesebb fogást. Tartsd egyenesen a hátadat és enyhén hajlítsd meg a térdedet. Húzd fel a súlyt a tested előtt közvetlen, közben az alsó háti izmaidat összeszorítva és a hátadat egyenesen tartva. Lassan engedd le a súlyt a combjaidra úgy, hogy közben kontrolláltan mozgatod a testedet. Ismételd a mozgást a megfelelő számú ismétléssel és a megfelelő súllyal.', 'romanfelhuzas.gif'),
(19, 'Lábtolás', 19, 'Ülj le a lábtoló gépre úgy, hogy a hátad illeszkedjen a támlához. Állítsd be a súlyokat vagy a terhelést a gépen az edzéshez szükséges szintre. Tartsd egyenesen a hátad és fogd meg a markolatot. Nyomd ki a lábad éppen úgy hogy ne legyen teljesen kinyújtva, nehogy befeszüljön a térded, majd óvatosan engedd vissza addig, hogy a csípőd még ne emelkedjen fel, majd ismételd meg a saját céljaid szerint.', 'labtolo.gif'),
(20, 'Ülő vádliemelés', 19, 'Ülj le a vádliemelő gépre, a lábaid alatt a vádlid egy tárcsán. Helyezd a térded vagy lábszárad a gép vagy kézisúlyzó támaszára és fogd meg a markolatot vagy a támaszt a kezeddel. Emeld fel a súlyt a vádlid segítségével, miközben a lábizmaidat használod. Fokozatosan engedd le a súlyt a kiindulási pozícióba, majd ismételd a mozgást.', 'ulovadli.gif'),
(21, 'Ülő combfeszítő', 19, 'Ülj le a lábhajlító gépre úgy, hogy a lábad a párnára helyezkedjen és a bokádat a megfelelő rögzítőpárnával rögzítsd. Állítsd be a gépet a kívánt terhelésre vagy súlyra az edzéshez szükséges szinten. Tartsd a megfelelő testtartást, és fogd meg a markolatot vagy a támaszt a gépen. Hajlítsd be a lábfejed a combjaid felé, miközben koncentrálsz a combhajlító izmokra. Lassan engedd vissza a lábad a kiindulási pozícióba kontrolláltan.', 'ulocombfeszito.gif'),
(22, 'Kitörés', 20, ' Állj meg egy súlyzóval vagy rúddal a vállaid mögött vagy a vállaid előtt, a vállszélességnél kissé szélesebb fogással. Lépj előre egy nagy lépést, majd a másik lábadat húzd hátrafelé, hogy a farizmodat aktívan használd. Hajlítsd meg az első lábad térdét úgy, hogy a másik lábad hátul legyen, és közelítse a padlót. Helyezd a testsúlyodat az első lábadra, miközben leengeded a másik térdedet a padlóhoz közel, majd emeld vissza a kiindulási pozícióba.', 'kitores.gif'),
(23, 'Hip thrust', 20, 'Ülj le a földre úgy, hogy a hátad támaszkodjon egy padra vagy egy magasabb felületre, például edzőpadra. A lábadat hajlított térdű pozícióba hozd, a talpad a padlón. A hátadnak és a lapockáidnak stabilan kell támaszkodnia a padon. A vállaidat és a fejedet is tartsd egyenes vonalban. Helyezz egy súlyt a csípődre, és tartsd szorosan a kezeiddel. Ez lehet súlyzó vagy súlyzótárcsa. Nyomd fel a csípődet, emeld a tested felfelé a padra úgy, hogy a farizmodat használod, majd lassan ereszd vissza a kiindulási pozícióba.', 'hipthrust.gif'),
(24, 'Padra fellépés', 20, 'Állj egy pad vagy emelvény előtt, és tarts a kezedben súlyzót vagy rudat a vállaidnál. Emeld fel az egyik lábadat, és tedd a padra úgy, hogy a súlyoddal a másik lábadra támaszkodsz. Lassan hajlítsd be a térdedet, és engedd le a tested addig, amíg a másik lábad térdhajlata majdnem a padhoz nem ér. Nyomd fel a padra lépés során a testedet a sarkadon keresztül és használd a farizmodat, majd térj vissza a kiindulási pozícióba.', 'padralepes.gif'),
(25, 'Hiperhajlítás', 20, 'Lépj a hiperhajlító eszközhöz vagy alá egy párnát helyezz a térded alá, hogy stabilan tudj támaszkodni. Rögzítsd lábadat a padhoz vagy az eszközhöz, majd tartsd meg a derékvonaladat egyenesen. Engedd le a tested a pad felé, miközben feszíted a farizmodat és a combhajlítókat. Lassan emeld vissza a testedet a kiindulási pozícióba, miközben erőteljesen használod a hátsó lábizmaidat.', 'hiperhajlitas.gif'),
(26, 'Plank', 21, 'Kezdd a gyakorlatot úgy, hogy az alkarjaid és a lábfejeid érintik a padlót, közben pedig emeld a tested egyenes vonalban. Az alkarjaid a vállak alatt legyenek, a könyökeid pontosan a vállak alatt, és a tenyeredet szorítsd össze. Tartsd egyenesen a hátadat, ne hagyd, hogy a medence emelkedjen vagy süllyedjen. A fejed legyen egyenesen a gerinceddel, a nyakad és a fejed is egyenes vonalban a hátaddal. Tartsd ezt a pozíciót, miközben feszíted a törzsizmaidat.', 'plank.gif'),
(27, 'Hasprés', 21, 'Feküdj hanyatt a padlón vagy egy szőnyegen, húzd enyhén fel a térdedet, és tedd a lábfejed laposan a talajra. Tedd a kezedet a tarkódra, majd a lapockád aljáig emeld meg a felsőtested miközben a hasizmaidat használod Fokozatosan ereszd le a felsőtestedet a kiindulási pozícióba, majd ismételd a mozgást.', 'haspres.gif'),
(28, 'Lábemelés fekve', 21, 'Feküdj hanyatt a padlón vagy egy szőnyegen, hosszában, és tartsd a karodat a tested mellett vagy a talajon a tenyereddel lefelé. Feszítsd meg a hasizmaidat, és emeld lassan a lábaidat a padlóról úgy, hogy a lábad merőlegesen legyen a padlóra. Emeld a lábaidat addig, amíg a deréktájéknél a farizmok megfeszülnek, majd lassan engedd vissza a lábaid a padlóhoz. Ismételd a mozgást kontrolláltan.', 'labemeles.gif'),
(29, 'Karhajlítás rúddal', 23, 'Ülj le egy Scott padra vagy egyenes háttal egy székre, és tartsd a rudat az alsó fogásnál. A karhajlító rúd (vagy súlyzó, francia rúd) legyen a tested előtt, a karod pedig az előredőlés helyett stabilan a párnán vagy a széken. Lassan emeld fel a rudat, miközben a bicepsz izmaidat használod, és a könyökízület maradjon fix helyzetben. Fokozatosan ereszd vissza a rudat a kiindulási pozícióba kontrolláltan.', 'karhajlitas.gif'),
(30, 'Kalapács', 23, 'Fogj két súlyzót a kezedben úgy, hogy a tenyereidd egymáshoz közel legyenek (a hüvelykujjad legyen kifelé mutató).\nÁllj egyenesen, tartsd a karodat lefelé a tested mellett a súlyzókkal. Emeld fel a súlyzókat a vállaidig úgy, hogy a könyökízületed fix maradjon és csak a karodat emeled meg. Fokozatosan ereszd le a súlyzókat kontrolláltan a kiindulási pozícióba.', 'kalapacs.gif'),
(31, 'Húzódzkodás befelé néző tenyérrel (chin-up)', 23, 'Fogd meg a húzódzkodó rudat, úgy hogy a tenyered befelé nézzen és a fogás legyen vállszélességűnél kissé szélesebb.\nLógj le a húzódzkodó rúdról, a kezeid kinyújtva és a tested alulról felfelé tartva. Feszítsd meg a törzsed és a hátsó izmokat, majd húzd fel magad a rúdhoz úgy, hogy a könyököd a tested mellett legyen. Lassan ereszd vissza a kiindulási pozícióba.', 'chinup.gif'),
(33, 'Tolódzkodás', 22, 'Állj a tolókarok között vagy egy padra támaszkodva, a kezeid a tested mögött, vállszélességűnél kissé szélesebb fogással. Tarts egyenes háttal és feszesített törzzsel, majd hajlítsd meg a könyöködet, és lassan engedd le a testedet a pad felé, miközben a tricepsz izmaidat használod. A könyököket hajlítsd meg, amennyire csak lehetséges, majd nyomd vissza magad a kiindulási pozícióba.', 'tolodzkodas.gif'),
(34, 'Fekvenyomás szűk fogással', 22, 'Feküdj le a padra úgy, hogy a fejed a szűkebb fogást (vállszélességűnél szűkebb) tartó rudat vagy súlyzót érintse. Tartsd a karjaidat egyenesen, majd emeld ki a rudat a tartóról, és zárd össze a kezed. Engedd le a súlyt a mellkasodhoz úgy, hogy a könyökeid szorosan maradjanak a tested mellett. Nyomd vissza a súlyt a kiindulási pozícióba a karjaidat kiegyenesítve.', 'szukfekvenyomas.gif'),
(35, 'Tricepsznyújtás ülve', 22, 'Ülj le egy padra vagy egyenes székbe, tarts egy kézisúlyzót mindkét kezedben, emeld a kezeidet fejed fölé és egyenesítsd ki őket. Hajlítsd meg a könyöködet, engedd le a súlyzót a fejed mögé, miközben a karod csak a könyökízületednél mozog. Nyomd fel a súlyzót, hajlítva a könyököd, vissza a kiindulási pozícióba.', 'tricinyujtasulo.gif'),
(36, 'Tricepsznyújtás fekve', 22, 'Feküdj hanyatt egy padra vagy szőnyegre, tarts egy kézisúlyzót mindkét kezedben a fejed fölé emelve, a karok kiegyenesítve.\nHajlítsd le a könyöködet, engedd le a súlyzót a fejed mögé, miközben a felsőkarod a helyén marad. Nyomd vissza a súlyzót a kiindulási pozícióba, hajlítva a könyököd.', 'fekvetricepsz.gif'),
(37, 'Vállból nyomás', 25, 'Ülj egyenesen, tarts egy súlyzót vagy rudat a vállaidnál vállszélességűnél kissé szélesebb fogással.\r\nEmeld fel a súlyzót a vállaid felett, miközben a könyöködet enyhén az arcod irányába tolod, a karjaid kiegyenesítve.\r\nNyomd fel a súlyt egyenesen felfelé a mennyezet felé, majd lassan engedd vissza a súlyzót a vállaidhoz.', 'vallbolnyomas.gif'),
(38, 'Előreemelés', 25, 'Állj egyenesen, tarts egy kézisúlyzót vagy rudat a tested előtt, a kezed közel legyen a combjaidhoz. Emeld lassan a súlyt előre egyenes karokkal, a vállaid előtt, közben a karod legyen vízszintes a padlóval. Fokozatosan ereszd vissza a súlyt a kiindulási pozícióba kontrolláltan.', 'eloreemeles.gif'),
(39, 'Oldalemelés', 25, 'Állj egyenesen, tarts egy kézisúlyzót vagy két súlyzót a tested mellett, a karjaid leengedve. Emeld lassan a súlyokat srégen oldalra egyenes karokkal, a vállaid szintjénél kissé magasabban, majd tartsd meg a felső helyzetet rövid ideig. Fokozatosan ereszd vissza a súlyokat a kiindulási pozícióba kontrolláltan.', 'oldalemeles.gif'),
(40, 'Fekvenyomás rúddal', 26, 'Feküdj le egy padra vagy edzőpadra, és helyezd a vállszélességnél szélesebb fogással a rudat a mellkasod fölé.\r\nEmeld ki a rudat a tartóból, tartsd egyenes karokkal a mellkasod fölött. Lassan ereszd a rudat a mellkasodhoz, majd nyomd vissza a kiindulási pozícióba, feszítve a mellizmokat és a tricepszeket.', 'fekvenyomas.gif'),
(41, 'Csigás keresztezés', 26, 'Állítsd be a két csigás gépet a legfelső ponton lévő fogóval. Fogj egy-egy fogantyút a kezeiddel, és lépj egy kicsit előre a gépektől, hogy megfelelő feszültséget érj el a kábeleknél. Karjaidat hajlítsd enyhén, majd a két kezeddel lassan húzd keresztbe a fogantyúkat egészen a tested előtt, közben a karok kissé enyhén hajlítsanak. Tartsd meg a mellizmok feszültségét a mozgás során, majd lassan térj vissza a kezdő pozícióba.', 'csigaskeresztezes.gif'),
(42, 'Tárogatás', 26, 'Ülj le a pec deck géphez, és állítsd be a karokat úgy, hogy a kezeid vállmagasságban legyenek. Fogd meg a fogantyúkat vagy a kart a kezeiddel, majd nyomd össze a karokat egymással a mellizmok aktiválásához. Fokozatosan engedd szét a karokat a kiindulási pozícióba, közben kontrolláltan ellazítva a mellizmokat.', 'tarogatas.gif'),
(43, 'Evezés rúddal', 27, 'Állj meg egyenesen, tarts egy súlyzót vagy rudat a kezedben, vállszélességűnél kissé szélesebb fogással. Hajolj előre a derékból, tartsd meg a természetes hátívet, és engedd le a felső testedet kissé előre. A karok nyúljanak lefelé a súlyzóval a kezedben. Húzd fel a súlyzót a hasadhoz, közben a könyöködet húzd hátrafelé és felfelé. Tartsd meg egy rövid ideig a felső pozíciót, majd lassan engedd vissza a súlyzót a kiindulási pozícióba.', 'evezesruddal.gif'),
(46, 'Fűrész', 27, 'Állj meg egyenesen egy súlyzóval vagy kézisúlyzóval mindkét kezedben. Hajolj előre a derékból úgy, hogy a felső tested kissé előredől, de tartsd meg a természetes hátívet. Emeld fel a súlyzókat a mellkasodhoz vagy hasadhoz, közben a könyöködet húzd hátrafelé és felfelé. Tartsd meg egy rövid ideig a felső pozíciót, majd lassan engedd vissza a súlyzót a kiindulási pozícióba.', 'furesz.gif'),
(47, 'Lehúzás V-rúddal', 27, 'Állj a lehúzó gép elé, fogd meg a V-rudat szélesen. Hajlítsd meg a könyököd, húzd le a rudat a mellkasodhoz. Tartsd meg a pozíciót egy rövid ideig, majd lassan emeld vissza a rudat. Koncentrálj a hátizmaid használatára, és tartsd stabilan a tested.', 'lehuzasvruddal.gif'),
(48, 'Széles lehúzás', 27, 'Állj a lehúzó gép elé, fogd meg a rudat szélesen, a kezeket vállszélesség felett.\nHajlítsd meg a könyököd, húzd le a rudat a mellkasodhoz. Tartsd meg a pozíciót egy rövid ideig, majd lassan engedd vissza a rudat. Koncentrálj a felső hátsó izmaidra, és tartsd a tested stabilan.', 'szeleslehuzas.gif');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `izomcsoportok`
--

CREATE TABLE `izomcsoportok` (
  `izomcsoport_id` int(11) NOT NULL,
  `izomcsoport_nev` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `izomcsoportok`
--

INSERT INTO `izomcsoportok` (`izomcsoport_id`, `izomcsoport_nev`) VALUES
(19, 'Lábizmok'),
(20, 'Farizmok'),
(21, 'Hasizmok'),
(22, 'Tricepsz'),
(23, 'Bicepsz'),
(25, 'Vállizmok'),
(26, 'Mellizmok'),
(27, 'Hátizmok');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kaja_ferfi`
--

CREATE TABLE `kaja_ferfi` (
  `kaja_id` int(11) NOT NULL,
  `etel` varchar(255) NOT NULL,
  `kaja_kaloria` varchar(255) NOT NULL,
  `kaja_kategoria` int(11) NOT NULL,
  `mennyiseg` varchar(255) NOT NULL,
  `feherje` varchar(255) NOT NULL,
  `szenhidrat` varchar(255) NOT NULL,
  `zsir` varchar(255) NOT NULL,
  `suly_fajta` int(11) NOT NULL,
  `suly_mertek` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kaja_ferfi`
--

INSERT INTO `kaja_ferfi` (`kaja_id`, `etel`, `kaja_kaloria`, `kaja_kategoria`, `mennyiseg`, `feherje`, `szenhidrat`, `zsir`, `suly_fajta`, `suly_mertek`) VALUES
(1, '2 édesburgonyás fehérjepalacsinta,\r\n1 evőkanál szirup,\r\n1 evőkanál vaj,\r\nmultivitamin, 3 g halolaj', '542', 1, '--', '24', '72,4', '17,6', 2, 11),
(2, '2 szelet teljes kiőrlésű kenyér,\r\n100 g extra sovány 5% zsírtartalmú sonka,\r\nfejes saláta,\r\nmustár,\r\nparadicsom,\r\ncsípős szósz(ízlés szerint),\r\n1 evőkanál majonéz', '367', 4, '--', '31,2', '30,5', '11,5', 2, 11),
(3, '1 merőkanál tejsavó,\r\n1 közepes banán,\r\nedzés előtti formula (pre-workout)', '210', 10, '--', '23,3', '30', '0,4', 2, 11),
(4, '1 mérőkanál tejsavó,\r\n300 ml rizstej,\r\n2 közepes banán,\r\n1 evőkanál mogyoróvaj,\r\n5 g kreatin', '556', 3, '--', '22,9', '90,9', '11,4', 2, 11),
(5, '100 g csirkemell,\r\n200 g teljes kiőrlésű tészta,\r\n100 ml paradicsomos tésztaszósz,\r\n2 evőkanál parmezán sajt,\r\n30 g tejcsokoládé,\r\n3 g halolaj', '683', 5, '--', '41,7', '87,8', '19,1', 2, 11),
(6, '1 mérőkanál tejsavó,\r\n250 ml tej,\r\n70 g fekete áfonya,\r\n37 g hagyományos zabpehely,\r\nmultivitamin, 3 g halolaj, rost', '402', 1, '--', '31,1', '38', '12,8', 2, 12),
(7, '2 szelet teljes kiőrlésű kenyér\r\n2 evőkanál mogyoróvaj	\r\n1 evőkanál lekvár	', '404', 9, '--', '16,1', '48,1', '16,3', 2, 12),
(8, '110 g csirkemell,\r\n74 g (szárazon mérve) basmati rizs,\r\n85 g zöldség (karfiol, spárga, cukkini, ceruzabab, hagyma, uborka, répa),\r\n1/2 evőkanál vaj,\r\ncitromlé, koriander (ízlés szerint)', '510', 4, '--', '34,4', '74,1', '8,6', 2, 12),
(9, '110 g csirkemell,\r\n225 g édesburgonya,\r\n110 g zöldborsó,\r\n1/2 evőkanál vaj,\r\nfahéj a burgonyára (ízlés szerint),\r\n3 g halolaj, multivitamin	', '488', 5, '--', '53,4', '62,5', '11', 2, 12),
(10, '1 mérőkanál tejsavó,\r\n250ml rizsfej,\r\nedzés előtti formula (pre-workout)', '230', 10, '', '23', '32', '2', 2, 12),
(11, '1 mérőkanál tejsavó,\r\n250 rizstej,\r\n2 nagy banán,\r\n2 evőkanál mogyoróvaj,\r\nkreatin	', '650', 3, '--', '34', '95,3', '19', 2, 12),
(12, '5 tojásfehérje,\r\n2 evőkanál salsa szósz (ízlés szerint),\r\n40 g (szárazon mérve) hagyományos zabpehely,\r\nfahéj, stevia, szerecsendió, vanilíakivonat (ízlés szerint),\r\n1 mérőkanál tejsavó,\r\n250 ml mandulatej (édesítetlen),\r\nvitaminok', '385', 1, '--', '46', '34,8', '6', 1, 8),
(13, '2 mérőkanál tejsavófehérje,\r\n250 ml mandulatej (édesítetlen),\r\n1 közepes alma,\r\n2 evőkanál mogyoróvaj,\r\nedzés előtti formula (pre-workout)', '528', 10, '--', '53', '41,4', '19,6', 1, 8),
(14, '200 g garnéla,\r\n250 g (főve) barna rizs	,\r\n100 g párolt zöldség (brokkoli, karfiol, spárga, kaliforniai paprika, ceruzabab, répa, hagyma),\r\nkreatin	', '505', 4, '--', '54,3', '64,1', '4,7', 1, 8),
(15, '2250g csirkemell,\r\n200 g burgonya,\r\nsaláta (60g spenót 1/2 répa, 1/2 uborka, 1 csokor zeller),\r\n2 evőkanál balzsamecet,\r\n1 evőkanál vaj', '524', 5, '--', '63,2', '46,3', '1,5', 1, 8),
(16, '200 g 0%-os görög joghurt\r\n100 g eper', '146', 11, '--', '21,2', '15,4', '0', 1, 8),
(17, 'edzés előtti formula	\r\najánlott 10 g BCAA (az éhgyomor edzés miatt),\r\najánlott yohimbine (az éhgyomor edzéshez),', '5', 3, '--', '0', '1', '0', 1, 13),
(18, '2 banános zsabkenyér,\r\n40 g fekete áfonya', '372', 1, '--', '31', '50,3', '6', 1, 13),
(19, '170 g csirkemell,\r\nsaláta (300 g spenót, 1/2 répa, 1/2 uborka, 1/2 közepes paradicsom),\r\n2 kupaknyi balzamecet', '254', 4, '--', '41,9', '12,4', '2,8', 1, 13),
(20, '1 szelet teljes kiőrlésű kenyér,\r\n1 evőkanál mogyoróvaj,\r\n1 mérőkanál tejsavó,\r\n250 ml mandulatej (édesítetlen)', '403', 8, '--', '35', '23,3', '19,2', 1, 13),
(21, '170 g sovány hátszín,\r\n170 g burgonya,\r\n1 evőkanál vaj,\r\n85 g zöldség ( brokkoli, karfiol, spárga, cukkini, ceruzabab, kaliforniai paprika, répa, hagyma)', '550', 5, '--', '45,2', '36,3', '23,7', 1, 13),
(22, '170 g 2%-os görög joghurt, \r\nstevia,\r\n15 mandula', '254', 11, '--', '23,8', '11,9', '13', 1, 13);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kaja_kategoria`
--

CREATE TABLE `kaja_kategoria` (
  `kategoria_id` int(11) NOT NULL,
  `kategoria_nev` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kaja_kategoria`
--

INSERT INTO `kaja_kategoria` (`kategoria_id`, `kategoria_nev`) VALUES
(1, 'Reggeli'),
(3, 'Edzés utáni turmix'),
(4, 'Ebéd'),
(5, 'Vacsora'),
(6, 'Edzés előtti étkezés'),
(7, 'Edzés utáni étkezés'),
(8, 'Uzsonna'),
(9, 'Tízórai	'),
(10, 'Edzés előtti turmix'),
(11, 'Utóvacsora');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kaja_noi`
--

CREATE TABLE `kaja_noi` (
  `kaja_id` int(11) NOT NULL,
  `etel` varchar(255) NOT NULL,
  `kaja_kaloria` varchar(255) NOT NULL,
  `kaja_kategoria` int(11) NOT NULL,
  `mennyiseg` varchar(255) NOT NULL,
  `feherje` varchar(255) NOT NULL,
  `szenhidrat` varchar(255) NOT NULL,
  `zsir` varchar(255) NOT NULL,
  `suly_fajta` int(11) NOT NULL,
  `suly_mertek` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kaja_noi`
--

INSERT INTO `kaja_noi` (`kaja_id`, `etel`, `kaja_kaloria`, `kaja_kategoria`, `mennyiseg`, `feherje`, `szenhidrat`, `zsir`, `suly_fajta`, `suly_mertek`) VALUES
(3, '0% zsírtartalmú natúr görög joghurt,\r\nbanán,\r\nfekete áfonya,\r\nzsírszegény müzli\r\n', '456', 1, '546 gramm', '30', '81', '4', 2, 6),
(4, 'zsírszegény tortilla,\r\ncheddar sajt,\r\ncsirkemell filé,\r\nzsírmentes fehérbabhumusz,\r\nsalsa szósz', '529', 7, '366 gramm', '42', '49', '18', 2, 6),
(5, 'garnélarák,\r\nbarna rizs,\r\nbrokkoli,\r\ncukkini,\r\nsárgarépa,\r\nolívaolaj', '474 ', 4, '475 gramm', '30', '73', '8', 2, 6),
(6, 'csirkemellfilé,\r\nárpa,\r\nsteak szósz,\r\nkarfiol,\r\nvaj', '468', 5, '385 gramm', '30', '60', '14', 2, 6),
(7, 'tojásfehérje,\r\nsült baconszalonna,\r\nteljes kiőrlésű kenyér,\r\nlekvár,\r\nvaj', '282', 6, '166 gramm', '21', '29', '8', 2, 9),
(8, '0% zsírtartalmú natúr görög joghurt,\r\nédesítés nélküli rizstej,\r\nbanán,\r\nfekete áfonya', '418', 3, '694 gramm', '21', '81', '4', 2, 9),
(9, 'teljes kiőrlésű árpa,\r\nzsírszegény provolone sajt,\r\ngrillezett pulykamell,\r\nzsírszegény majonéz,\r\nmustár', '409', 4, '203 gramm', '39', '40', '8', 2, 9),
(10, 'alma', '95', 8, '182 gramm', '0', '25', '0', 2, 9),
(11, 'zsír nélküli hátszín,\r\nbarna rizs,\r\n70-85%-os étcsokoládé', '429 ', 5, '194 gramm', '29', '68', '12', 2, 9),
(12, 'zabpehely,\r\nsovány tej,\r\nbarna cukor,\r\neper,\r\nbanán,\r\nfahéj', '457', 1, '571 gramm', '16', '96', '4', 2, 10),
(13, 'max. 10% zsírtartalmú darált marhahús,\r\nfehér rizs,\r\nkelbimbó,\r\nolívaolaj', '579', 6, '400 gramm', '37', '76', '13', 2, 10),
(14, 'fejes saláta,\r\ncsirkemellfilé,\r\ncékla,\r\nparadicsom,\r\nkaliforniai paprika,\r\nzsírszegény balzsamecet,\r\nfehér kenyér', '553', 4, '640 gramm', '49', '62', '11', 2, 10),
(15, 'tenyésztett atlanti lazac,\r\nédesburgonya,\r\nspárga,\r\n70-85%-os étcsokoládé', '568', 5, '590 gramm', '35', '75', '25', 2, 10),
(16, 'tojásfehérje,\r\negész tojás,\r\neper,\r\nalma', '290', 1, '522 gramm', '23', '37', '5', 1, 6),
(17, '0% zsírtartalmú natúr görög joghurt,\r\nízesítés nélküli rizstej,\r\nfekete áfonya', '429', 7, '780 gramm', '43', '56', '4', 1, 6),
(18, 'zsír nélküli hátszín,\r\nkelbimbó,\r\nspárga,\r\nkarfiol,\r\n70-85%-os étcsokoládé', '439', 5, '470 gramm', '41', '27', '20', 1, 6),
(19, 'fejes saláta,\r\ncsirkemellfilé,\r\ncékla,\r\nparadicsom,\r\nkaliforniai paprika,\r\nzsírszegény balzsamecet', '280', 4, '510 gramm', '31', '23', '7', 1, 6),
(20, 'hátszín zsíros részek nélkül,\r\nkelbimbó, \r\nspárga,\r\nkarfiol,\r\n70-85%-os étcsokoládé', '439', 5, '470 gramm', '41', '27', '20', 1, 6),
(21, '0% zsírtartalmú natúr görög joghurt,\r\nbanán', '322', 6, '476 gramm', '36', '43', '1', 1, 7),
(22, '0% zsírtartalmú natúr görög joghurt,\r\nédesítés nélküli mandulatej,\r\nfekete áfonya,\r\nbanán', '379', 3, '756 gramm', '27', '63', '3', 1, 7),
(23, 'csirkemellfilé,\r\nzsírmentes fehérbabhumusz,\r\nzsírszegény cheddar sajt,\r\nvöröshagyma,\r\nparadicsom,\r\nsalsa szósz, \r\nolívaolaj', '589', 4, '584', '80', '30', '22', 1, 7),
(24, 'sertéskaraj zsír nélkül, \r\nsütőtök,\r\nbrokkoli,\r\nkarfiol,\r\nvaj', '475', 5, '610 gramm', '52', '35', '15', 1, 7),
(25, 'tojásfehérje,\r\negész tojás,\r\nvöröshagyma,\r\nkaliforniai paprika,\r\ngomba', '348', 6, '580 gramm', '48', '14', '10', 1, 8),
(26, '2% zsírtartalmú görög joghurt,\r\neper,\r\nfekete áfonya', '397', 7, '700 gramm', '32', '56', '8', 1, 8),
(27, 'grillezett pulykamell,\r\nzöldborsó,\r\nsárgarépa,\r\nolívaolaj', '650', 4, '660 gramm', '80', '48', '16', 1, 8),
(28, 'afrikai harcsa,\r\nbarna rizs,\r\nbrokkoli,\r\ncitromlé,\r\nvaj', '780 ', 5, '480 gramm', '62', '98', '15', 1, 8);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kedvencek`
--

CREATE TABLE `kedvencek` (
  `kedvenc_id` int(11) NOT NULL,
  `kedvenc_felhasznalo_id` int(11) NOT NULL,
  `kedvenc_gyakorlat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kedvencek`
--

INSERT INTO `kedvencek` (`kedvenc_id`, `kedvenc_felhasznalo_id`, `kedvenc_gyakorlat_id`) VALUES
(33, 1, 26),
(36, 1, 26),
(39, 1, 29),
(42, 1, 29),
(45, 1, 43),
(48, 1, 40),
(51, 1, 40),
(54, 1, 27),
(57, 1, 27),
(60, 1, 27),
(63, 1, 27),
(66, 1, 29),
(69, 1, 33),
(72, 1, 33),
(75, 1, 17),
(78, 1, 17),
(81, 1, 22),
(84, 1, 37),
(87, 1, 37),
(90, 1, 38),
(93, 1, 38),
(96, 1, 29),
(99, 1, 29),
(102, 1, 17);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `neme`
--

CREATE TABLE `neme` (
  `neme_id` int(11) NOT NULL,
  `neme` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `neme`
--

INSERT INTO `neme` (`neme_id`, `neme`) VALUES
(5, 'férfi'),
(6, 'nő');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(2, 'moderator', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(3, 'admin', '2020-08-02 14:57:31', '2020-08-02 14:57:31');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `suly_fajta`
--

CREATE TABLE `suly_fajta` (
  `suly_id` int(11) NOT NULL,
  `suly_fajta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `suly_fajta`
--

INSERT INTO `suly_fajta` (`suly_id`, `suly_fajta`) VALUES
(1, 'szálkásító'),
(2, 'izomtömeg-növelő');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `suly_mertek`
--

CREATE TABLE `suly_mertek` (
  `mertek_id` int(11) NOT NULL,
  `mertek` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `suly_mertek`
--

INSERT INTO `suly_mertek` (`mertek_id`, `mertek`) VALUES
(6, '55'),
(7, '73'),
(8, '90'),
(9, '45'),
(10, '63'),
(11, '68'),
(12, '82'),
(13, '100');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szavazat`
--

CREATE TABLE `szavazat` (
  `szavazat_id` int(11) NOT NULL,
  `szavazat_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szavazat`
--

INSERT INTO `szavazat` (`szavazat_id`, `szavazat_film`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 2),
(8, 1),
(9, 1),
(10, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'user', 'user', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'mod', 'mod', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'admin', 'admin', '$2a$08$97Ze1/hXfOX44WdC62Rq8uRkog9HYC1HukRX8eld2ZEKPyenM5v.G', '2020-08-02 15:03:59', '2020-08-02 15:03:59'),
(14, 'valaki', 'valaki@gmail.com', '$2a$08$2I9RHv7Yt6ljopICRKZq9.c/PzU.jDQU2zqtSD16A3kjQjbBuhw1a', '2024-02-06 17:37:10', '2024-02-06 17:37:10');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 1, 3),
('2024-02-06 17:37:10', '2024-02-06 17:37:10', 1, 14),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 2),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 3, 3);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- A tábla indexei `csevego`
--
ALTER TABLE `csevego`
  ADD PRIMARY KEY (`csevego_id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`felhasznalo_id`),
  ADD KEY `felhasznalo_cel` (`felhasznalo_cel`);

--
-- A tábla indexei `felhasznalo_cel`
--
ALTER TABLE `felhasznalo_cel`
  ADD PRIMARY KEY (`cel_id`);

--
-- A tábla indexei `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`film_id`);

--
-- A tábla indexei `gyakorlatok`
--
ALTER TABLE `gyakorlatok`
  ADD PRIMARY KEY (`gyakorlat_id`),
  ADD KEY `izomcsoport` (`izomcsoport`);

--
-- A tábla indexei `izomcsoportok`
--
ALTER TABLE `izomcsoportok`
  ADD PRIMARY KEY (`izomcsoport_id`);

--
-- A tábla indexei `kaja_ferfi`
--
ALTER TABLE `kaja_ferfi`
  ADD PRIMARY KEY (`kaja_id`),
  ADD KEY `kaja_kategoria` (`kaja_kategoria`,`suly_fajta`,`suly_mertek`),
  ADD KEY `suly_fajta` (`suly_fajta`),
  ADD KEY `suly_mertek` (`suly_mertek`);

--
-- A tábla indexei `kaja_kategoria`
--
ALTER TABLE `kaja_kategoria`
  ADD PRIMARY KEY (`kategoria_id`);

--
-- A tábla indexei `kaja_noi`
--
ALTER TABLE `kaja_noi`
  ADD PRIMARY KEY (`kaja_id`),
  ADD KEY `kaja_kategória` (`kaja_kategoria`),
  ADD KEY `suly_fajta` (`suly_fajta`),
  ADD KEY `suly_mertek` (`suly_mertek`);

--
-- A tábla indexei `kedvencek`
--
ALTER TABLE `kedvencek`
  ADD PRIMARY KEY (`kedvenc_id`);

--
-- A tábla indexei `neme`
--
ALTER TABLE `neme`
  ADD PRIMARY KEY (`neme_id`);

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `suly_fajta`
--
ALTER TABLE `suly_fajta`
  ADD PRIMARY KEY (`suly_id`);

--
-- A tábla indexei `suly_mertek`
--
ALTER TABLE `suly_mertek`
  ADD PRIMARY KEY (`mertek_id`);

--
-- A tábla indexei `szavazat`
--
ALTER TABLE `szavazat`
  ADD PRIMARY KEY (`szavazat_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT a táblához `csevego`
--
ALTER TABLE `csevego`
  MODIFY `csevego_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `felhasznalo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `felhasznalo_cel`
--
ALTER TABLE `felhasznalo_cel`
  MODIFY `cel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `film`
--
ALTER TABLE `film`
  MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT a táblához `gyakorlatok`
--
ALTER TABLE `gyakorlatok`
  MODIFY `gyakorlat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT a táblához `izomcsoportok`
--
ALTER TABLE `izomcsoportok`
  MODIFY `izomcsoport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT a táblához `kaja_ferfi`
--
ALTER TABLE `kaja_ferfi`
  MODIFY `kaja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT a táblához `kaja_kategoria`
--
ALTER TABLE `kaja_kategoria`
  MODIFY `kategoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `kaja_noi`
--
ALTER TABLE `kaja_noi`
  MODIFY `kaja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT a táblához `kedvencek`
--
ALTER TABLE `kedvencek`
  MODIFY `kedvenc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT a táblához `neme`
--
ALTER TABLE `neme`
  MODIFY `neme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `suly_fajta`
--
ALTER TABLE `suly_fajta`
  MODIFY `suly_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `suly_mertek`
--
ALTER TABLE `suly_mertek`
  MODIFY `mertek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT a táblához `szavazat`
--
ALTER TABLE `szavazat`
  MODIFY `szavazat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `felhasznalo_cel`
--
ALTER TABLE `felhasznalo_cel`
  ADD CONSTRAINT `felhasznalo_cel_ibfk_1` FOREIGN KEY (`cel_id`) REFERENCES `felhasznalok` (`felhasznalo_cel`);

--
-- Megkötések a táblához `gyakorlatok`
--
ALTER TABLE `gyakorlatok`
  ADD CONSTRAINT `gyakorlatok_ibfk_1` FOREIGN KEY (`izomcsoport`) REFERENCES `izomcsoportok` (`izomcsoport_id`);

--
-- Megkötések a táblához `kaja_ferfi`
--
ALTER TABLE `kaja_ferfi`
  ADD CONSTRAINT `kaja_ferfi_ibfk_1` FOREIGN KEY (`kaja_kategoria`) REFERENCES `kaja_kategoria` (`kategoria_id`),
  ADD CONSTRAINT `kaja_ferfi_ibfk_2` FOREIGN KEY (`suly_fajta`) REFERENCES `suly_fajta` (`suly_id`),
  ADD CONSTRAINT `kaja_ferfi_ibfk_3` FOREIGN KEY (`suly_mertek`) REFERENCES `suly_mertek` (`mertek_id`);

--
-- Megkötések a táblához `kaja_noi`
--
ALTER TABLE `kaja_noi`
  ADD CONSTRAINT `kaja_noi_ibfk_1` FOREIGN KEY (`kaja_kategoria`) REFERENCES `kaja_kategoria` (`kategoria_id`),
  ADD CONSTRAINT `kaja_noi_ibfk_2` FOREIGN KEY (`suly_fajta`) REFERENCES `suly_fajta` (`suly_id`),
  ADD CONSTRAINT `kaja_noi_ibfk_3` FOREIGN KEY (`suly_mertek`) REFERENCES `suly_mertek` (`mertek_id`);

--
-- Megkötések a táblához `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

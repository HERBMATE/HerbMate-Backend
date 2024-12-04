-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 04, 2024 at 07:07 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_herbmate`
--

-- --------------------------------------------------------

--
-- Table structure for table `info_tambahan`
--

CREATE TABLE `info_tambahan` (
  `id` int NOT NULL,
  `resep` text,
  `penyakit` varchar(255) DEFAULT NULL,
  `efek_samping` text,
  `manfaat` text,
  `sumber` text,
  `nama_tanaman` varchar(255) DEFAULT NULL,
  `id_pertanyaan` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `info_tambahan`
--

INSERT INTO `info_tambahan` (`id`, `resep`, `penyakit`, `efek_samping`, `manfaat`, `sumber`, `nama_tanaman`, `id_pertanyaan`) VALUES
(4, 'Cuci bersih 5-10 lembar daun sirih segar. Rebus daun sirih dalam 2 gelas air selama 10-15 menit. Saring air rebusan dan biarkan hingga hangat. Gunakan air tersebut untuk membersihkan area yang terinfeksi.', 'Antibakteri', 'Iritasi Kulit, Kekeringan Kulit, Gangguan Mukosa, Reaksi Alergi, Kerusakan Jaringan (Penggunaan Berlebihan pada Luka), Efek Samping Oral', 'Daun sirih hijau bermanfaat sebagai antibakteri untuk bakteri Propionibacterium acnes, Porphyromonas gingivalis, dan Staphylococcus aureus.', 'https://openjournal.wdh.ac.id/index.php/Phrase/article/view/502/pdf; https://www.bernas.id/2024/10/205694/penggunaan-daun-sirih-sebagai-antiseptik-alami-untuk-luka-dan-infeksi/; https://halosehat.com/farmasi/herbal/efek-samping-daun-sirih', 'Sirih', NULL),
(5, 'Cuci bersih 10 lembar daun sirih. Tumbuk atau blender daun sirih hingga halus. Tambahkan 100 ml air matang dan aduk rata. Saring campuran untuk mendapatkan ekstrak daun sirih. Campurkan ekstrak dengan 30,3 ml gel lidah buaya untuk meningkatkan kelembutan pada kulit. Simpan dalam botol bersih dan gunakan sebagai antiseptik.', 'Antiseptik', 'Iritasi Kulit, Kekeringan Kulit, Gangguan Mukosa, Reaksi Alergi, Kerusakan Jaringan (Penggunaan Berlebihan pada Luka), Efek Samping Oral', 'Daun sirih hijau bisa digunakan untuk berkumur jika mulut mengalami pembengkakan, membersihkan napas yang bau akibat permasalahan pada mulut dan menghentikan darah.', 'https://openjournal.wdh.ac.id/index.php/Phrase/article/view/502/pdf; https://www.qoala.app/id/blog/perlindungan-diri/cara-membuat-antiseptik-dari-daun-sirih/; https://halosehat.com/farmasi/herbal/efek-samping-daun-sirih', 'Sirih', NULL),
(6, 'Cuci bersih 5-10 lembar daun sirih segar. Rebus daun sirih dalam 2 gelas air selama 10-15 menit. Saring air rebusan dan biarkan hingga hangat. Gunakan air tersebut untuk membersihkan area yang terinfeksi.', 'Luka', 'Iritasi Kulit, Kekeringan Kulit, Gangguan Mukosa, Reaksi Alergi, Kerusakan Jaringan (Penggunaan Berlebihan pada Luka), Efek Samping Oral', 'Daun sirih juga dapat membantu meningkatkan jumlah kolagen dan fibroblas terhadap penyembuhan luka, hal ini dikarenakan kandungan tanin dan flavonoid dalam daun sirih.', 'https://openjournal.wdh.ac.id/index.php/Phrase/article/view/502/pdf; https://www.bernas.id/2024/10/205694/penggunaan-daun-sirih-sebagai-antiseptik-alami-untuk-luka-dan-infeksi/; https://halosehat.com/farmasi/herbal/efek-samping-daun-sirih', 'Sirih', NULL),
(7, 'Rebus 10 lembar daun nangka segar dalam 500 ml air hingga tersisa 250 ml. Saring dan minum 2 kali sehari setelah makan.', 'Diabetes', 'Dapat menyebabkan hipoglikemia jika dikonsumsi bersamaan dengan obat penurun gula darah.', 'Membantu mengontrol kadar gula darah.', 'https://health.grid.id/read/354038672/manfaat-daun-nangka-untuk-kesehatan-salah-satunya-bantu-mengatasi-sembelit?page=all', 'Nangka', 3),
(8, 'Rebus 7 lembar daun nangka dalam 400 ml air hingga tersisa 200 ml. Minum sekali sehari sebelum tidur.', 'Hipertensi', 'Tidak dianjurkan bagi penderita tekanan darah rendah.', 'Membantu menurunkan tekanan darah tinggi.', 'https://www.ilmupot.com/16-manfaat-daun-nangka/', 'Nangka', NULL),
(9, 'Tumbuk 5 lembar daun nangka hingga halus, balurkan pada area yang sakit, biarkan selama 30 menit, lalu bilas dengan air hangat. Ulangi 2 kali sehari.', 'Radang Sendi', 'Dapat menyebabkan iritasi kulit pada beberapa individu.', 'Mengurangi peradangan dan nyeri pada sendi.', 'https://health.grid.id/read/353441044/ternyata-dengan-daun-nangka-6-masalah-kesehatan-ini-dapat-terselesaikan?page=all', 'Nangka', NULL),
(10, 'Rebus 5 lembar daun nangka dalam 300 ml air hingga mendidih. Minum hangat-hangat sebelum tidur.', 'Sembelit', 'Konsumsi berlebihan dapat menyebabkan diare.', 'Melancarkan buang air besar dan meningkatkan kesehatan pencernaan.', 'https://health.grid.id/read/354038672/manfaat-daun-nangka-untuk-kesehatan-salah-satunya-bantu-mengatasi-sembelit?page=all', 'Nangka', NULL),
(11, 'Rebus 10 lembar daun nangka dalam 500 ml air hingga tersisa 250 ml. Minum 2 kali sehari setelah makan.', 'Kolesterol Tinggi', 'Dapat menyebabkan pusing atau lemas pada beberapa individu.', 'Membantu menurunkan kadar kolesterol dalam darah.', 'https://www.ilmupot.com/16-manfaat-daun-nangka/', 'Nangka', 8),
(12, 'Oleskan gel lidah buaya pada area luka, biarkan mengering, dan bilas dengan air.', 'Bisul dan luka', 'Bisa menyebabkan iritasi pada kulit sensitif.', 'Membantu mempercepat pembelahan sel-sel keratinosit dan memperkuat jaringan kulit.', 'https://ejournal.borobudur.ac.id/index.php/3/article/view/746', 'Lidah Buaya', NULL),
(13, 'Bersihkan wajah terlebih dahulu kemudian oleskan gel lidah buaya tipis-tipis, diamkan 5-10 menit, bilas dengan air dingin, dan akhiri dengan moisturizer.', 'Penuaan dini', 'Iritasi ringan pada kulit sensitif.', 'Memperlambat tanda penuaan seperti keriput dengan meningkatkan produksi kolagen dan elastisitas kulit.', 'https://www.halodoc.com/artikel/benarkah-lidah-buaya-mampu-atasi-penuaan-dini?srsltid=AfmBOop8FISQKIP_Q3IHq05Gfpxx4k0wb9qUjcgbtwwhZGJOXa6qPRun', 'Lidah Buaya', NULL),
(14, 'Oleskan gel lidah buaya pada area kulit yang meradang dan biarkan meresap selama 15-20 menit.', 'Jerawat', 'Menimbulkan rasa perih pada kulit sensitif.', 'Menghambat pertumbuhan bakteri penyebab jerawat.', 'https://www.siloamhospitals.com/informasi-siloam/artikel/manfaat-lidah-buaya-untuk-wajah', 'Lidah Buaya', 17),
(16, 'Cuci 2 lembar daun pepaya hingga bersih, remas agar layu. Rebus 400 ml air hingga mendidih, tambahkan daun pepaya, dan masak 5-10 menit. Saring, lalu minum selagi hangat.', 'Sembelit', 'Iritasi ringan pada kulit sensitif.', 'Dapat melunakkan feses sehingga proses buang air besar menjadi lebih mudah.', 'https://www.siloamhospitals.com/informasi-siloam/artikel/manfaat-daun-pepaya', 'Pepaya', NULL),
(17, 'Cuci bersih 2 lembar daun pepaya, rebus bersama 1 sdt asam jawa dan 500 ml air hingga mendidih. Saring, tambahkan madu secukupnya, dan minum selagi hangat.', 'Nyeri Haid', 'Rasa pahit berlebihan, apabila dikonsumsi berlebihan menimbulkan rasa mual.', 'Menghambat produksi zat yang menyebabkan nyeri (prostaglandin) dan meningkatkan zat yang membantu merelaksasi otot rahim.', 'https://ejurnalmalahayati.ac.id/index.php/MJ/article/download/5170/pdf', 'Pepaya', NULL),
(18, 'Cuci bersih 3 tangkai daun seledri. Tumbuk hingga halus, kemudian tambahkan 3/4 cangkir air panas. Setelah dingin, peras dan saring. Bagi air perasan yang terkumpul untuk dua kali minum (pagi dan sore hari).', 'Hipertensi', 'Apabila dikonsumsi berlebihan dapat menyebabkan risiko tekanan darah rendah', 'Mengendurkan otot-otot dinding pembuluh darah arteri. Efek ini bisa membuat aliran darah lebih lancar dan menurunkan tekanan darah.', 'https://journal.uwhs.ac.id/index.php/jners/article/view/336/342', 'Seledri', NULL),
(19, 'Blender 3 batang daun seledri dengan 1 buah wortel, tambahkan 200 ml air. Minum segera setelah dibuat.', 'Kolesterol', 'Bau khas seledri mungkin tidak disukai sebagian orang.', 'Mengatasi kadar lemak yang ada dalam darah', 'https://yankes.kemkes.go.id/view_artikel/1062/berbagai-manfaat-daun-seledri-untuk-kesehatan', 'Seledri', 65),
(20, 'Cuci 3 – 4 batang seledri. Potong-potong seledri, tambahkan air secukupnya, dan masukkan ke blender. Segera tuang ke dalam gelas, jangan saring jus seledri.', 'Kanker', 'Apabila dikonsumsi berlebihan dapat menyebabkan risiko tekanan darah rendah', 'Senyawa Apigenin menghancurkan radikal bebas dalam tubuh dan dapat menyebabkan kematian sel kanker. Sementara luteolin, tanaman flavonoid dalam seledri, bertanggung jawab atas potensi efek antikankernya.', 'https://majalahpratistapatologi.com/p/index.php/journal/article/view/124', 'Seledri', NULL),
(21, 'Iris atau geprek beberapa sereh, kemudian masukkan ke dalam cangkir. Tuang air mendidih ke dalam cangkir tersebut. Diamkan selama 5 menit, lalu saring.', 'Radang', 'Jika dikonsumsi secara berlebihan menyebabkan pusing, mulut kering, kelelahan, sering buang air kecil, hingga peningkatan nafsu makan.', 'Mengurangi peradangan pada tubuh akibat paparan radikal bebas yang bisa memicu berbagai penyakit.', 'https://hellosehat.com/nutrisi/fakta-gizi/manfaat-serai/', 'Serai Wangi', NULL),
(22, 'Campurkanlah 12 tetes minyak sereh merah dengan 1 sendok teh minyak kelapa atau minyak almond. Setelah itu, Anda bisa meneteskan minyak sereh ke dalam ember berisi air untuk mandi, meneteskannya ke alat diffuser, atau langsung mengoleskannya ke kulit.', 'Insomnia', 'Reaksi gatal apabila dioleskan ke kulit sensitif', 'Mengaktifkan gelombang alfa. Gelombang ini membuat rileks, memejamkan mata lebih cepat, dan terasa kantuk.', 'https://www.alodokter.com/sereh-merah-ketahui-manfaat-dan-cara-mengolahnya', 'Serai Wangi', 12),
(23, 'Rebus 2 batang serai bersama irisan jeruk nipis. Saring dan minum saat hangat, tambahkan madu jika diperlukan.', 'Mual', 'Jika dikonsumsi secara berlebihan menyebabkan pusing, mulut kering, kelelahan, sering buang air kecil, hingga peningkatan nafsu makan.', 'Membantu mengatasi gangguan pencernaan seperti kembung dan mual.', 'https://jurnalfebi.iainkediri.ac.id/index.php/Welfare/article/download/651/371/2683', 'Serai Wangi', NULL),
(24, 'Tumbuk atau geprek terlebih dahulu jahe dan batang brotowali, setelah itu potong-potong dan lalu masukkan ke dalam panci. Masukkan semua bahan-bahan yang sudah persiapkan tadi ke dalam panci dan ditambahkan dengan air, setelah itu rebus sampai mendidih hingga volume air sedikit berkurang.', 'Diabetes Mellitus', 'Pada orang yang memiliki penyakit hati atau gangguan fungsi hati, konsumsi brotowali justru berisiko menimbulkan kerusakan hati yang semakin parah.', 'Membantu mengontrol kadar gula darah dengan meningkatkan sensitivitas insulin.', 'https://journal.unnes.ac.id/sju/ijcs/article/download/55914/22609/', 'Brotowali', 5),
(25, 'Tumbuk atau geprek terlebih dahulu jahe dan batang brotowali, setelah itu potong-potong dan lalu masukkan ke dalam panci. Masukkan semua bahan-bahan yang sudah persiapkan tadi ke dalam panci dan ditambahkan dengan air, setelah itu rebus sampai mendidih hingga volume air sedikit berkurang.', 'Radang', 'Pada orang yang memiliki penyakit hati atau gangguan fungsi hati, konsumsi brotowali justru berisiko menimbulkan kerusakan hati yang semakin parah.', 'Sifat antioksidan yang dapat membantu melindungi sel-sel tubuh dari kerusakan oksidatif.', 'https://hellosehat.com/herbal-alternatif/herbal/berbagai-manfaat-brotowali/', 'Brotowali', NULL),
(26, 'Tempelkan daun brotowali yang sudah diremas-remas di area kulit yang bermasalah.', 'Kudis', 'Reaksi alergi pada kulit sensitif', 'Adanya sifat antibakteri dan antijamur sehingga membunuh tungau parasit penyebab kudis dan mencegah penyebarannya.', 'https://jurnalfebi.iainkediri.ac.id/index.php/Welfare/article/download/651/371/2683', 'Brotowali', NULL),
(27, 'Cuci bersih 10 lembar daun pegagan masukkan ke dalam mangkuk lalu tambahkan 1 sdt minyak zaitun dan 1 sdm teh, haluskan hingga menjadi masker. Kemudian cuci bersih muka, keringkan lalu aplikasikan ke seluruh wajah sampai 15-20 menit. Sebaiknya dilakukan setelah melakukan aktivitas.', 'Jerawat', 'Iritasi ringan pada kulit sensitif apabila digunakan secara berlebihan', 'Sebagai antioksidan yang melawan radikal bebas, menghambat bakteri penyebab jerawat, dan membantu menjaga kesehatan kulit, meningkatkan produksi kolagen sehingga mencegah kerusakan kolagen dan merangsang proliferasi fibroblas.', 'https://journal.universitaspahlawan.ac.id/index.php/prepotif/article/view/30520/22398', 'Pegagan', 16),
(28, 'Menghaluskan daun pegagan hingga menjadi pasta. Kemudian, pasta daun pegagan dioleskan pada luka dan ditutup dengan perban. Daun pegagan juga dapat direbus dan air rebusannya digunakan untuk mencuci luka.', 'Luka', 'Reaksi alergi seperti gatal dan ruam pada kulit sensitif', 'Memperkuat kulit, meningkatkan antioksidan pada luka, dan meningkatkan suplai darah ke area tersebut. Sebagai antiinflamasi, antibakteri dan mendorong pembentukan kolagen tipe I serta mengandung minyak esensial yang berfungsi sebagai antibakteri.', 'https://www.neliti.com/id/publications/99771/efek-ekstrak-daun-pegagan-centella-asiatica-dalam-mempercepat-penyembuhan-luka-t', 'Pegagan', NULL),
(29, 'Cuci bersih 5-7 lembar daun pegagan segar. Rebus daun dalam 500 ml air hingga mendidih. Saring dan tambahkan sedikit madu atau perasan lemon untuk menambah rasa.', 'Alzheimer', 'Rasa kantuk', 'Triterpenoid memiliki sifat anti-inflamasi dan antioksidan yang dapat mengurangi peradangan di otak dan melindungi sel-sel otak dari kerusakan oksidatif. Flavonoid dapat menghambat enzim asetilkolinesterase, meningkatkan kadar asetilkolin di otak, serta melindungi sel-sel otak dari kerusakan oksidatif dan peradangan.', 'https://ojs.unimal.ac.id/index.php/averrous/article/download/10772/pdf_1', 'Pegagan', 22),
(31, 'Siapkan 4–5 lembar daun kumis kucing yang sudah dicuci bersih. Kemudian, rebus daun kumis kucing tadi dengan segelas air hingga mendidih. Setelah itu, teh daun kumis kucing pun siap dikonsumsi. Jika ingin menambahkan sedikit rasa manis, Anda bisa menambahkan madu.', 'Infeksi Saluran Kemih', 'Jika Anda sedang mengonsumsi obat-obatan lain, Anda mungkin perlu berhati-hati dalam mengonsumsi kumis kucing. Pasalnya, daun kumis kucing diketahui bisa menimbulkan efek interaksi obat jika dikonsumsi bersamaan dengan jenis obat tertentu', 'Memiliki kemampuan sebagai antibakteri termasuk mengatasi bakteri Proteus mirabilis dan Staphylococcus saprophyticus yang merupakan bakteri penyebab infeksi saluran kemih. Adanya efek diuretik juga turut membantu menangani masalah infeksi saluran kemih.', 'https://medicra.umsida.ac.id/index.php/medicra/article/download/1582/1926/', 'Kumis Kucing', NULL),
(32, 'Rebus daun kumis kucing dalam segelas air berbanding 1/4. Dari 1/2 gelas air rebusan daun kumis kucing tersebut dapat dikonsumsi 2 kali sehari.', 'Batu Ginjal', 'Dapat menyebabkan dehidrasi jika dikonsumsi tanpa cukup cairan tambahan.', 'Melarutkan asam urat, fosfat, dan oksalat untuk mencegah dan mengatasi batu ginjal.', 'https://journal.ipb.ac.id/index.php/actavetindones/article/download/48170/26731/', 'Kumis Kucing', NULL),
(33, 'Siapkan 20 helai daun kumis kucing. Campurkan ke dalam 110 ml air. Rebus hingga mendidih dan konsumsi secara teratur.', 'Diabetes Melitus', 'Konsumsi berlebihan dapat menurunkan gula darah secara drastis.', 'Membantu menurunkan kadar glukosa darah dan meningkatkan leptin untuk kontrol gula darah.', 'https://www.halodoc.com/artikel/ketahui-4-manfaat-daun-kumis-kucing-bagi-kesehatan?srsltid=AfmBOor6d8nBCS15fPOX6sh8ZRJUg9tYtwWjQGa6-qPYnQm2zt2slXJS', 'Kumis Kucing', NULL),
(34, 'Haluskan buah belimbing wuluh dan aplikasikan ke wajah seperti masker pada umumnya. Setelah itu tunggu hingga masker mengering dan bilas bersih menggunakan air. Lakukan ini secara rutin untuk melihat hasil yang maksimal.', 'Jerawat', 'Iritasi pada kulit sensitif', 'Menghambat pertumbuhan virus, bakteri dan jamur', 'https://d1wqtxts1xzle7.cloudfront.net/111723627/712-libre.pdf?1708618028=&response-content-disposition=inline%3B+filename%3DKhasiat_Belimbing_Wuluh_Averrhoa_bilimbi.pdf&Expires=1732515930&Signature=NEyLansMZvwnO3JHGdkMPkCYrgffKc1rvBVptCUmMnl3SVxnlglXaGhSU24HYPifbamL2jUTbStJSKTGjNNQ3L1YZXkPB-LMo87zSTMJsF4QUzcuRCHweq0ltfx1YU1B89B7CTMa~YTx57L6x6oDoj95IoK917a80XrHGlOurSgtF7tdwXgYyETFiEuedJFFYDoPJGnhblfqEVlzD4w4vUZWwjB2rCxfODX7KwNOQVb1~ymdYa7-wYq081yU9WtbDDzl0DIyc4atfVrHkbxo70XKmYNQhoSFCHueQKSoVZTuYm4BpuDjsMcDB--n84vt4IHYeacyQNXmFVcxOPFzGQ__&Key-Pair-Id=APKAJLOHF5GGSLRBV4ZA', 'Belimbing Wuluh', 18),
(35, 'Tumbuk 3-4 lembar daun belimbing wuluh hingga halus, kemudian rebus dengan air hingga mendidih. Minum sekali setiap hari.', 'Diabetes Melitus', 'Tidak dianjurkan bagi penderita asam lambung dan gangguan fungsi hati serta ginjal.', 'Menghambat penyerapan glukosa, merangsang sekresi insulin, menghambat enzim yang memecah glukosa.', 'http://repository.lppm.unila.ac.id/34678/1/Uji%20Efektivitas%20Daun%20Belimbing%20Wuluh%20%28Averrhoa%20bilimbi%20L.%29%20sebagai%20Pengobatan%20Diabetes%20Melitus.pdf', 'Belimbing Wuluh', NULL),
(36, 'Cuci bersih 3 buah belimbing wuluh. Rebus dengaan 1 gelas air selama 15 menit, kemudian ngkat dan dinginkan. Minum 2 kali dalam sehari.', 'Kolesterol', 'Tidak dianjurkan bagi penderita maag atau kencing batu', 'Membantu mengikat kolesterol  dan membantu membuangnya dari tubuh', 'https://www.deherba.com/resep-herbal-kolesterol.html', 'Belimbing Wuluh', NULL),
(37, 'Bersihkan segenggam daun, bunga, serta buah belimbing wuluh. Kemudian rebus dengan 4 gelas air yang sudah dicampurkan gula secukupnya. Rabus sampai mendidih dan airnya tersisa setengahnya. Saring rebusan tersebut dan biarkan hingga dingin. Air rebusan ini diminum secara rutin dua kali sehari sampai batuk sembuh.', 'Batuk', 'Reaksi alergi', 'Meningkatkan sistem kekebalan tubuh dan membantu melawan infeksi penyebab batuk', 'https://www.deherba.com/manfaat-belimbing-wuluh.html', 'Belimbing Wuluh', 26),
(38, 'Tumbuk atau dihaluskan 3 helai daun jambu biji. Kemudian rebus dengan 100 g air dengan suhu sedang. Saring air rebusan dan campurkan dengan gula merah, aduk hingga larut.', 'Diare', 'Reaksi alergi', 'Menghambat pertumbuhan bakteri Escherichia coli', 'https://jurnal.spada.ipts.ac.id/index.php/adam/article/view/1145', 'Jambu Biji', 14),
(39, 'Kupas jambu biji dan potong menjadi kecil-kecil. Haluskan dengan blender Bersama air dan gula secukupnya. Jus jambu bisa langsung diminum.', 'Demam berdarah', 'Reaksi alergi', 'Menghambat perkembangan virus dan mempercepat peningkatan trombosit darah', 'https://unram.sgp1.digitaloceanspaces.com/simlitabmas/kinerja/penelitian/jurnal/7d01a380-bf9d-425a-942e-35e76f96da96-2851-Article%20Text-9145-1-10-20230822.pdf', 'Jambu Biji', NULL),
(40, 'Masukkan 4-5 daun jambu biji segar ke dalam panci yang berisi air mendidih. Biarkan ramuan itu mendidih selama 5 menit. Setelahnya, saring air ke dalam gelas. Konsumsi air daun jambu biji tersebut setiap selesai makan.', 'Diabetes Melitus', 'Reaksi alergi', 'Menormalkan fungsi pankreas dalam mengatasi diabetes melitus', 'https://ejurnal.ung.ac.id/index.php/jhsj/article/view/9873', 'Jambu Biji', NULL),
(41, 'Cuci bersih satu genggam daun kemangi segar. Rebus dua gelas air dalam panci hingga mendidih, lalu tambahkan daun kemangi ke dalam air mendidih dan rebus selama 5-7 menit hingga air berubah warna. Matikan api dan saring minuman kemangi tersebut. Anda bisa menambahkan satu sendok makan madu untuk pemanis dan satu sendok makan air perasan lemon jika diinginkan.', 'Kolesterol', 'Reaksi alergi', 'Menurunkan kadar kolesterol jahat', 'https://jurnal.universitaskebangsaan.ac.id/manfaat-kemangi-untuk-kesehatan/?form=MG0AV3', 'Kemangi', NULL),
(42, 'Ambil 10-12 daun kemangi segar. Cuci bersih dan potong halus. Rebus daun kemangi dalam 2-3 cup air panas selama 10-15 menit. Saring dan sajikan hangat', 'Flu', 'Reaksi alergi', 'Membantu membunuh bakteri jahat yang dapat menyebabkan infeksi', 'https://jurnal.universitaskebangsaan.ac.id/manfaat-kemangi-untuk-kesehatan/?form=MG0AV3', 'Kemangi', 10),
(43, 'Rebus 10 gram daun saga dengan 1/2 liter air sampai mendidih. Saring dan gunakan air rebusan untuk berkumur sebanyak 2-3 kali sehari.', 'Sariawan', 'Mual dan muntah', 'Mempercepat penyembuhan berbagai kondisi akibat peradangan', 'https://jhhs.stikesholistic.ac.id/index.php/jhhs/article/view/30', 'Saga', NULL),
(44, 'Ambil 10-12 daun saga yang sudah dipotong-potong kecil. Rebus daun saga dalam 2-3 cup air panas selama 10-15 menit. Saring tehnya dan tambahkan madu atau lemon untuk rasa yang lebih enak. Minumlah teh ini dua kali sehari, pagi dan sore.', 'Kolesterol', 'Reaksi alergi', 'Membantu menurunkan penyerapan kolesterol di usus', 'https://phdi.or.id/daun-saga-dan-manfaatnya/?form=MG0AV3#Kolesterol', 'Saga', NULL),
(45, 'Ambil beberapa lembar daun saga yang sudah dipetik. Bilas daun saga dengan air bersih. Rebus daun saga dalam air panas selama 10-15 menit. Saring tehnya dan biarkan hingga suhu mendingin. Minumlah teh ini dua kali sehari, pagi dan sore.', 'Sembelit', 'Reaksi alergi', 'Menyerap air dalam usus, sehingga feses menjadi lebih lunak dan mudah dikeluarkan', 'https://jurnal.universitaskebangsaan.ac.id/daun-saga-dan-manfaatnya/#Mengatasi_masalah_pencernaan', 'Saga', NULL),
(46, 'Ambil 10-12 daun saga yang sudah dipotong-potong kecil. Rebus daun saga dalam 2-3 gelas air panas selama 10-15 menit. Saring tehnya dan tambahkan madu atau lemon untuk rasa yang lebih enak. Minumlah teh ini dua kali sehari, pagi dan sore.', 'Hipertensi', 'Reaksi alergi', 'Menurunkan tekanan darah dan meningkatkan aliran darah ke seluruh tubuh', 'https://phdi.or.id/daun-saga-manfaat/?form=MG0AV3', 'Saga', NULL),
(47, 'Keringkan 3-4 batang daun kelor secara alami dengan dijemur. Haluskan daun kelor beserta batang yang sudah kering menggunakan blender. Jika sudah halus, maka tuangkan bubuk daun kelor ke cangkir dan tambahkan air panas. Tunggu kurang lebih 5 menit hingga air berubah warna.', 'Diabetes', 'Beresiko bagi ibu hamil', 'Membantu menurunkan kadar gula darah', 'https://www.halodoc.com/artikel/alasan-daun-kelor-mampu-menurunkan-gula-darah?form=MG0AV3', 'Kelor', NULL),
(48, 'Rebus beberapa lembar daun kelor dalam air panas selama 10-15 menit, saring, dan minum sebanyak 2-3 kali sehari', 'Maag', 'Reaksi alergi', 'Mengurangi produksi asam lambung berlebihan', 'https://www.halodoc.com/artikel/benarkah-daun-kelor-bisa-bantu-atasi-asam-lambung', 'Kelor', 20),
(49, 'Haluskan 20 hingga 25 lembar daun kelor. Rebus 1-2 sendok makan daun kelor yang sudah dihaluskan dalam 1-2 gelas air selama 10-15 menit', 'Anemia', 'Reaksi alergi', 'Meningkatkan kadar hemoglobin', 'https://jurnal.uns.ac.id/jpscr/article/view/59021?form=MG0AV3', 'Kelor', NULL),
(50, 'Cuci bersih 2-3 helai daun bakung dan keringkan. Oleskan minyak kelapa, minyak wijen atau minyak kutus. Panaskan di atas api kecil hingga layu, tetapi tidak sampai hitam. Tempelkan atau balut daun pada bagian sendi yang nyeri kemudian ikat agar tidak terlepas.', 'Rematik', 'Reaksi alergi', 'Membantu mengurangi rasa sakit yang dirasakan pada sendi yang terkena rematik serta membantu menjaga kesehatan sendi dan mencegah rematik dari berkembang lebih lanjut.', 'https://www.jurnal.unar.ac.id/index.php/jamunar/article/view/1094', 'Bakung', NULL),
(51, 'Ambil beberapa lembar daun bakung yang segar dan cuci bersih. Jemur daun bakung hingga kering atau gunakan oven bersuhu rendah. Seduh 2-3 gram daun bakung kering dengan 250 ml air panas. Biarkan selama 10-15 menit, lalu saring.', 'Hipertensi', 'Reaksi alergi', 'Membantu meredakan gejala panas dalam dan peradangan pada tenggorokan.', 'https://phdi.or.id/manfaat-daun-bakung/#Mengobati_hipertensi', 'Bakung', NULL),
(52, 'Ambil beberapa lembar daun bakung yang sudah dicuci bersih. Rebus daun bakung dalam 1 liter air selama 10-15 menit. Saring tehnya dan tambahkan madu atau lemon jika diinginkan untuk rasa yang lebih enak.', 'Radang tenggorokan', 'Reaksi alergi', 'Membantu meredakan gejala panas dalam dan peradangan pada tenggorokan.', 'https://jurnal.universitaskebangsaan.ac.id/manfaat-daun-bakung/?form=MG0AV3', 'Bakung', NULL),
(53, 'Rebus daun ciplukan dengan 200 ml air selama sekitar 10-15 menit. Setelah mendidih, air rebusan ciplukan didinginkan lalu disaring. Kemudian air rebusan ciplukan diminum 2 kali sehari', 'Hipertansi', 'Reaksi alergi', 'Membantu melebarkan pembuluh darah, sehingga meningkatkan aliran darah dan menurunkan tekanan darah', 'https://jurnal.uniraya.ac.id/index.php/faguru/article/view/675', 'Ciplukan', NULL),
(54, 'Bersihkan dan potong tumbuhan ciplukan sebesar satu ruas jari. Jemur di bawah sinar matahari hingga kering. Haluskan daun ciplukan kering menggunakan blender. Simpan serbuk daun ciplukan dalam wadah tertutup. Masukkan 3,5 gram serbuk ciplukan ke dalam kantong teh. Seduh dengan 250 ml air panas selama 3 menit. Teh siap diminum.', 'Diabetes melitus', 'Reaksi alergi', 'Membantu menurunkan kolesterol jahat (LDL) dan meningkatkan kolesterol baik (HDL)', 'https://cendekia.manicsambas.sch.id/index.php/cendekia/article/view/149', 'Ciplukan', NULL),
(55, 'Tumbuk satu genggam daun ciplukan bersama dua sendok teh air kapur sirih. Haluskan campuran tersebut hingga menjadi pasta. Tempelkan pasta ini pada bagian yang sakit atau luka', 'Luka', 'Reaksi alergi', 'Mempercepat penyembuhan luka dengan membersihkan radikal bebas dan oksigen reaktif, meningkatkan penutupan luka serta meningkatkan pembentukan pembuluh darah kapiler dan sel-sel fibroblast', 'https://cjp.jurnal.stikescendekiautamakudus.ac.id/index.php/cjp/article/download/122/99', 'Ciplukan', NULL),
(56, 'Rebus 2 lembar daun jeruk nipis dengan 200 ml air hingga mendidih. Tambahkan madu atau jahe untuk rasa. Minum selagi hangat dua kali sehari.', 'Gangguan pencernaan', 'Konsumsi berlebihan dapat menyebabkan iritasi lambung.', 'Membantu melawan radikal bebas, sifat antioksidan pada flavonoid memberikan efek antiradang, sehingga baik untuk menjaga kesehatan saluran cerna dan mengatasi masalah pencernaan, seperti radang usus dan diare.', 'https://e-journal.uajy.ac.id/14221/3/BL013332.pdf', 'Jeruk Nipis', NULL),
(57, 'Merebus beberapa lembar daun jeruk nipis selama 10–15 menit dan minum air rebusan tersebut.', 'Penuaan dini', 'Tidak cocok untuk penderita asam lambung akut.', 'Mampu melindungi kulit dari sinar UV dan radikal bebas. Memproduksi kolagen, yaitu protein yang berperan dalam menjaga kulit tetap kenyal dan elastis.', 'https://www.alodokter.com/daun-jeruk-nipis-inilah-6-manfaat-dan-cara-mengonsumsinya', 'Jeruk Nipis', NULL),
(58, 'Haluskan 5 lembar daun jeruk. Campurkan dengan minyak kelapa untuk membuat losion alami. Oleskan pada kulit.', 'Gigitan serangga', 'Bisa menyebabkan iritasi kulit pada individu yang memiliki alergi atau kulit sensitif.', 'Membantu mengusir serangga secara alami.', 'https://ejournal.unsrat.ac.id/index.php/pmj/article/download/37789/34669', 'Jeruk Nipis', NULL),
(59, 'Rebus 5 lembar daun pandan segar dalam 500 ml air hingga tersisa 250 ml. Saring dan minum 2 kali sehari setelah makan.', 'kelebihan kadar gula darah', 'reaksi alergi, gangguan pencernaan, efek diuretik berlebihan, interaksi obat, dan ketidakpastian untuk ibu hamil/menyusui.', 'Membantu menurunkan kadar gula darah.', 'https://tirto.id/manfaat-dan-kandungan-nutrisi-daun-pandan-serat-hingga-zat-besi-gpaf', 'Pandan', NULL),
(60, 'Cuci bersih daun pandan terlebih dahulu dan buang bagian bawah yang berwarna putih. Hal ini bertujuan agar air rebusannya tidak terasa pahit. Selanjutnya, rebus air hingga mendidih dan masukan daun pandannya. Ikat daun pandan berbentuk simpul sebelum direbus, agar aroma dan sari-sarinya keluar. Rebus daun pandan sekitar lima hingga 10 menit, agar matang merata. Lalu saring dan dinginkan sekitar 10 menit.', 'Nyeri Sendi dan Arthritis', 'reaksi alergi, gangguan pencernaan, efek diuretik berlebihan, interaksi obat, dan ketidakpastian untuk ibu hamil/menyusui.', 'Meredakan Nyeri Sendi dan Arthritis.', 'https://www.halodoc.com/artikel/cara-mengolah-daun-pandan-dan-manfaatnya-untuk-kesehatan', 'Pandan', NULL),
(61, 'Cuci bersih daun pandan terlebih dahulu dan buang bagian bawah yang berwarna putih. Hal ini bertujuan agar air rebusannya tidak terasa pahit. Selanjutnya, rebus air hingga mendidih dan masukan daun pandannya. Ikat daun pandan berbentuk simpul sebelum direbus, agar aroma dan sari-sarinya keluar. Rebus daun pandan sekitar lima hingga 10 menit, agar matang merata. Lalu saring dan dinginkan sekitar 10 menit.', 'Jantung', 'reaksi alergi, gangguan pencernaan, efek diuretik berlebihan, interaksi obat, dan ketidakpastian untuk ibu hamil/menyusui.', 'Mencegah Penyakit Jantung.', 'https://www.halodoc.com/artikel/cara-mengolah-daun-pandan-dan-manfaatnya-untuk-kesehatan', 'Pandan', NULL),
(65, 'Cuci 2 lembar daun pepaya hingga bersih, potong kecil-kecil. Blender dengan 200 ml air hingga halus, saring untuk memisahkan ampas, tambahkan madu sesuai selera, dan minum segera.', 'Diabetes Melitus', 'Rasa pahit berlebihan, apabila dikonsumsi berlebihan menimbulkan rasa mual.', 'Melindungi sel penghasil insulin (sel beta pankreas), sehingga produksi kadar hormon insulin di dalam tubuh dapat tetap terjaga untuk menjaga kestabilan kadar gula darah dalam tubuh.', 'https://ejournal3.undip.ac.id/index.php/medico/article/download/23400/21378', 'Pepaya', NULL),
(66, 'Cuci bersih 15 gram daun binahong dan jemur hingga kering. Haluskan daun kering dengan blender, lalu oven serbuk tersebut pada suhu 50°C hingga kandungan air tinggal 10%. Tuang 1 sendok serbuk daun binahong ke dalam cangkir, seduh dengan air mendidih, saring, dan minum secara teratur untuk mengatasi asam urat.', 'Asam urat', 'Mual dan muntah', 'Membantu mengurangi peradangan pada sendi yang disebabkan oleh asam urat', 'https://journal.umpr.ac.id/index.php/pengabdianmu/article/view/895', 'Binahong', NULL),
(67, 'Tumbuk daun binahong, dan kemudian oleskan ke seluruh bagian wajah seperti masker. Tunggu selama 10 menit dan bilas sampai bersih.', 'Jerawat', 'Reaksi alergi', 'Membantu menyembuhkan jerawat dengan mengurangi inflamasi, meningkatkan produksi kolagen, mengurangi produksi minyak dan mengecilkan pori-pori wajah.', 'https://www.halodoc.com/artikel/5-manfaat-daun-binahong-untuk-kecantikan', 'Binahong', NULL),
(68, 'Cuci bersih daun binahong dengan air mengalir. Masukkan 5–6 lembar daun binahong ke dalam air panas. Rebus selama 10 menit atau sampai mendidih. Setelah matang, saring air rebusan tersebut dan dinginkan. Setelah cukup dingin, Anda dapat minum air rebusan daun binahong tersebut.', 'Diare', 'Reaksi alergi', 'Membantu menghambat pertumbuhan bakteri penyebab diare, membantu mengurangi peradangan pada saluran pencernaan', 'https://www.alodokter.com/manfaat-daun-binahong-yang-sayang-untuk-dilewatkan', 'Binahong', NULL),
(69, 'Gunakan 5-10 daun randu yang masih hijau segar. Bilas daun kemudian rebus daun dalam 500 ml air hingga mendidih, lalu kecilkan api dan biarkan selama 10 menit.', 'Penurunan imunitas', 'Mengantuk, pusing', 'Membantu memperbaiki kerusakan sel akibat radikal bebas', 'https://jurnal.uinsu.ac.id/index.php/klorofil/article/download/13740/pdf', 'Daun Randu', NULL),
(70, 'Gunakan 5-10 daun randu yang masih hijau segar. Bilas daun kemudian rebus daun dalam 500 ml air hingga mendidih, lalu kecilkan api dan biarkan selama 10 menit.', 'Diare', 'Mengantuk, pusing', 'Tanin, flavonoid, dan saponin dalam daun randu memiliki manfaat untuk meredakan diare. Tanin membantu mengikat air dan feses, sehingga mengurangi frekuensi buang air besar dan membuat feses lebih padat. Flavonoid memiliki sifat antiinflamasi yang mengurangi peradangan pada saluran pencernaan, membantu meredakan diare. Saponin memiliki sifat antibakteri dan antivirus yang dapat melawan mikroorganisme penyebab diare, seperti bakteri E. coli dan virus rotavirus.', 'https://ejournal.iainbukittinggi.ac.id/kamu-wajib-tahu-inilah-20-manfaat-daun-randu-yang-bikin-penasaran-e-jurnal/', 'Daun Randu', NULL),
(71, 'Ambil beberapa lembar daun kapuk yang masih segar. Cuci bersih daun tersebut dan haluskan dengan cara ditumbuk. Setelah daun halus, tempelkan pada luka dan biarkan selama beberapa jam atau sampai daun kering. Lakukan secara rutin.', 'Luka', 'Alergi pada kulit sensitif', 'Flavonoid bertindak sebagai antioksidan dan antiinflamasi, melindungi sel dari kerusakan radikal bebas dan mengurangi peradangan yang memperlambat penyembuhan. Tanin memiliki sifat astringen yang membantu menghentikan pendarahan dan membentuk lapisan pelindung untuk mencegah infeksi. Saponin bersifat antibakteri dan antivirus, mencegah infeksi yang bisa menghambat proses penyembuhan luka.', 'https://ejournal.iainbukittinggi.ac.id/kamu-wajib-tahu-inilah-20-manfaat-daun-randu-yang-bikin-penasaran-e-jurnal/', 'Daun Randu', NULL),
(72, 'Cuci bersih 5 lembar daun sembung lalu potong menjadi kecil-kecil. Tuang 3 gelas air ke dalam panci, lalu masukkan juga daun sembung yang sudah dipotong-potong sebelumnya. Rebus air selama kurang lebih 5-10 menit. Setelah itu, dinginkan sejenak dan saring air daun sembung.', 'Diare', 'Daun sembung mengandung senyawa toksik, seperti saponin dan alkoloid, yang dapat menyebabkan keracunan jika dikonsumsi dalam jumlah besar atau dalam jangka waktu yang lama.', 'Kandungan tanin sangat bermanfaat untuk mengatasi diare, karena membantu mengurangi sekresi cairan di usus dan memperbaiki lapisan dinding usus yang teriritasi. Flavonoid dan saponin mendukung proses penyembuhan dengan menghambat pertumbuhan bakteri penyebab diare.', 'https://health.detik.com/berita-detikhealth/d-6993303/6-manfaat-daun-sembung-untuk-tubuh-dan-cara-mengolahnya', 'Sembung', NULL),
(73, 'Merebus beberapa lembar daun sembung segar dalam air hingga mendidih, lalu air rebusan diminum dalam keadaan hangat.', 'Nyeri Haid', 'Efek samping daun sembung meliputi mual, gangguan pencernaan, atau reaksi alergi seperti ruam kulit jika dikonsumsi berlebihan. Ibu hamil, menyusui, atau penderita penyakit kronis disarankan berkonsultasi dengan dokter sebelum menggunakannya.', 'Flavonoid berfungsi sebagai antiradang yang dapat membantu mengurangi kontraksi otot rahim penyebab nyeri. Minyak atsiri dalam daun sembung memberikan efek relaksasi pada tubuh, yang juga mendukung pengurangan rasa nyeri.', 'https://journal.unpacti.ac.id/FITO/article/download/592/327/', 'Sembung', NULL),
(74, 'Ambil 3-5 daun sembung, lalu cuci bersih dengan air. Kemudian tumbuk daun hingga halus. Setelah itu, oleskan daun sembung yang sudah ditumbuk tadi ke area kulit yang terluka.', 'Luka', 'Iritasi pada kulit sensitif', 'Mempercepat proses penyembuhan luka, sehingga kulit yang terluka akan segera menutup.', 'https://www.alodokter.com/8-manfaat-daun-sembung-untuk-kesehatan#:~:text=Mengonsumsi%20obat%20yang%20mengandung%20daun,yang%20terluka%20akan%20segera%20menutup.', 'Sembung', NULL),
(75, 'Tumbuk daun cocor bebek hingga halus, oleskan pada luka terbuka atau goresan.', 'Luka Bakar', 'Iritasi atau reaksi alergi pada beberapa orang', 'Mempercepat penyembuhan luka', 'https://health.detik.com/berita-detikhealth/d-6993303/6-manfaat-daun-sembung-untuk-tubuh-dan-cara-mengolahnya', 'Cocor Bebek', NULL),
(76, 'Cuci bersih daun cocor bebek, lalu haluskan hingga berbentuk pasta. Oleskan pada jerawat atau bisul, dan biarkan selama beberapa jam sebelum dibersihkan.', 'Bisul dan Jerawat', 'Iritasi pada kulit sensitif', 'Mempercepat penyembuhan bisul dan jerawat, mengurangi peradangan dan infeksi, serta mencegah munculnya jerawat baru.', 'https://www.rri.co.id/kesehatan/993042/cocor-bebek-tanaman-hias-dengan-segudang-khasiat-kesehatan', 'Cocor Bebek', NULL),
(77, 'Cuci bersih beberapa lembar daun cocor bebek, lalu remas-remas hingga airnya keluar. Gunakan daun yang sudah diremas sebagai kompres di dahi atau tubuh untuk menurunkan panas.', 'Demam', 'Iritasi pada kulit sensitif', 'Efek antiinflamasi dan antipiretik (penurun panas). Kandungan saponin membantu merangsang sistem imun, flavonoid berfungsi sebagai antioksidan yang mengurangi peradangan, dan tanin membantu menyeimbangkan suhu tubuh.', 'https://www.rri.co.id/kesehatan/993042/cocor-bebek-tanaman-hias-dengan-segudang-khasiat-kesehatan', 'Cocor Bebek', NULL),
(78, 'Rebus 4–5 lembar daun salam dan 1 batang kayu manis dalam 1 liter air selama 20 menit, saring, lalu tambahkan madu secukupnya sebelum diminum.', 'Peradangan', 'Reaksi alergi, gangguan pencernaan, interaksi obat, dan dehidrasi jika dikonsumsi berlebihan.', 'Mengurangi peradangan', 'https://fk.umsu.ac.id/khasiat-daun-salam-bagi-kesehatan/, https://www.halodoc.com/artikel/cara-mengolah-daun-salam-yang-baik-untuk-kesehatan', 'Salam', NULL),
(79, 'Rebus 4–5 lembar daun salam dan 1 batang kayu manis dalam 1 liter air selama 20 menit, saring, lalu tambahkan madu secukupnya sebelum diminum.', 'Menurunnya sistem kekebalan tubuh', 'Reaksi alergi, gangguan pencernaan, interaksi obat, dan dehidrasi jika dikonsumsi berlebihan.', 'Meningkatkan sistem kekebalan tubuh', 'https://fk.umsu.ac.id/khasiat-daun-salam-bagi-kesehatan/, https://www.halodoc.com/artikel/cara-mengolah-daun-salam-yang-baik-untuk-kesehatan', 'Salam', NULL),
(80, 'Rebus 4–5 lembar daun salam dan 1 batang kayu manis dalam 1 liter air selama 20 menit, saring, lalu tambahkan madu secukupnya sebelum diminum.', 'Kelebihan kadar gula darah', 'Reaksi alergi, gangguan pencernaan, interaksi obat, dan dehidrasi jika dikonsumsi berlebihan.', 'Menurunkan kadar gula darah', 'https://fk.umsu.ac.id/khasiat-daun-salam-bagi-kesehatan/, https://www.halodoc.com/artikel/cara-mengolah-daun-salam-yang-baik-untuk-kesehatan', 'Salam', NULL),
(81, 'Cuci bersih 5-7 lembar daun pare. Rebus daun pare dalam 2 gelas air hingga tersisa sekitar 1 gelas air. Saring air rebusan dan biarkan agak dingin. Tambahkan madu secukupnya (jika suka manis). Minum air rebusan daun pare 2-3 kali sehari untuk meredakan batuk dan radang tenggorokan.', 'Batuk', 'Menyebabkan gangguan pencernaan, penurunan gula darah berlebihan, efek laksatif, dan reaksi alergi seperti ruam atau gatal.', 'Membantu melonggarkan dahak dan meredakan batuk. Mendukung sistem kekebalan tubuh, mempercepat pemulihan dari infeksi yang menyebabkan batuk.', 'https://www.rri.co.id/features/1096385/tahukah-anda-ini-manfaat-daun-pare-bagi-kesehatan', 'Pare', NULL),
(82, 'Cuci bersih 5-7 lembar daun pare. Rebus daun pare dalam 2 gelas air hingga tersisa sekitar 1 gelas air. Saring air rebusan dan biarkan agak dingin. Tambahkan madu secukupnya (jika suka manis). Minum air rebusan daun pare 2-3 kali sehari untuk meredakan batuk dan radang tenggorokan.', 'Radang tenggorokan', 'Menyebabkan gangguan pencernaan, penurunan gula darah berlebihan, efek laksatif, dan reaksi alergi seperti ruam atau gatal.', 'Daun pare berfungsi sebagai antiinflamasi, yang dapat mengurangi peradangan dan iritasi pada tenggorokan.', 'https://drive.google.com/file/d/1Ozd8N_SNl0d2DrqhTFLrTKbow0OBSaat/view', 'Pare', NULL),
(83, 'Cuci bersih 5 lembar daun pare. Rebus daun pare dalam 1 gelas air hingga mendidih. Saring air rebusan dan biarkan agak dingin. Gunakan air rebusan sebagai kompres mata. Celupkan kain bersih ke dalam air rebusan dan tempelkan pada mata yang meradang selama 10-15 menit. Lakukan 2-3 kali sehari hingga mata merah mereda.', 'Sakit Mata merah', 'Menyebabkan gangguan pencernaan, penurunan gula darah berlebihan, efek laksatif, dan reaksi alergi seperti ruam atau gatal.', 'Daun pare memiliki sifat antioksidan dan antiinflamasi yang dapat membantu mengurangi peradangan pada mata merah.', 'https://www.rri.co.id/features/1096385/tahukah-anda-ini-manfaat-daun-pare-bagi-kesehatan', 'Pare', NULL),
(84, 'Rebus 2 lembar daun kunyit yang sudah dipotong dalam 250 ml air selama 5 menit hingga harum. Angkat, saring, dan tambahkan 1 sdt madu. Nikmati selagi hangat.', 'Asam urat', 'Gangguan pencernaan, iritasi kulit, reaksi alergi pada beberapa orang.', 'Mengandung vitamin C, E, zat besi, dan kalium, membantu mengurangi peradangan dan nyeri pada asam urat.', 'https://www.fimela.com/food/read/5513508/resep-rebusan-daun-kunyit-untuk-penurun-asam-urat-dan-kolesterol?page=2', 'Kunyit', NULL),
(85, 'Rebus 2 lembar daun kunyit yang sudah dipotong dalam 250 ml air selama 5 menit hingga harum. Angkat, saring, dan tambahkan 1 sdt madu. Nikmati selagi hangat.', 'Kolesterol', 'Gangguan pencernaan, iritasi kulit, reaksi alergi pada beberapa orang.', 'Kandungan yang ada dapat membantu menurunkan kadar kolesterol jahat dalam darah.', 'https://www.fimela.com/food/read/5513508/resep-rebusan-daun-kunyit-untuk-penurun-asam-urat-dan-kolesterol?page=2', 'Kunyit', NULL),
(86, 'Cuci bersih 2 lembar daun kunyit, iris tipis. Siapkan 1 gelas air, didihkan. Setelah air setengah mendidih, masukkan daun kunyit. Tunggu hingga mendidih. Setelah mendidih, saring. Pisahkan antara daun dan airnya. Minum air rebusan daun kunyit selagi hangat.', 'Diabetes', 'Gangguan pencernaan, iritasi kulit, reaksi alergi pada beberapa orang.', 'Kurkuminoid, minyak atsiri, flavonoid, dan polifenol dapat mengatur kadar gula darah dan meningkatkan sensitivitas insulin.', 'https://sajiansedap.grid.id/read/103976060/efeknya-tidak-main-main-sering-mengonsumsi-air-rebusan-daun-kunyit-bisa-mengobati-penyakit-berbahaya-ini?page=all', 'Kunyit', NULL),
(87, 'Siapkan daun mengkudu secukupnya (sekitar 2-3 lembar). Cuci daun mengkudu hingga bersih. Rebus daun mengkudu dalam 2 gelas air hingga tersisa setengahnya. Saring air rebusan dan minum secara rutin, sekali sehari.', 'Diabetes', 'Toksik, Interaksi Obat, Gangguan Pencernaan, Reaksi Alergi, Efek Negatif pada Fungsi Hati', 'Daun mengkudu dapat membantu mengatur kadar gula darah.', 'https://www.rri.co.id/kesehatan/837890/manfaat-daun-mengkudu-bagi-kesehatan-tubuh', 'Mengkudu', NULL),
(88, 'Ambil daun mengkudu secukupnya. Cuci bersih daun mengkudu. Rebus daun mengkudu dalam 1 liter air selama 15-20 menit. Saring dan konsumsi air rebusannya 2-3 kali sehari.', 'Kanker', 'Toksik, Interaksi Obat, Gangguan Pencernaan, Reaksi Alergi, Efek Negatif pada Fungsi Hati', 'Membantu melindungi sel-sel tubuh dari kerusakan oksidatif dan mengurangi risiko penyakit kronis seperti kanker.', 'https://www.rri.co.id/kesehatan/837890/manfaat-daun-mengkudu-bagi-kesehatan-tubuh', 'Mengkudu', NULL),
(89, 'Cuci bersih daun mengkudu (sekitar 3-4 lembar). Rebus daun mengkudu dalam 1 liter air hingga mendidih dan air tersisa setengahnya. Saring dan minum air rebusan secara teratur untuk menjaga kesehatan jantung.', 'Jantung', 'Toksik, Interaksi Obat, Gangguan Pencernaan, Reaksi Alergi, Efek Negatif pada Fungsi Hati', 'Kandungan antioksidan dan antiradang dalam daun mengkudu juga dapat mencegah peradangan di pembuluh darah sehingga risiko terbentuknya plak di pembuluh darah (aterosklerosis) bisa berkurang. Dengan demikian, aliran darah dan pasokan oksigen ke jantung akan senantiasa lancar.', 'https://www.gramedia.com/best-seller/daun-mengkudu/', 'Mengkudu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan`
--

CREATE TABLE `pertanyaan` (
  `id` int NOT NULL,
  `teks_pertanyaan` text NOT NULL,
  `nama_tanaman` varchar(255) DEFAULT NULL,
  `penyakit` varchar(255) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pertanyaan`
--

INSERT INTO `pertanyaan` (`id`, `teks_pertanyaan`, `nama_tanaman`, `penyakit`, `kategori`) VALUES
(2, 'Tanaman apa yang bisa membantu pengobatan diabetes?', 'Nangka,Pepaya,Brotowali', 'Diabetes', NULL),
(3, 'Bagaimana membuat obat herbal untuk pengobatan diabetes dengan daun Nangka?', 'Nangka', 'Diabetes', NULL),
(5, 'Bagaimana membuat obat herbal untuk pengobatan diabetes dengan Brotowali?', 'Brotowali', 'Diabetes', NULL),
(6, 'Tanaman apa yang bisa mengobati kolesterol?', 'Nangka,Seledri', 'Kolesterol', NULL),
(7, 'Bagaimana membuat obat herbal untuk pengobatan kolestrol dengan daun Seledri?', 'Seledri', 'Kolesterol', NULL),
(8, 'Bagaimana membuat obat herbal untuk pengobatan kolestrol dengan daun Nangka?', 'Nangka', 'Kolesterol', NULL),
(9, 'Tanaman apa yang bisa mengobati Flu?', 'Kemangi', 'Flu', NULL),
(10, 'Bagaimana membuat obat herbal untuk pengobatan Flu dengan daun kemangi?', 'Kemangi', 'Flu', NULL),
(11, 'Tanaman apa yang bisa mengobati Insomnia?', 'Serai Wangi', 'Insomnia', NULL),
(12, 'Bagaimana membuat obat herbal untuk pengobatan Insomnia?', 'Serai Wangi', 'Insomnia', NULL),
(13, 'Tanaman apa yang bisa mengobati Diare?', 'Jambu Biji', 'Diare', NULL),
(14, 'Bagaimana membuat obat herbal untuk pengobatan Diare dengan daun jambu biji?', 'Jambu Biji', 'Diare', NULL),
(16, 'Bagaimana membuat obat herbal untuk pengobatan Jerawat menggunakan daun Pegagan?', 'Pegagan', 'Jerawat', NULL),
(17, 'Bagaimana membuat obat herbal untuk pengobatan Jerawat menggunakan daun lidah buaya?', 'Lidah Buaya', 'Jerawat', NULL),
(18, 'Bagaimana membuat obat herbal untuk pengobatan Jerawat menggunakan daun belimbing wuluh?', 'Belimbing Wuluh', 'Jerawat', NULL),
(19, 'Tanaman apa yang bisa mengobati Maag?', 'Kelor', 'Maag', NULL),
(20, 'Bagaimana membuat obat herbal untuk pengobatan Maag dengan daun Kelor?', 'Kelor', 'Maag', NULL),
(21, 'Tanaman apa yang bisa mengobati Alzheimer?', 'Pegagan', 'Alzheimer', NULL),
(22, 'Bagaimana membuat obat herbal untuk pengobatan Alzheimer?', 'Pegagan', 'Alzheimer', NULL),
(23, 'Tanaman apa yang bisa mengobati Jerawat?', 'Belimbing Wuluh, Lidah Buaya, Pegagan', 'Jerawat', '3b'),
(24, 'Tanaman apa yang bisa membantu pengobatan Diabetes Melitus?', 'Jambu Biji, Belimbing Wuluh, Pepaya, Kumis Kucing', 'Diabetes Melitus', '3b'),
(25, 'Tanaman apa yang bisa membantu mengatasi Kolesterol?', 'Kemangi, Belimbing Wuluh, Seledri, Saga', NULL, '3b'),
(26, 'Tanaman apa yang bisa mengobati Batuk?', 'Belimbing Wuluh', 'Batuk', '3b'),
(27, 'Tanaman apa yang bisa mengobati Diare?', 'Jambu Biji', NULL, '3b'),
(28, 'Tanaman apa yang bisa mengobati Gangguan Pencernaan?', 'Jeruk Nipis', NULL, '3b'),
(29, 'Tanaman apa yang bisa membantu mengatasi Penuaan Dini?', 'Lidah Buaya, Jeruk Nipis', NULL, '3b'),
(30, 'Tanaman apa yang bisa membantu mengatasi Hipertensi?', 'Nangka, Seledri, Saga, Kelor', NULL, '3b'),
(31, 'Tanaman apa yang bisa membantu mengatasi Radang Sendi?', 'Nangka', NULL, '3b'),
(32, 'Tanaman apa yang bisa mengobati Kolesterol Tinggi?', 'Nangka', NULL, '3b'),
(33, 'Tanaman apa yang bisa membantu mengatasi Nyeri Sendi dan Arthritis?', 'Pandan', NULL, '3b'),
(34, 'Tanaman apa yang bisa mencegah Penyakit Jantung?', 'Pandan', NULL, '3b'),
(35, 'Tanaman apa yang bisa membantu mengatasi Sembelit?', 'Pepaya, Saga', NULL, '3b'),
(36, 'Tanaman apa yang bisa mengobati Nyeri Haid?', 'Pepaya', NULL, '3b'),
(37, 'Tanaman apa yang bisa mengobati Infeksi Saluran Kemih?', 'Kumis Kucing', NULL, '3b'),
(38, 'Tanaman apa yang bisa membantu mengatasi Batu Ginjal?', 'Kumis Kucing', NULL, '3b'),
(39, 'Tanaman apa yang bisa mengobati Sariawan?', 'Saga', NULL, '3b'),
(40, 'Tanaman apa yang bisa membantu mengatasi Kanker?', 'Seledri', NULL, '3b'),
(41, 'Tanaman apa yang bisa membantu mengatasi Diabetes?', 'Kelor, Ciplukan, Brotowali', NULL, '3b'),
(42, 'Tanaman apa yang bisa membantu mengatasi Maag?', 'Kelor', NULL, '3b'),
(43, 'Tanaman apa yang bisa membantu mengatasi Anemia?', 'Kelor', NULL, '3b'),
(44, 'Tanaman apa yang bisa mengobati Luka?', 'Ciplukan, Pegagan', NULL, '3b'),
(45, 'Tanaman apa yang bisa membantu mengatasi Rematik?', 'Bakung', NULL, '3b'),
(46, 'Tanaman apa yang bisa membantu mengatasi Radang?', 'Brotowali, Serai Wangi', NULL, '3b'),
(47, 'Tanaman apa yang bisa mengobati Kudis?', 'Brotowali', NULL, '3b'),
(48, 'Tanaman apa yang bisa membantu mengatasi Insomnia?', 'Serai Wangi', NULL, '3b'),
(49, 'Tanaman apa yang bisa membantu mengatasi Mual?', 'Serai Wangi', NULL, '3b'),
(50, 'Bagaimana membuat obat herbal untuk pengobatan Jerawat dengan Belimbing Wuluh?', 'Belimbing Wuluh', NULL, '4b'),
(51, 'Bagaimana membuat obat herbal untuk pengobatan Jerawat dengan Lidah Buaya?', 'Lidah Buaya', NULL, '4b'),
(52, 'Bagaimana membuat obat herbal untuk pengobatan Diabetes Melitus dengan Jambu Biji?', 'Jambu Biji', NULL, '4b'),
(53, 'Bagaimana membuat obat herbal untuk pengobatan Diabetes Melitus dengan Belimbing Wuluh?', 'Belimbing Wuluh', NULL, '4b'),
(54, 'Bagaimana membuat obat herbal untuk pengobatan Kolesterol dengan Kemangi?', 'Kemangi', NULL, '4b'),
(55, 'Bagaimana membuat obat herbal untuk pengobatan Batuk dengan Belimbing Wuluh?', 'Belimbing Wuluh', NULL, '4b'),
(56, 'Bagaimana membuat obat herbal untuk pengobatan Diare dengan Jambu Biji?', 'Jambu Biji', NULL, '4b'),
(57, 'Bagaimana membuat obat herbal untuk pengobatan Gangguan Pencernaan dengan Jeruk Nipis?', 'Jeruk Nipis', NULL, '4b'),
(58, 'Bagaimana membuat obat herbal untuk pengobatan Penuaan Dini dengan Lidah Buaya?', 'Lidah Buaya', NULL, '4b'),
(59, 'Bagaimana membuat obat herbal untuk pengobatan Hipertensi dengan Nangka?', 'Nangka', NULL, '4b'),
(60, 'Bagaimana membuat obat herbal untuk pengobatan Nyeri Sendi dengan Pandan?', 'Pandan', NULL, '4b'),
(61, 'Bagaimana membuat obat herbal untuk pengobatan Diabetes Melitus dengan Pepaya?', 'Pepaya', 'Diabetes', '4b'),
(62, 'Bagaimana membuat obat herbal untuk pengobatan Sembelit dengan Pepaya?', 'Pepaya', 'Sembelit', '4b'),
(63, 'Bagaimana membuat obat herbal untuk pengobatan Nyeri Haid dengan Pepaya?', 'Pepaya', NULL, '4b'),
(64, 'Bagaimana membuat obat herbal untuk pengobatan Hipertensi dengan Seledri?', 'Seledri', NULL, '4b'),
(65, 'Bagaimana membuat obat herbal untuk pengobatan Kolesterol dengan Seledri?', 'Seledri', 'Kolesterol', '4b'),
(66, 'Bagaimana membuat obat herbal untuk pengobatan Kanker dengan Seledri?', 'Seledri', NULL, '4b'),
(67, 'Bagaimana membuat obat herbal untuk pengobatan Infeksi Saluran Kemih dengan Kumis Kucing?', 'Kumis Kucing', NULL, '4b'),
(68, 'Bagaimana membuat obat herbal untuk pengobatan Batu Ginjal dengan Kumis Kucing?', 'Kumis Kucing', NULL, '4b'),
(69, 'Bagaimana membuat obat herbal untuk pengobatan Sariawan dengan Saga?', 'Saga', NULL, '4b'),
(70, 'Bagaimana membuat obat herbal untuk pengobatan Kolesterol dengan Saga?', 'Saga', NULL, '4b'),
(71, 'Bagaimana membuat obat herbal untuk mengatasi Sembelit dengan Saga?', 'Saga', NULL, '4b'),
(72, 'Bagaimana membuat obat herbal untuk pengobatan Hipertensi dengan Saga?', 'Saga', NULL, '4b'),
(73, 'Bagaimana membuat obat herbal untuk pengobatan Diabetes dengan Kelor?', 'Kelor', NULL, '4b'),
(74, 'Bagaimana membuat obat herbal untuk pengobatan Maag dengan Kelor?', 'Kelor', NULL, '4b'),
(75, 'Bagaimana membuat obat herbal untuk pengobatan Anemia dengan Kelor?', 'Kelor', NULL, '4b'),
(76, 'Bagaimana membuat obat herbal untuk pengobatan Luka dengan Ciplukan?', 'Ciplukan', NULL, '4b'),
(77, 'Bagaimana membuat obat herbal untuk pengobatan Rematik dengan Bakung?', 'Bakung', NULL, '4b'),
(78, 'Bagaimana membuat obat herbal untuk pengobatan Radang dengan Brotowali?', 'Brotowali', NULL, '4b'),
(79, 'Bagaimana membuat obat herbal untuk pengobatan Kudis dengan Brotowali?', 'Brotowali', NULL, '4b'),
(80, 'Bagaimana cara membuat obat herbal untuk mengatasi Jerawat dengan Pegagan?', 'Pegagan', NULL, '4b'),
(81, 'Bagaimana cara membuat obat herbal untuk mengobati Luka dengan Pegagan?', 'Pegagan', NULL, '4b');

-- --------------------------------------------------------

--
-- Table structure for table `tanaman`
--

CREATE TABLE `tanaman` (
  `id` int NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nama_latin` varchar(255) DEFAULT NULL,
  `asal` varchar(255) DEFAULT NULL,
  `kandungan` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tanaman`
--

INSERT INTO `tanaman` (`id`, `nama`, `nama_latin`, `asal`, `kandungan`, `gambar`) VALUES
(0, 'Belimbing Wuluh', 'Averrhoa bilimbi L', 'Pulau Maluku', 'saponin, vitamin C, flavonoid, tannin, triterpenoid, minyak atsiri, alkaloid, terpenoid, dan serat', '\\gambar\\belimbingwuluh.jpg'),
(1, 'Jambu Biji', 'Psidiun guajava Linn', 'Amerika Serikat', 'tanin, kalsium, kuersetin, plavonoid, minyak atsiri, dan alkaloid', '\\gambar\\jambubiji.jpg'),
(2, 'Jeruk Nipis', 'Citrus aurantiifolia', 'Asia Tenggara', 'Flavonoid, Vitamin C, Citronellol dan Limonene.', '\\gambar\\jeruknipis.jpg'),
(3, 'Kemangi', 'Ocimum basilicum L', 'India', 'flavonoid, saponin, minyak esensial, vitamin C', '\\gambar\\kemangi.jpg'),
(4, 'Lidah Buaya', 'Aloe vera Linn.', 'Afrika', 'polifenol, Kalsium, antioksidan, serta asam amino seperti glisin, serin, dan enzim', '\\gambar\\lidahbuaya.jpg'),
(5, 'Nangka', 'Artocarpus heterophyllus', 'India', 'senyawa flavonoid, fenol, steroid, dan tanin', '\\gambar\\nangka.jpg'),
(6, 'Pandan', 'Pandanus amaryllifolius', 'kepulauan di Lautan Pasifik', 'beta karoten, prekursor vitamin A, dan zat besi', '\\gambar\\pandan.jpg'),
(7, 'Pepaya', 'Carica papaya L.', 'Meksiko bagian selatan dan Nikaragua.', 'Vitamin E, Senyawa papain, chymopapain, Serat, flavonoid, tannin, saponin, dan alkaloid', '\\gambar\\pepaya.jpg'),
(8, 'Seledri', 'Apium graveolens L', 'Dataran Asia', '3-n-butylphthalide, Kalium, antioksidan, senyawa phthalide, Senyawa apigenin, dan luteolin', 'gambar\\seledri.jpg'),
(9, 'Sirih', 'Piper betle L.', 'Sabah Serawak', 'minyak atsiri, alkaloid, kavikol, fenol, tanin, flavonoid, saponin, dan steroid.', '\\gambar\\sirih.jpg'),
(10, 'Kumis Kucing', 'Orthosiphon aristatus', 'Asia Tenggara, seperti Indonesia, Malaysia, dan Thailand', 'Flavonoid, polifenol, saponin triterpenoid, poliasetilen, Triterpenoid, asiaticoside, madecassoside, Asam Ursolat dan Oleanolat', 'gambarkumiskucing.jpg'),
(11, 'Saga', 'Abrus precatorius Linn', 'India', 'serat, tanin, flavonoid, saponin, dan Glycyrrhizin', '\\gambar\\saga.jpg'),
(12, 'Kelor', 'Moringa oleifera Lam.', 'India', 'Zat besi, antioksidan, Tanin, polifenol, flavonoid, asam askorbat, Isothiocyanate, Chlorogenic Acid, Vitamin C dan E, Zat Besi', '\\gambar\\kelor.jpg'),
(13, 'Ciplukan', 'Physalis angulata L.', 'Amerika Serikat', 'polifenol, plavonoid, alkaloid, Asam oleat, linoleat, dan Tanin.', 'gambarciplukan.jpg'),
(14, 'Bakung', 'Crynum asiaticum L.', 'Amerika', 'alkaloid, steroid, flavonoid, saponin, triterpenoid, tanin, niacin, kalsium, fosfor, kalium, vitamin A, dan vitamin B kompleks', '\\gambar\\bakung.jpg'),
(15, 'Brotowali', 'Tinospora cordifolia', 'Asia Tenggara', 'Berberine, Senyawa polipeptida-p, Senyawa alkaloid, flavonoid, dan saponin', 'gambar\\brotowali.png'),
(16, 'Pegagan', 'Centella asiatica (L.) Urban', 'Daerah Asia tropik, tersebar di Asia Tenggara termasuk Indonesia, India, Republik Rakyat Tiongkok, Jepang dan Australia', 'Flavonoid, polifenol, saponin triterpenoid, poliasetilen, Triterpenoid, asiaticoside dan madecassoside', 'gambarpegagan.png'),
(17, 'Serai Wangi', 'Cymbopogon nardus', 'Asia Tenggara (Sri Langka)', 'Minyak atsiri, Flavonoid, polifenol, saponin, Senyawa geraniol dan linalool', 'gambar\\serehwangi.jpg'),
(18, 'Binahong', 'Anredera cordifolia', 'Cina', 'Saponin, asam oleanolik, minyak atsiri, vitamin C, vitamin A, antioksidan, flavonoid, terpenodi, dan alkaloid', 'gambarinahong.jpg'),
(19, 'Daun Randu', 'Ceiba pentandra L', 'Amerika', 'Vitamin C, Vitamin E, Tanin, Flavonoid, dan Saponin', 'gambardaunrandu.jpg'),
(20, 'Sembung', 'Blumea balsamifera', 'Asia tropis (India, China Selatan, Taiwan, Malaysia, Indonesia, dan Filipina)', 'Flavonoid, saponin, tanin, dan minyak atsiri', 'gambarSembung.jpg'),
(21, 'Cocor Bebek', 'Kalanchoe pinnata', 'Madagaskar', 'Saponin, Tanin dan Flavonoid, Asam Amino, Vitamin C', 'gambarcocorbebek.jpg'),
(22, 'Salam', 'Syzygium polyanthum', 'daerah Mediterania', 'Flavonoid, Minyak atsiri, Tanin, vitamin (C, A), mineral, asam laurat', 'gambarsalam.jpg'),
(23, 'Pare', 'Momordica charantia L', 'Asia', 'Alkaloid, saponin, Vitamin C, Flavonoid, Vitamin A', 'gambarpare.jpg'),
(24, 'Kunyit', 'Curcuma longa', 'Asia Tenggara, diduga dari India atau Malaysia', 'Kurkuminoid, Minyak atsiri, Flavonoid, Polifenol, vitamin C, vitamin E, zat besi dan kaliumnya', 'gambarkunyit.jpg'),
(25, 'Mengkudu', 'Morinda citrifolia', 'Asia, Australia, dan Polinesia', 'Antioksidan, Antiinflamasi, Polifenol, Vitamin C, flavonoid, alkaloid, dan terpenoid', 'gambarmengkudu.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `info_tambahan`
--
ALTER TABLE `info_tambahan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_tanaman` (`nama_tanaman`),
  ADD KEY `fk_id_pertanyaan` (`id_pertanyaan`);

--
-- Indexes for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_tanaman` (`nama_tanaman`);

--
-- Indexes for table `tanaman`
--
ALTER TABLE `tanaman`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama` (`nama`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `info_tambahan`
--
ALTER TABLE `info_tambahan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `pertanyaan`
--
ALTER TABLE `pertanyaan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `tanaman`
--
ALTER TABLE `tanaman`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=709;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `info_tambahan`
--
ALTER TABLE `info_tambahan`
  ADD CONSTRAINT `fk_id_pertanyaan` FOREIGN KEY (`id_pertanyaan`) REFERENCES `pertanyaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `info_tambahan_ibfk_1` FOREIGN KEY (`nama_tanaman`) REFERENCES `tanaman` (`nama`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

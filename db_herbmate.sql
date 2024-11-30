-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 30, 2024 at 07:32 AM
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
  `nama_tanaman` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `info_tambahan`
--

INSERT INTO `info_tambahan` (`id`, `resep`, `penyakit`, `efek_samping`, `manfaat`, `sumber`, `nama_tanaman`) VALUES
(4, 'Cuci bersih 5-10 lembar daun sirih segar. Rebus daun sirih dalam 2 gelas air selama 10-15 menit. Saring air rebusan dan biarkan hingga hangat. Gunakan air tersebut untuk membersihkan area yang terinfeksi.', 'Antibakteri', 'Iritasi Kulit, Kekeringan Kulit, Gangguan Mukosa, Reaksi Alergi, Kerusakan Jaringan (Penggunaan Berlebihan pada Luka), Efek Samping Oral', 'Daun sirih hijau bermanfaat sebagai antibakteri untuk bakteri Propionibacterium acnes, Porphyromonas gingivalis, dan Staphylococcus aureus.', 'https://openjournal.wdh.ac.id/index.php/Phrase/article/view/502/pdf; https://www.bernas.id/2024/10/205694/penggunaan-daun-sirih-sebagai-antiseptik-alami-untuk-luka-dan-infeksi/; https://halosehat.com/farmasi/herbal/efek-samping-daun-sirih', 'Sirih'),
(5, 'Cuci bersih 10 lembar daun sirih. Tumbuk atau blender daun sirih hingga halus. Tambahkan 100 ml air matang dan aduk rata. Saring campuran untuk mendapatkan ekstrak daun sirih. Campurkan ekstrak dengan 30,3 ml gel lidah buaya untuk meningkatkan kelembutan pada kulit. Simpan dalam botol bersih dan gunakan sebagai antiseptik.', 'Antiseptik', 'Iritasi Kulit, Kekeringan Kulit, Gangguan Mukosa, Reaksi Alergi, Kerusakan Jaringan (Penggunaan Berlebihan pada Luka), Efek Samping Oral', 'Daun sirih hijau bisa digunakan untuk berkumur jika mulut mengalami pembengkakan, membersihkan napas yang bau akibat permasalahan pada mulut dan menghentikan darah.', 'https://openjournal.wdh.ac.id/index.php/Phrase/article/view/502/pdf; https://www.qoala.app/id/blog/perlindungan-diri/cara-membuat-antiseptik-dari-daun-sirih/; https://halosehat.com/farmasi/herbal/efek-samping-daun-sirih', 'Sirih'),
(6, 'Cuci bersih 5-10 lembar daun sirih segar. Rebus daun sirih dalam 2 gelas air selama 10-15 menit. Saring air rebusan dan biarkan hingga hangat. Gunakan air tersebut untuk membersihkan area yang terinfeksi.', 'Luka', 'Iritasi Kulit, Kekeringan Kulit, Gangguan Mukosa, Reaksi Alergi, Kerusakan Jaringan (Penggunaan Berlebihan pada Luka), Efek Samping Oral', 'Daun sirih juga dapat membantu meningkatkan jumlah kolagen dan fibroblas terhadap penyembuhan luka, hal ini dikarenakan kandungan tanin dan flavonoid dalam daun sirih.', 'https://openjournal.wdh.ac.id/index.php/Phrase/article/view/502/pdf; https://www.bernas.id/2024/10/205694/penggunaan-daun-sirih-sebagai-antiseptik-alami-untuk-luka-dan-infeksi/; https://halosehat.com/farmasi/herbal/efek-samping-daun-sirih', 'Sirih'),
(7, 'Rebus 10 lembar daun nangka segar dalam 500 ml air hingga tersisa 250 ml. Saring dan minum 2 kali sehari setelah makan.', 'Diabetes', 'Dapat menyebabkan hipoglikemia jika dikonsumsi bersamaan dengan obat penurun gula darah.', 'Membantu mengontrol kadar gula darah.', 'https://health.grid.id/read/354038672/manfaat-daun-nangka-untuk-kesehatan-salah-satunya-bantu-mengatasi-sembelit?page=all', 'Nangka'),
(8, 'Rebus 7 lembar daun nangka dalam 400 ml air hingga tersisa 200 ml. Minum sekali sehari sebelum tidur.', 'Hipertensi', 'Tidak dianjurkan bagi penderita tekanan darah rendah.', 'Membantu menurunkan tekanan darah tinggi.', 'https://www.ilmupot.com/16-manfaat-daun-nangka/', 'Nangka'),
(9, 'Tumbuk 5 lembar daun nangka hingga halus, balurkan pada area yang sakit, biarkan selama 30 menit, lalu bilas dengan air hangat. Ulangi 2 kali sehari.', 'Radang Sendi', 'Dapat menyebabkan iritasi kulit pada beberapa individu.', 'Mengurangi peradangan dan nyeri pada sendi.', 'https://health.grid.id/read/353441044/ternyata-dengan-daun-nangka-6-masalah-kesehatan-ini-dapat-terselesaikan?page=all', 'Nangka'),
(10, 'Rebus 5 lembar daun nangka dalam 300 ml air hingga mendidih. Minum hangat-hangat sebelum tidur.', 'Sembelit', 'Konsumsi berlebihan dapat menyebabkan diare.', 'Melancarkan buang air besar dan meningkatkan kesehatan pencernaan.', 'https://health.grid.id/read/354038672/manfaat-daun-nangka-untuk-kesehatan-salah-satunya-bantu-mengatasi-sembelit?page=all', 'Nangka'),
(11, 'Rebus 10 lembar daun nangka dalam 500 ml air hingga tersisa 250 ml. Minum 2 kali sehari setelah makan.', 'Kolesterol Tinggi', 'Dapat menyebabkan pusing atau lemas pada beberapa individu.', 'Membantu menurunkan kadar kolesterol dalam darah.', 'https://www.ilmupot.com/16-manfaat-daun-nangka/', 'Nangka'),
(12, 'Oleskan gel lidah buaya pada area luka, biarkan mengering, dan bilas dengan air.', 'Bisul dan luka', 'Bisa menyebabkan iritasi pada kulit sensitif.', 'Membantu mempercepat pembelahan sel-sel keratinosit dan memperkuat jaringan kulit.', 'https://ejournal.borobudur.ac.id/index.php/3/article/view/746', 'Lidah Buaya'),
(13, 'Bersihkan wajah terlebih dahulu kemudian oleskan gel lidah buaya tipis-tipis, diamkan 5-10 menit, bilas dengan air dingin, dan akhiri dengan moisturizer.', 'Penuaan dini', 'Iritasi ringan pada kulit sensitif.', 'Memperlambat tanda penuaan seperti keriput dengan meningkatkan produksi kolagen dan elastisitas kulit.', 'https://www.halodoc.com/artikel/benarkah-lidah-buaya-mampu-atasi-penuaan-dini?srsltid=AfmBOop8FISQKIP_Q3IHq05Gfpxx4k0wb9qUjcgbtwwhZGJOXa6qPRun', 'Lidah Buaya'),
(14, 'Oleskan gel lidah buaya pada area kulit yang meradang dan biarkan meresap selama 15-20 menit.', 'Jerawat', 'Menimbulkan rasa perih pada kulit sensitif.', 'Menghambat pertumbuhan bakteri penyebab jerawat.', 'https://www.siloamhospitals.com/informasi-siloam/artikel/manfaat-lidah-buaya-untuk-wajah', 'Lidah Buaya'),
(15, 'Cuci 2 lembar daun pepaya hingga bersih, potong kecil-kecil. Blender dengan 200 ml air hingga halus, saring untuk memisahkan ampas, tambahkan madu sesuai selera, dan minum segera.', 'Diabetes Melitus', 'Rasa pahit berlebihan, apabila dikonsumsi berlebihan menimbulkan rasa mual.', 'Melindungi sel penghasil insulin (sel beta pankreas), sehingga produksi kadar hormon insulin di dalam tubuh dapat tetap terjaga untuk menjaga kestabilan kadar gula darah dalam tubuh.', 'https://ejournal3.undip.ac.id/index.php/medico/article/download/23400/21378', 'Pepaya'),
(16, 'Cuci 2 lembar daun pepaya hingga bersih, remas agar layu. Rebus 400 ml air hingga mendidih, tambahkan daun pepaya, dan masak 5-10 menit. Saring, lalu minum selagi hangat.', 'Sembelit', 'Iritasi ringan pada kulit sensitif.', 'Dapat melunakkan feses sehingga proses buang air besar menjadi lebih mudah.', 'https://www.siloamhospitals.com/informasi-siloam/artikel/manfaat-daun-pepaya', 'Pepaya'),
(17, 'Cuci bersih 2 lembar daun pepaya, rebus bersama 1 sdt asam jawa dan 500 ml air hingga mendidih. Saring, tambahkan madu secukupnya, dan minum selagi hangat.', 'Nyeri Haid', 'Rasa pahit berlebihan, apabila dikonsumsi berlebihan menimbulkan rasa mual.', 'Menghambat produksi zat yang menyebabkan nyeri (prostaglandin) dan meningkatkan zat yang membantu merelaksasi otot rahim.', 'https://ejurnalmalahayati.ac.id/index.php/MJ/article/download/5170/pdf', 'Pepaya'),
(18, 'Cuci bersih 3 tangkai daun seledri. Tumbuk hingga halus, kemudian tambahkan 3/4 cangkir air panas. Setelah dingin, peras dan saring. Bagi air perasan yang terkumpul untuk dua kali minum (pagi dan sore hari).', 'Hipertensi', 'Apabila dikonsumsi berlebihan dapat menyebabkan risiko tekanan darah rendah', 'Mengendurkan otot-otot dinding pembuluh darah arteri. Efek ini bisa membuat aliran darah lebih lancar dan menurunkan tekanan darah.', 'https://journal.uwhs.ac.id/index.php/jners/article/view/336/342', 'Seledri'),
(19, 'Blender 3 batang daun seledri dengan 1 buah wortel, tambahkan 200 ml air. Minum segera setelah dibuat.', 'Kolesterol', 'Bau khas seledri mungkin tidak disukai sebagian orang.', 'Mengatasi kadar lemak yang ada dalam darah', 'https://yankes.kemkes.go.id/view_artikel/1062/berbagai-manfaat-daun-seledri-untuk-kesehatan', 'Seledri'),
(20, 'Cuci 3 – 4 batang seledri. Potong-potong seledri, tambahkan air secukupnya, dan masukkan ke blender. Segera tuang ke dalam gelas, jangan saring jus seledri.', 'Kanker', 'Apabila dikonsumsi berlebihan dapat menyebabkan risiko tekanan darah rendah', 'Senyawa Apigenin menghancurkan radikal bebas dalam tubuh dan dapat menyebabkan kematian sel kanker. Sementara luteolin, tanaman flavonoid dalam seledri, bertanggung jawab atas potensi efek antikankernya.', 'https://majalahpratistapatologi.com/p/index.php/journal/article/view/124', 'Seledri'),
(21, 'Iris atau geprek beberapa sereh, kemudian masukkan ke dalam cangkir. Tuang air mendidih ke dalam cangkir tersebut. Diamkan selama 5 menit, lalu saring.', 'Radang', 'Jika dikonsumsi secara berlebihan menyebabkan pusing, mulut kering, kelelahan, sering buang air kecil, hingga peningkatan nafsu makan.', 'Mengurangi peradangan pada tubuh akibat paparan radikal bebas yang bisa memicu berbagai penyakit.', 'https://hellosehat.com/nutrisi/fakta-gizi/manfaat-serai/', 'Serai Wangi'),
(22, 'Campurkanlah 12 tetes minyak sereh merah dengan 1 sendok teh minyak kelapa atau minyak almond. Setelah itu, Anda bisa meneteskan minyak sereh ke dalam ember berisi air untuk mandi, meneteskannya ke alat diffuser, atau langsung mengoleskannya ke kulit.', 'Insomnia', 'Reaksi gatal apabila dioleskan ke kulit sensitif', 'Mengaktifkan gelombang alfa. Gelombang ini membuat rileks, memejamkan mata lebih cepat, dan terasa kantuk.', 'https://www.alodokter.com/sereh-merah-ketahui-manfaat-dan-cara-mengolahnya', 'Serai Wangi'),
(23, 'Rebus 2 batang serai bersama irisan jeruk nipis. Saring dan minum saat hangat, tambahkan madu jika diperlukan.', 'Mual', 'Jika dikonsumsi secara berlebihan menyebabkan pusing, mulut kering, kelelahan, sering buang air kecil, hingga peningkatan nafsu makan.', 'Membantu mengatasi gangguan pencernaan seperti kembung dan mual.', 'https://jurnalfebi.iainkediri.ac.id/index.php/Welfare/article/download/651/371/2683', 'Serai Wangi'),
(24, 'Tumbuk atau geprek terlebih dahulu jahe dan batang brotowali, setelah itu potong-potong dan lalu masukkan ke dalam panci. Masukkan semua bahan-bahan yang sudah persiapkan tadi ke dalam panci dan ditambahkan dengan air, setelah itu rebus sampai mendidih hingga volume air sedikit berkurang.', 'Diabetes Mellitus', 'Pada orang yang memiliki penyakit hati atau gangguan fungsi hati, konsumsi brotowali justru berisiko menimbulkan kerusakan hati yang semakin parah.', 'Membantu mengontrol kadar gula darah dengan meningkatkan sensitivitas insulin.', 'https://journal.unnes.ac.id/sju/ijcs/article/download/55914/22609/', 'Brotowali'),
(25, 'Tumbuk atau geprek terlebih dahulu jahe dan batang brotowali, setelah itu potong-potong dan lalu masukkan ke dalam panci. Masukkan semua bahan-bahan yang sudah persiapkan tadi ke dalam panci dan ditambahkan dengan air, setelah itu rebus sampai mendidih hingga volume air sedikit berkurang.', 'Radang', 'Pada orang yang memiliki penyakit hati atau gangguan fungsi hati, konsumsi brotowali justru berisiko menimbulkan kerusakan hati yang semakin parah.', 'Sifat antioksidan yang dapat membantu melindungi sel-sel tubuh dari kerusakan oksidatif.', 'https://hellosehat.com/herbal-alternatif/herbal/berbagai-manfaat-brotowali/', 'Brotowali'),
(26, 'Tempelkan daun brotowali yang sudah diremas-remas di area kulit yang bermasalah.', 'Kudis', 'Reaksi alergi pada kulit sensitif', 'Adanya sifat antibakteri dan antijamur sehingga membunuh tungau parasit penyebab kudis dan mencegah penyebarannya.', 'https://jurnalfebi.iainkediri.ac.id/index.php/Welfare/article/download/651/371/2683', 'Brotowali'),
(27, 'Cuci bersih 10 lembar daun pegagan masukkan ke dalam mangkuk lalu tambahkan 1 sdt minyak zaitun dan 1 sdm teh, haluskan hingga menjadi masker. Kemudian cuci bersih muka, keringkan lalu aplikasikan ke seluruh wajah sampai 15-20 menit. Sebaiknya dilakukan setelah melakukan aktivitas.', 'Jerawat', 'Iritasi ringan pada kulit sensitif apabila digunakan secara berlebihan', 'Sebagai antioksidan yang melawan radikal bebas, menghambat bakteri penyebab jerawat, dan membantu menjaga kesehatan kulit, meningkatkan produksi kolagen sehingga mencegah kerusakan kolagen dan merangsang proliferasi fibroblas.', 'https://journal.universitaspahlawan.ac.id/index.php/prepotif/article/view/30520/22398', 'Pegagan'),
(28, 'Menghaluskan daun pegagan hingga menjadi pasta. Kemudian, pasta daun pegagan dioleskan pada luka dan ditutup dengan perban. Daun pegagan juga dapat direbus dan air rebusannya digunakan untuk mencuci luka.', 'Luka', 'Reaksi alergi seperti gatal dan ruam pada kulit sensitif', 'Memperkuat kulit, meningkatkan antioksidan pada luka, dan meningkatkan suplai darah ke area tersebut. Sebagai antiinflamasi, antibakteri dan mendorong pembentukan kolagen tipe I serta mengandung minyak esensial yang berfungsi sebagai antibakteri.', 'https://www.neliti.com/id/publications/99771/efek-ekstrak-daun-pegagan-centella-asiatica-dalam-mempercepat-penyembuhan-luka-t', 'Pegagan'),
(29, 'Cuci bersih 5-7 lembar daun pegagan segar. Rebus daun dalam 500 ml air hingga mendidih. Saring dan tambahkan sedikit madu atau perasan lemon untuk menambah rasa.', 'Alzheimer', 'Rasa kantuk', 'Triterpenoid memiliki sifat anti-inflamasi dan antioksidan yang dapat mengurangi peradangan di otak dan melindungi sel-sel otak dari kerusakan oksidatif. Flavonoid dapat menghambat enzim asetilkolinesterase, meningkatkan kadar asetilkolin di otak, serta melindungi sel-sel otak dari kerusakan oksidatif dan peradangan.', 'https://ojs.unimal.ac.id/index.php/averrous/article/download/10772/pdf_1', 'Pegagan'),
(31, 'Siapkan 4–5 lembar daun kumis kucing yang sudah dicuci bersih. Kemudian, rebus daun kumis kucing tadi dengan segelas air hingga mendidih. Setelah itu, teh daun kumis kucing pun siap dikonsumsi. Jika ingin menambahkan sedikit rasa manis, Anda bisa menambahkan madu.', 'Infeksi Saluran Kemih', 'Jika Anda sedang mengonsumsi obat-obatan lain, Anda mungkin perlu berhati-hati dalam mengonsumsi kumis kucing. Pasalnya, daun kumis kucing diketahui bisa menimbulkan efek interaksi obat jika dikonsumsi bersamaan dengan jenis obat tertentu', 'Memiliki kemampuan sebagai antibakteri termasuk mengatasi bakteri Proteus mirabilis dan Staphylococcus saprophyticus yang merupakan bakteri penyebab infeksi saluran kemih. Adanya efek diuretik juga turut membantu menangani masalah infeksi saluran kemih.', 'https://medicra.umsida.ac.id/index.php/medicra/article/download/1582/1926/', 'Kumis Kucing'),
(32, 'Rebus daun kumis kucing dalam segelas air berbanding 1/4. Dari 1/2 gelas air rebusan daun kumis kucing tersebut dapat dikonsumsi 2 kali sehari.', 'Batu Ginjal', 'Dapat menyebabkan dehidrasi jika dikonsumsi tanpa cukup cairan tambahan.', 'Melarutkan asam urat, fosfat, dan oksalat untuk mencegah dan mengatasi batu ginjal.', 'https://journal.ipb.ac.id/index.php/actavetindones/article/download/48170/26731/', 'Kumis Kucing'),
(33, 'Siapkan 20 helai daun kumis kucing. Campurkan ke dalam 110 ml air. Rebus hingga mendidih dan konsumsi secara teratur.', 'Diabetes Melitus', 'Konsumsi berlebihan dapat menurunkan gula darah secara drastis.', 'Membantu menurunkan kadar glukosa darah dan meningkatkan leptin untuk kontrol gula darah.', 'https://www.halodoc.com/artikel/ketahui-4-manfaat-daun-kumis-kucing-bagi-kesehatan?srsltid=AfmBOor6d8nBCS15fPOX6sh8ZRJUg9tYtwWjQGa6-qPYnQm2zt2slXJS', 'Kumis Kucing'),
(34, 'Haluskan buah belimbing wuluh dan aplikasikan ke wajah seperti masker pada umumnya. Setelah itu tunggu hingga masker mengering dan bilas bersih menggunakan air. Lakukan ini secara rutin untuk melihat hasil yang maksimal.', 'Jerawat', 'Iritasi pada kulit sensitif', 'Menghambat pertumbuhan virus, bakteri dan jamur', 'https://d1wqtxts1xzle7.cloudfront.net/111723627/712-libre.pdf?1708618028=&response-content-disposition=inline%3B+filename%3DKhasiat_Belimbing_Wuluh_Averrhoa_bilimbi.pdf&Expires=1732515930&Signature=NEyLansMZvwnO3JHGdkMPkCYrgffKc1rvBVptCUmMnl3SVxnlglXaGhSU24HYPifbamL2jUTbStJSKTGjNNQ3L1YZXkPB-LMo87zSTMJsF4QUzcuRCHweq0ltfx1YU1B89B7CTMa~YTx57L6x6oDoj95IoK917a80XrHGlOurSgtF7tdwXgYyETFiEuedJFFYDoPJGnhblfqEVlzD4w4vUZWwjB2rCxfODX7KwNOQVb1~ymdYa7-wYq081yU9WtbDDzl0DIyc4atfVrHkbxo70XKmYNQhoSFCHueQKSoVZTuYm4BpuDjsMcDB--n84vt4IHYeacyQNXmFVcxOPFzGQ__&Key-Pair-Id=APKAJLOHF5GGSLRBV4ZA', 'Belimbing Wuluh'),
(35, 'Tumbuk 3-4 lembar daun belimbing wuluh hingga halus, kemudian rebus dengan air hingga mendidih. Minum sekali setiap hari.', 'Diabetes Melitus', 'Tidak dianjurkan bagi penderita asam lambung dan gangguan fungsi hati serta ginjal.', 'Menghambat penyerapan glukosa, merangsang sekresi insulin, menghambat enzim yang memecah glukosa.', 'http://repository.lppm.unila.ac.id/34678/1/Uji%20Efektivitas%20Daun%20Belimbing%20Wuluh%20%28Averrhoa%20bilimbi%20L.%29%20sebagai%20Pengobatan%20Diabetes%20Melitus.pdf', 'Belimbing Wuluh'),
(36, 'Cuci bersih 3 buah belimbing wuluh. Rebus dengaan 1 gelas air selama 15 menit, kemudian ngkat dan dinginkan. Minum 2 kali dalam sehari.', 'Kolesterol', 'Tidak dianjurkan bagi penderita maag atau kencing batu', 'Membantu mengikat kolesterol  dan membantu membuangnya dari tubuh', 'https://www.deherba.com/resep-herbal-kolesterol.html', 'Belimbing Wuluh'),
(37, 'Bersihkan segenggam daun, bunga, serta buah belimbing wuluh. Kemudian rebus dengan 4 gelas air yang sudah dicampurkan gula secukupnya. Rabus sampai mendidih dan airnya tersisa setengahnya. Saring rebusan tersebut dan biarkan hingga dingin. Air rebusan ini diminum secara rutin dua kali sehari sampai batuk sembuh.', 'Batuk', 'Reaksi alergi', 'Meningkatkan sistem kekebalan tubuh dan membantu melawan infeksi penyebab batuk', 'https://www.deherba.com/manfaat-belimbing-wuluh.html', 'Belimbing Wuluh'),
(38, 'Tumbuk atau dihaluskan 3 helai daun jambu biji. Kemudian rebus dengan 100 g air dengan suhu sedang. Saring air rebusan dan campurkan dengan gula merah, aduk hingga larut.', 'Diare', 'Reaksi alergi', 'Menghambat pertumbuhan bakteri Escherichia coli', 'https://jurnal.spada.ipts.ac.id/index.php/adam/article/view/1145', 'Jambu Biji'),
(39, 'Kupas jambu biji dan potong menjadi kecil-kecil. Haluskan dengan blender Bersama air dan gula secukupnya. Jus jambu bisa langsung diminum.', 'Demam berdarah', 'Reaksi alergi', 'Menghambat perkembangan virus dan mempercepat peningkatan trombosit darah', 'https://unram.sgp1.digitaloceanspaces.com/simlitabmas/kinerja/penelitian/jurnal/7d01a380-bf9d-425a-942e-35e76f96da96-2851-Article%20Text-9145-1-10-20230822.pdf', 'Jambu Biji'),
(40, 'Masukkan 4-5 daun jambu biji segar ke dalam panci yang berisi air mendidih. Biarkan ramuan itu mendidih selama 5 menit. Setelahnya, saring air ke dalam gelas. Konsumsi air daun jambu biji tersebut setiap selesai makan.', 'Diabetes Melitus', 'Reaksi alergi', 'Menormalkan fungsi pankreas dalam mengatasi diabetes melitus', 'https://ejurnal.ung.ac.id/index.php/jhsj/article/view/9873', 'Jambu Biji'),
(41, 'Cuci bersih satu genggam daun kemangi segar. Rebus dua gelas air dalam panci hingga mendidih, lalu tambahkan daun kemangi ke dalam air mendidih dan rebus selama 5-7 menit hingga air berubah warna. Matikan api dan saring minuman kemangi tersebut. Anda bisa menambahkan satu sendok makan madu untuk pemanis dan satu sendok makan air perasan lemon jika diinginkan.', 'Kolesterol', 'Reaksi alergi', 'Menurunkan kadar kolesterol jahat', 'https://jurnal.universitaskebangsaan.ac.id/manfaat-kemangi-untuk-kesehatan/?form=MG0AV3', 'Kemangi'),
(42, 'Ambil 10-12 daun kemangi segar. Cuci bersih dan potong halus. Rebus daun kemangi dalam 2-3 cup air panas selama 10-15 menit. Saring dan sajikan hangat', 'Flu', 'Reaksi alergi', 'Membantu membunuh bakteri jahat yang dapat menyebabkan infeksi', 'https://jurnal.universitaskebangsaan.ac.id/manfaat-kemangi-untuk-kesehatan/?form=MG0AV3', 'Kemangi'),
(43, 'Rebus 10 gram daun saga dengan 1/2 liter air sampai mendidih. Saring dan gunakan air rebusan untuk berkumur sebanyak 2-3 kali sehari.', 'Sariawan', 'Mual dan muntah', 'Mempercepat penyembuhan berbagai kondisi akibat peradangan', 'https://jhhs.stikesholistic.ac.id/index.php/jhhs/article/view/30', 'Saga'),
(44, 'Ambil 10-12 daun saga yang sudah dipotong-potong kecil. Rebus daun saga dalam 2-3 cup air panas selama 10-15 menit. Saring tehnya dan tambahkan madu atau lemon untuk rasa yang lebih enak. Minumlah teh ini dua kali sehari, pagi dan sore.', 'Kolesterol', 'Reaksi alergi', 'Membantu menurunkan penyerapan kolesterol di usus', 'https://phdi.or.id/daun-saga-dan-manfaatnya/?form=MG0AV3#Kolesterol', 'Saga'),
(45, 'Ambil beberapa lembar daun saga yang sudah dipetik. Bilas daun saga dengan air bersih. Rebus daun saga dalam air panas selama 10-15 menit. Saring tehnya dan biarkan hingga suhu mendingin. Minumlah teh ini dua kali sehari, pagi dan sore.', 'Sembelit', 'Reaksi alergi', 'Menyerap air dalam usus, sehingga feses menjadi lebih lunak dan mudah dikeluarkan', 'https://jurnal.universitaskebangsaan.ac.id/daun-saga-dan-manfaatnya/#Mengatasi_masalah_pencernaan', 'Saga'),
(46, 'Ambil 10-12 daun saga yang sudah dipotong-potong kecil. Rebus daun saga dalam 2-3 gelas air panas selama 10-15 menit. Saring tehnya dan tambahkan madu atau lemon untuk rasa yang lebih enak. Minumlah teh ini dua kali sehari, pagi dan sore.', 'Hipertensi', 'Reaksi alergi', 'Menurunkan tekanan darah dan meningkatkan aliran darah ke seluruh tubuh', 'https://phdi.or.id/daun-saga-manfaat/?form=MG0AV3', 'Saga');

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
(1, 'Sirih', 'Piper betle L.', 'Sabah Serawak', 'minyak atsiri, alkaloid, kavikol, fenol, tanin, flavonoid, saponin, dan steroid.', '\\gambar\\sirih.jpg'),
(2, 'Nangka', 'Artocarpus heterophyllus', 'India', 'senyawa flavonoid, fenol, steroid, dan tani', '\\gambar\\nangka.jpg'),
(3, 'Lidah Buaya', 'Aloe vera Linn.', 'Afrika', 'polifenol, Kalsium, antioksidan, serta asam amino seperti glisin, serin, dan enzim', '\\gambar\\lidahbuaya.jpg'),
(4, 'Pepaya', 'Carica papaya L.', 'Meksiko bagian selatan dan Nikaragua.', 'Vitamin E, Senyawa papain, chymopapain, Serat, flavonoid, tannin, saponin, dan alkaloid', '\\gambar\\pepaya.jpg'),
(5, 'Seledri', 'Apium graveolens L', 'Dataran Asia', '3-n-butylphthalide, Kalium, antioksidan, senyawa phthalide, Senyawa apigenin, dan luteolin', 'gambar\\seledri.jpg'),
(7, 'Serai Wangi', 'Cymbopogon nardus', 'Asia Tenggara (Sri Langka)', 'Minyak atsiri, Flavonoid, polifenol, saponin, Senyawa geraniol dan linalool', 'gambar\\serehwangi.jpg'),
(8, 'Brotowali', 'Tinospora cordifolia', 'Asia Tenggara', 'Berberine, Senyawa polipeptida-p, Senyawa alkaloid, flavonoid, dan saponin', 'gambar\\brotowali.png'),
(9, 'Pegagan', 'Centella asiatica (L.) Urban', 'Daerah Asia tropik, tersebar di Asia Tenggara termasuk Indonesia, India, Republik Rakyat Tiongkok, Jepang dan Australia', 'Flavonoid, polifenol, saponin triterpenoid, poliasetilen, Triterpenoid, asiaticoside dan madecassoside', 'gambarpegagan.png'),
(10, 'Kumis Kucing', 'Orthosiphon aristatus', 'Asia Tenggara, seperti Indonesia, Malaysia, dan Thailand', 'Flavonoid, polifenol, saponin triterpenoid, poliasetilen, Triterpenoid, asiaticoside, madecassoside, Asam Ursolat dan Oleanolat', 'gambarkumiskucing.jpg'),
(11, 'Belimbing Wuluh', 'Averrhoa bilimbi L', 'Pulau Maluku', 'saponin, vitamin C, flavonoid, tannin, triterpenoid, minyak atsiri, alkaloid, terpenoid, dan serat', '\\gambar\\belimbingwuluh.jpg'),
(12, 'Jambu Biji', 'Psidiun guajava Linn', 'Amerika Serikat', 'tanin, kalsium, kuersetin, plavonoid, minyak atsiri, dan alkaloid', '\\gambar\\jambubiji.jpg'),
(13, 'Kemangi', 'Ocimum basilicum L', 'India', 'flavonoid, saponin, minyak esensial, vitamin C', '\\gambar\\kemangi.jpg'),
(14, 'Saga', 'Abrus precatorius Linn', 'India', 'serat, tanin, flavonoid, saponin, dan Glycyrrhizin', '\\gambar\\saga.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `info_tambahan`
--
ALTER TABLE `info_tambahan`
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tanaman`
--
ALTER TABLE `tanaman`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `info_tambahan`
--
ALTER TABLE `info_tambahan`
  ADD CONSTRAINT `info_tambahan_ibfk_1` FOREIGN KEY (`nama_tanaman`) REFERENCES `tanaman` (`nama`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

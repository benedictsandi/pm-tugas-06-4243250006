import 'package:material_ui/material_ui.dart';

class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.kategori,
    required this.deskripsi,
    required this.hargaTiket,
    required this.ikon,
    required this.warna,
  });

  final int id;
  final String nama;
  final String lokasi;
  final String kategori;
  final String deskripsi;

  // Null berarti tarif tidak ditentukan.
  final int? hargaTiket;

  final IconData ikon;
  final Color warna;
}

const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1,
    nama: 'Danau Toba',
    lokasi: 'Kabupaten Samosir',
    kategori: 'Wisata Alam',
    deskripsi:
        'Danau Toba merupakan danau vulkanik yang '
        'terkenal dengan pemandangan perairan dan '
        'perbukitannya. Pengunjung dapat menikmati '
        'suasana danau serta budaya Batak di sekitarnya.',
    hargaTiket: 15000,
    ikon: Icons.water,
    warna: Color(0xFF0277BD),
  ),
  Destinasi(
    id: 2,
    nama: 'Bukit Lawang',
    lokasi: 'Kabupaten Langkat',
    kategori: 'Ekowisata',
    deskripsi:
        'Bukit Lawang menjadi salah satu kawasan '
        'wisata alam yang dikenal sebagai pintu '
        'masuk menuju hutan dan habitat orangutan '
        'Sumatera di kawasan Gunung Leuser.',
    hargaTiket: 20000,
    ikon: Icons.forest,
    warna: Color(0xFF2E7D32),
  ),
  Destinasi(
    id: 3,
    nama: 'Berastagi',
    lokasi: 'Kabupaten Karo',
    kategori: 'Pegunungan',
    deskripsi:
        'Berastagi merupakan kawasan dataran tinggi '
        'yang memiliki udara sejuk, pemandangan '
        'pegunungan, serta berbagai pilihan '
        'wisata alam dan kuliner.',
    hargaTiket: null,
    ikon: Icons.landscape,
    warna: Color(0xFF6D4C41),
  ),
  Destinasi(
    id: 4,
    nama: 'Istana Maimun',
    lokasi: 'Kota Medan',
    kategori: 'Sejarah',
    deskripsi:
        'Istana Maimun merupakan salah satu bangunan '
        'bersejarah Kota Medan dan peninggalan '
        'Kesultanan Deli. Bangunannya memiliki '
        'perpaduan berbagai pengaruh arsitektur.',
    hargaTiket: 10000,
    ikon: Icons.account_balance,
    warna: Color(0xFFF9A825),
  ),
  Destinasi(
    id: 5,
    nama: 'Air Terjun Sipiso-piso',
    lokasi: 'Kabupaten Karo',
    kategori: 'Wisata Alam',
    deskripsi:
        'Air Terjun Sipiso-piso menawarkan '
        'pemandangan air terjun tinggi dan kawasan '
        'perbukitan di sekitar Danau Toba. '
        'Lokasi ini terkenal sebagai tempat menikmati '
        'panorama alam.',
    hargaTiket: 10000,
    ikon: Icons.waterfall_chart,
    warna: Color(0xFF00897B),
  ),
  Destinasi(
    id: 6,
    nama: 'Pantai Sorake',
    lokasi: 'Kabupaten Nias Selatan',
    kategori: 'Pantai',
    deskripsi:
        'Pantai Sorake terkenal dengan ombaknya '
        'dan menjadi salah satu tujuan wisata '
        'selancar di Pulau Nias. Kawasan pantai '
        'menawarkan panorama Samudra Hindia.',
    hargaTiket: null,
    ikon: Icons.beach_access,
    warna: Color(0xFFEF6C00),
  ),
];

Destinasi? cariDestinasi(int id) {
  for (final destinasi in daftarDestinasi) {
    if (destinasi.id == id) return destinasi;
  }
  return null;
}

extension FormatTiket on int? {
  String get teksTiket {
    final nilai = this;

    if (nilai == null) return 'Tarif sesuai lokasi';

    final pola = RegExp(r'\B(?=(\d{3})+(?!\d))');

    return 'Rp${nilai.toString().replaceAllMapped(pola, (m) => '.')}';
  }
}

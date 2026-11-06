import 'package:material_ui/material_ui.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: ListView(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ColoredBox(color: skema.primaryContainer),
                ),
                Positioned(
                  right: -20,
                  bottom: -25,
                  child: Icon(
                    Icons.travel_explore,
                    size: 160,
                    color: skema.primary.withValues(alpha: 0.2),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 24,
                  child: Text('Explore Sumut', style: teks.headlineMedium),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Tentang Explore Sumut'),
            subtitle: Text(
              'Aplikasi contoh panduan wisata '
              'Sumatera Utara berbasis Flutter.',
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person_outline),
            title: Text('Pengembang'),
            subtitle: Text('Benedict Sandi Pangestu Rosa'),
          ),
          const ListTile(
            leading: Icon(Icons.school_outlined),
            title: Text('Institusi'),
            subtitle: Text('Ilmu Komputer - Universitas Negeri Medan'),
          ),
          const ListTile(
            leading: Icon(Icons.code_outlined),
            title: Text('Teknologi'),
            subtitle: Text('Flutter, Dart, Material Design 3, go_router'),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Data destinasi dan harga tiket digunakan '
              'sebagai contoh pembelajaran. '
              'Aplikasi ini bukan layanan reservasi '
              'atau informasi tiket resmi.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

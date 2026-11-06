import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data_destinasi.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail({super.key, required this.destinasi});

  final Destinasi? destinasi;

  @override
  Widget build(BuildContext context) {
    final d = destinasi;

    if (d == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Destinasi tidak ditemukan')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_off_outlined, size: 64),
              const SizedBox(height: 12),
              const Text('Destinasi tidak ditemukan'),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.go('/'),
                child: const Text('Kembali ke daftar'),
              ),
            ],
          ),
        ),
      );
    }

    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    // Stack: ikon destinasi + label kategori.
    final gambar = AspectRatio(
      aspectRatio: 4 / 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(
            color: d.warna.withValues(alpha: 0.15),
            child: Icon(d.ikon, color: d.warna, size: 110),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Chip(
              label: Text(d.kategori),
              avatar: const Icon(Icons.local_offer_outlined, size: 16),
            ),
          ),
        ],
      ),
    );

    final informasi = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(d.nama, style: teks.headlineSmall),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.place_outlined, size: 20),
              const SizedBox(width: 8),
              Expanded(child: Text(d.lokasi)),
            ],
          ),
          const SizedBox(height: 16),
          Text('Informasi Tiket', style: teks.titleMedium),
          const SizedBox(height: 6),
          Text(
            d.hargaTiket.teksTiket,
            style: teks.titleLarge?.copyWith(color: skema.primary),
          ),
          const SizedBox(height: 16),
          Text('Deskripsi', style: teks.titleMedium),
          const SizedBox(height: 8),
          Text(d.deskripsi, style: teks.bodyLarge),
          const SizedBox(height: 20),
          Text(
            'Catatan: harga tiket adalah data '
            'simulasi untuk keperluan tugas.',
            style: teks.bodySmall?.copyWith(color: skema.onSurfaceVariant),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(d.nama)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Layar lebar: ikon dan informasi berdampingan.
          if (constraints.maxWidth >= 700) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: gambar),
                Expanded(child: SingleChildScrollView(child: informasi)),
              ],
            );
          }

          // Layar sempit: ikon di atas informasi.
          return ListView(children: [gambar, informasi]);
        },
      ),
    );
  }
}

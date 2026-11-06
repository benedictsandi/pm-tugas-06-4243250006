import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data_destinasi.dart';

class HalamanDaftar extends StatelessWidget {
  const HalamanDaftar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore Sumut')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final kolom = switch (constraints.maxWidth) {
            < 600 => 2,
            < 900 => 3,
            _ => 4,
          };

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: kolom,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent: 225,
            ),
            itemCount: daftarDestinasi.length,
            itemBuilder: (context, index) {
              return KartuDestinasi(destinasi: daftarDestinasi[index]);
            },
          );
        },
      ),
    );
  }
}

class KartuDestinasi extends StatelessWidget {
  const KartuDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        key: Key('destinasi-${destinasi.id}'),
        onTap: () {
          context.go('/destinasi/${destinasi.id}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ColoredBox(
                color: destinasi.warna.withValues(alpha: 0.15),
                child: Icon(destinasi.ikon, color: destinasi.warna, size: 54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinasi.nama,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: teks.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    destinasi.lokasi,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: teks.bodySmall,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    destinasi.hargaTiket.teksTiket,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: teks.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

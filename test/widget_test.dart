import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pm_tugas_06_4243250006/main.dart';

void main() {
  testWidgets('Daftar destinasi dan detail dapat dibuka', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;

    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ExploreSumutApp());
    await tester.pumpAndSettle();

    expect(find.text('Danau Toba'), findsOneWidget);

    await tester.tap(find.byKey(const Key('destinasi-1')));

    await tester.pumpAndSettle();

    expect(find.text('Deskripsi'), findsOneWidget);

    expect(find.text('Informasi Tiket'), findsOneWidget);
  });
}

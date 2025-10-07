import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modul1/codelab/codelab_main.dart';

void main() {
  testWidgets('StatefulHomePage displays and updates random data', (WidgetTester tester) async {
    // Jalankan versi Stateful
    await tester.pumpWidget(const MyAppStatefulCodelab());

    // Pastikan teks awal ada
    expect(find.textContaining('String Acak:'), findsOneWidget);
    expect(find.textContaining('Angka Acak:'), findsOneWidget);

    // Tombol yang tersedia
    expect(find.text('Hasilkan Data Baru'), findsOneWidget);
    expect(find.text('Ke Halaman Detail'), findsOneWidget);

    // Ambil nilai awal
    final initialString = tester.widget<Text>(find.textContaining('String Acak:')).data;
    final initialNumber = tester.widget<Text>(find.textContaining('Angka Acak:')).data;

    // Tekan tombol untuk hasilkan data baru
    await tester.tap(find.text('Hasilkan Data Baru'));
    await tester.pump();

    // Ambil nilai setelah update
    final updatedString = tester.widget<Text>(find.textContaining('String Acak:')).data;
    final updatedNumber = tester.widget<Text>(find.textContaining('Angka Acak:')).data;

    // Pastikan ada perubahan
    expect(initialString, isNot(equals(updatedString)));
    expect(initialNumber, isNot(equals(updatedNumber)));
  });
}

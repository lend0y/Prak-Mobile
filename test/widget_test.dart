// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:modul1/main.dart';

void main() {
  testWidgets('StatefulHomePage displays and updates random data', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Pastikan Anda menjalankan versi Stateful di main.dart
    await tester.pumpWidget(const MyAppStateful());

    // Verifikasi bahwa ada dua widget Text di halaman
    // Salah satunya untuk "String Acak:" dan yang lainnya "Angka Acak:"
    final textFinder = find.byType(Text);
    expect(textFinder, findsNWidgets(2));

    // Temukan tombol untuk menghasilkan data baru
    final generateButton = find.byType(ElevatedButton);
    expect(generateButton, findsNWidgets(2)); // Ada dua tombol di halaman stateful

    // Simpan teks awal
    final initialString = tester.widget<Text>(textFinder.at(0)).data;
    final initialNumber = tester.widget<Text>(textFinder.at(1)).data;
    
    // Tekan tombol "Hasilkan Data Baru"
    await tester.tap(find.text('Hasilkan Data Baru'));
    await tester.pump();

    // Verifikasi bahwa teks telah berubah
    final updatedString = tester.widget<Text>(textFinder.at(0)).data;
    final updatedNumber = tester.widget<Text>(textFinder.at(1)).data;

    expect(initialString, isNot(equals(updatedString)));
    expect(initialNumber, isNot(equals(updatedNumber)));
  });
}
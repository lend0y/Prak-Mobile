import 'dart:math';
import 'package:flutter/material.dart';

// fungsi untuk menghasilkan string acak
String generateRandomString() {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  return List.generate(
    10,
    (index) => characters[random.nextInt(characters.length)],
  ).join();
}

// fungsi untuk menghasilkan angka acak dari 0 hingga 99
int generateRandomNumber() {
  Random random = Random();
  return random.nextInt(100);
}

// =========================================================
// IMPLEMENTASI DENGAN STATELESS WIDGET
// =========================================================

class MyAppCodelab extends StatelessWidget {
  const MyAppCodelab({super.key});

  @override 
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Codelab App',
      home: StatelessHomePage(),
    );
  }
}

class StatelessHomePage extends StatelessWidget {
  const StatelessHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // data acak dibuat HANYA SEKALI saat widget ini dibangun
    final String randomString = generateRandomString();
    final int randomNumber = generateRandomNumber();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless - Halaman Utama'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Data di halaman ini tidak akan berubah.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text('String Acak: $randomString', style: const TextStyle(fontSize: 18)),
            Text('Angka Acak: $randomNumber', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      randomString: randomString,
                      randomNumber: randomNumber,
                    ),
                  ),
                );
              },
              child: const Text('Ke Halaman Detail'),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================================================
// IMPLEMENTASI DENGAN STATEFUL WIDGET
// =========================================================

class MyAppStatefulCodelab extends StatelessWidget {
  const MyAppStatefulCodelab({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stateful Codelab App',
      home: StatefulHomePage(),
    );
  }
}

class StatefulHomePage extends StatefulWidget {
  const StatefulHomePage({super.key});

  @override
  State<StatefulHomePage> createState() => _StatefulHomePageState();
}

class _StatefulHomePageState extends State<StatefulHomePage> {
  String _randomString = '';
  int _randomNumber = 0;

  @override
  void initState() {
    super.initState();
    _generateNewData();
  }

  // fungsi untuk menghasilkan data acak baru dan memperbarui state
  void _generateNewData() {
    setState(() {
      _randomString = generateRandomString();
      _randomNumber = generateRandomNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful - Halaman Utama'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('String Acak: $_randomString', style: const TextStyle(fontSize: 18)),
            Text('Angka Acak: $_randomNumber', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateNewData,
              child: const Text('Hasilkan Data Baru'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      randomString: _randomString,
                      randomNumber: _randomNumber,
                    ),
                  ),
                );
              },
              child: const Text('Ke Halaman Detail'),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================================================
// HALAMAN DETAIL (digunakan oleh kedua versi)
// =========================================================

class DetailPage extends StatelessWidget {
  final String randomString;
  final int randomNumber;

  const DetailPage({
    super.key,
    required this.randomString,
    required this.randomNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Detail'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Data yang Diterima:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text('String: $randomString', style: const TextStyle(fontSize: 18)),
            Text('Angka: $randomNumber', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

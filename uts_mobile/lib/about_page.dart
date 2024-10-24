import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Aplikasi Ini adalah sebuah aplikasi yang digunakan untuk pembelian sepatu "Vans", dalam aplikasi ini pengguna dapat melakukan pembelian proses transaksi pembelian sepatu.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

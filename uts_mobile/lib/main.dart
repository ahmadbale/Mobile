import 'package:flutter/material.dart';
import 'landing_page.dart';  // Mengimpor file LandingPage
import 'login_page.dart';    // Mengimpor file LoginPage
import 'home_page.dart';     // Mengimpor file HomePage
import 'about_page.dart';    // Mengimpor file AboutPage
import 'profile_page.dart';  // Mengimpor file ProfilePage

void main() {
  runApp(const MyApp());  // Menjalankan aplikasi Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple App',  // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Tema aplikasi dengan warna utama biru
      ),
      initialRoute: '/',  // Rute awal yang ditampilkan (Landing Page)
      
      // Menyediakan daftar rute yang dapat diakses dalam aplikasi
      routes: {
        '/': (context) => const LandingPage(),  // Rute menuju Landing Page
        '/login': (context) => LoginPage(),  // Rute menuju Login Page
        '/home': (context) => const HomePage(),  // Rute menuju Home Page
        '/about': (context) => const AboutPage(),  // Rute menuju About Page
        '/profile': (context) => const ProfilePage(),  // Rute menuju Profile Page
      },
    );
  }
}

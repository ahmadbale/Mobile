import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil argumen username dari halaman sebelumnya
    final String username = ModalRoute.of(context)!.settings.arguments as String;

    // Contoh data statis untuk nama lengkap dan tanggal lahir
    const String fullName = "Ahmad Iqbal Firmansyah";
    const String birthDate = "11 Desember, 2003";
    const String address = "Jl Kebun Nangka No.56";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Foto Profil dengan CircleAvatar
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profil_picture.png'), // Gambar profil
              ),
              const SizedBox(height: 20),
              // Kartu dengan informasi profil
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Username: $username',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Name: $fullName',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Date Of Birth: $birthDate',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Address: $address',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

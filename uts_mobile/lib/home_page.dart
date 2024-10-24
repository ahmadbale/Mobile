import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan username dari halaman sebelumnya melalui argument yang dikirim
    final String username = ModalRoute.of(context)!.settings.arguments as String;

    // Daftar produk (contoh data produk dengan nama, harga, dan gambar)
    final List<Map<String, dynamic>> products = [
      {
        'name': 'Classic Slip-On Checkerboard Shoe',
        'price': 200000,
        'image': 'assets/product1.png', // Gambar produk
      },
      {
        'name': 'Old Skool Canvas Shoe',
        'price': 250000,
        'image': 'assets/product2.png',
      },
      {
        'name': 'Classic Slip-On Checkerboard Shoe',
        'price': 300000,
        'image': 'assets/product3.png',
      },
      {
        'name': 'Knu Skool Shoe',
        'price': 400000,
        'image': 'assets/product4.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'), // Judul halaman di AppBar
      ),
      drawer: Drawer(
        // Menu navigasi samping (drawer)
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              // Header untuk drawer
              child: Text('Menu', style: TextStyle(fontSize: 24)),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            // Menu menuju halaman Profile
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile', arguments: username);
              },
            ),
            // Menu menuju halaman About
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
          ],
        ),
      ),
      // Bagian body halaman
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Menampilkan sapaan dengan username yang didapat dari login
            Text(
              'Hai, $username!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Expanded widget untuk membuat daftar produk mengisi ruang kosong yang tersedia
            Expanded(
              child: ListView.builder(
                // Membuat list yang menampilkan produk berdasarkan data yang ada
                itemCount: products.length, // Jumlah item produk
                itemBuilder: (context, index) {
                  final product = products[index]; // Mengambil data produk berdasarkan index
                  return Card(
                    // Menggunakan Card widget untuk setiap item produk
                    elevation: 4, // Memberikan bayangan pada card
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Membuat sudut card melengkung
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10), // Jarak antar card
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          // Menampilkan gambar produk
                          Image.asset(
                            product['image'],
                            height: 120,
                            fit: BoxFit.cover, // Menyesuaikan ukuran gambar
                          ),
                          const SizedBox(height: 10),
                          // Informasi nama dan harga produk
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // Menampilkan nama produk
                                  Text(
                                    product['name'],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  // Menampilkan harga produk
                                  Text(
                                    'Rp ${product['price'].toString()}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              // Ikon keranjang belanja
                              IconButton(
                                icon: const Icon(
                                  Icons.shopping_cart, // Ikon keranjang belanja
                                  color: Colors.blue,
                                  size: 28,
                                ),
                                onPressed: () {
                                  // Aksi ketika ikon keranjang ditekan
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('${product['name']} added to cart'),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Tombol untuk membeli produk
                          ElevatedButton(
                            onPressed: () {
                              // Aksi ketika tombol beli ditekan
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Buying ${product['name']} for Rp ${product['price']}'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12), // Sudut tombol melengkung
                              ),
                            ),
                            child: const Text(
                              'Beli', // Teks pada tombol beli
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

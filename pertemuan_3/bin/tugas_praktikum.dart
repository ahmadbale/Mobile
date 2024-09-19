import 'package:pertemuan_3/pertemuan_3.dart' as pertemuan_3;

void main() {
  const namaLengkap = "Ahmad Iqbal Firmansyah";
  const nim = "2241760097";

  print("Bilangan prima dari 0 sampai 201:");

  for (int i = 2; i <= 201; i++) {
    bool isPrime = true;

    for (int j = 2; j * j <= i; j++) {
      if (i % j == 0) {
        isPrime = false;
        break;
      }
    }

    if (isPrime) {
      print("$i");
      print("Ditemukan oleh: $namaLengkap ($nim)");
    }
  }
}

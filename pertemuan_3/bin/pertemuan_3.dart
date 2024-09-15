import 'package:pertemuan_3/pertemuan_3.dart' as pertemuan_3;

// void main() {
// Praktikum 1
// String test = "test2";
// if (test == "test1") {
//    print("Test1");
// } else if (test == "test2") {
//    print("Test2");
// } else {
//    print("Something else");
// }

// if (test == "test2") print("Test2 again");

// String test = "true";
// if (test == "true") {
//    print("Kebenaran");
// }

// Praktikum 2
// int counter = 0;
// while (counter < 33) {
//   print(counter);
//   counter++;
// }

// int counter = 75;
// do {
//   print(counter);
//   counter++;
// } while (counter < 77);

// Praktikum 3
// for (int index = 10; index < 27; index++) {
//   print(index);
// }

// for (int index = 10; index < 27; index++) {
//     if (index == 21)
//       break;
//     else if (index > 1 && index < 7) continue;
//     print(index);
//   }
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

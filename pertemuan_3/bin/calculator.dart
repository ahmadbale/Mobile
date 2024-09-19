import 'dart:io';

void main() {
  int i, j, nilai, jmlSmt, jmlMk = 0, jumlahNilai, jumlahSks, totalSks = 0;
  List<List<int>> sks = List.generate(50, (i) => List.filled(30, 0));
  List<int> sksSmt = List.filled(14, 0);
  List<List<String>> nilaihuruf = List.generate(50, (_) => List.filled(30, ''));
  List<List<String>> matkul = List.generate(50, (_) => List.filled(50, ''));
  var mk;
  List<double> nr = List.filled(14, 0);
  double ipk, totalNr = 0;

  print("==============================================");
  print("\tProgram Menghitung IPK Mahasiswa");
  print("==============================================");

  stdout.write("Masukkan jumlah semester: ");
  jmlSmt = int.parse(stdin.readLineSync()!);

  if (jmlSmt < 2 || jmlSmt > 14) {
    print("Jumlah semester salah!");
    return;
  } else {
    for (i = 0; i < jmlSmt; i++) {
      jumlahNilai = 0;
      jumlahSks = 0;
      stdout.write("Masukkan jumlah mata kuliah semester ${i + 1}: ");
      jmlMk = int.parse(stdin.readLineSync()!);
      if (jmlMk < 2) {
        print("Jumlah matakuliah kurang dari 2 setiap semester");
        return;
      } else {
        for (j = 0; j < jmlMk; j++) {
          print("Masukkan mata kuliah ke ${j + 1}");
          stdout.write("Masukkan nama matkul: ");
          matkul[i][j] = stdin.readLineSync()!;
          stdout.write("Masukkan jumlah sks matkul: ");
          sks[i][j] = int.parse(stdin.readLineSync()!);
          stdout.write("Masukkan nilai matkul(A/B/C/D): ");
          nilaihuruf[i][j] = stdin.readLineSync()!;
          print("--------------------------------------------");

          switch (nilaihuruf[i][j]) {
            case 'A':
              nilai = 4 * sks[i][j];
              break;
            case 'B':
              nilai = 3 * sks[i][j];
              break;
            case 'C':
              nilai = 2 * sks[i][j];
              break;
            case 'D':
              nilai = 1 * sks[i][j];
              break;
            case 'E':
              nilai = 0 * sks[i][j];
              break;
            default:
              print("Input salah!");
              return;
          }
          jumlahNilai += nilai;
          jumlahSks += sks[i][j];
        }
        if (jumlahSks > 24) {
          print("Jumlah SKS semester lebih dari 24");
          return;
        } else {
          sksSmt[i] = jumlahSks;
          nr[i] = jumlahNilai / jumlahSks;
        }
      }
    }
  }

  print("==============================================");
  print("\t\tTranskrip Nilai");
  print("==============================================");
  for (i = 0; i < jmlSmt; i++) {
    print("\nHasil Semester ${i + 1}:");
    print("\n${"Mata Kuliah".padRight(12)}${"SKS".padRight(12)}${"Nilai".padRight(12)}");
    for (j = 0; j < jmlMk; j++) {
      print("\n${matkul[i][j].padRight(12)}${sks[i][j].toString().padRight(12)}${nilaihuruf[i][j].padRight(12)}");
    }
    print("\nSKS\t: ${sksSmt[i]}");
    print("NR\t: ${nr[i].toStringAsFixed(2)}");
    totalSks += sksSmt[i];
    totalNr += nr[i];
    print("--------------------------------------------");
  }
  ipk = totalNr / jmlSmt;
  print("\nTotal SKS\t: $totalSks");
  print("IPK\t\t: ${ipk.toStringAsFixed(2)}");
  print("==============================================");
}
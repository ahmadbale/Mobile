import 'package:pertemuan_3/pertemuan_3.dart' as pertemuan_3;
import 'dart:io';

void main() {
  int jmlSmt, jmlMk, jumlahSks = 0, totalSks = 0;
  double ipk = 0.0, totalNr = 0.0;
  List<int> sksSmt = [];
  List<List<String>> matkul = [];
  List<List<int>> sks = [];
  List<List<String>> nilaiHuruf = [];
  List<double> nr = [];

  print("==============================================");
  print("\tProgram Menghitung IPK Mahasiswa");
  print("==============================================");

  stdout.write("Masukkan jumlah semester: ");
  jmlSmt = int.parse(stdin.readLineSync()!);

  if (jmlSmt < 2 || jmlSmt > 14) {
    print("Jumlah semester salah!");
    return;
  }

  for (int i = 0; i < jmlSmt; i++) {
    int jumlahNilai = 0, jumlahSksSmt = 0;

    stdout.write("Masukkan jumlah mata kuliah semester ${i + 1}: ");
    jmlMk = int.parse(stdin.readLineSync()!);

    if (jmlMk < 2) {
      print("Jumlah mata kuliah kurang dari 2 setiap semester");
      return;
    }

    List<String> mkPerSemester = [];
    List<int> sksPerSemester = [];
    List<String> nilaiHurufPerSemester = [];

    for (int j = 0; j < jmlMk; j++) {
      stdout.write("Masukkan mata kuliah ke-${j + 1}: ");
      mkPerSemester.add(stdin.readLineSync()!);

      stdout.write("Masukkan jumlah sks matkul: ");
      sksPerSemester.add(int.parse(stdin.readLineSync()!));

      stdout.write("Masukkan nilai matkul (A/B/C/D/E): ");
      nilaiHurufPerSemester.add(stdin.readLineSync()!);

      int nilai = 0;
      switch (nilaiHurufPerSemester[j]) {
        case 'A':
          nilai = 4 * sksPerSemester[j];
          break;
        case 'B':
          nilai = 3 * sksPerSemester[j];
          break;
        case 'C':
          nilai = 2 * sksPerSemester[j];
          break;
        case 'D':
          nilai = 1 * sksPerSemester[j];
          break;
        case 'E':
          nilai = 0 * sksPerSemester[j];
          break;
        default:
          print("Input salah!");
          return;
      }

      jumlahNilai += nilai;
      jumlahSksSmt += sksPerSemester[j];
    }

    if (jumlahSksSmt > 24) {
      print("Jumlah SKS semester lebih dari 24");
      return;
    } else {
      sksSmt.add(jumlahSksSmt);
      nr.add(jumlahNilai / jumlahSksSmt);
    }

    matkul.add(mkPerSemester);
    sks.add(sksPerSemester);
    nilaiHuruf.add(nilaiHurufPerSemester);
  }

  print("==============================================");
  print("\t\tTranskrip Nilai");
  print("==============================================");

  for (int i = 0; i < jmlSmt; i++) {
    print("\nHasil Semester ${i + 1}:\n");
    print("Mata Kuliah\tSKS\tNilai");
    for (int j = 0; j < matkul[i].length; j++) {
      print("${matkul[i][j]}\t\t${sks[i][j]}\t${nilaiHuruf[i][j]}");
    }

    totalSks += sksSmt[i];
    totalNr += nr[i];

    print("\nSKS\t: ${sksSmt[i]}");
    print("NR\t: ${nr[i].toStringAsFixed(2)}");
    print("--------------------------------------------");
  }

  ipk = totalNr / jmlSmt;

  print("\nTotal SKS\t: $totalSks");
  print("IPK\t\t: ${ipk.toStringAsFixed(2)}");
  print("==============================================");
}
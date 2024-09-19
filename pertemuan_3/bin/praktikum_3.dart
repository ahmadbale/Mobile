import 'package:pertemuan_3/pertemuan_3.dart' as pertemuan_3;

void main() {
  for (int index = 10; index < 27; index++) {
    print(index);
  }

  for (int index = 10; index < 27; index++) {
    if (index == 21)
      break;
    else if (index > 1 && index < 7) continue;
    print(index);
  }
}

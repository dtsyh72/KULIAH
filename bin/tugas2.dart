import "dart:io";

void main() {
  stdout.write("Masukkan Skor Anda: ");
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print("Tidak boleh kosong!");
    return;
  }

  int? skor = int.tryParse(input);

  if (skor == null) {
    print("Harus berupa angka!");
    return;
  }

  if (skor < 0 || skor > 100) {
    print("Skor harus berada dalam rentang 0-100.");
    return;
  }

  String grade;

  if (skor >= 85 && skor <= 100) {
    grade = "A";
  } else if (skor >= 70 && skor <= 84) {
    grade = "B";
  } else if (skor >= 60 && skor <= 69) {
    grade = "C";
  } else if (skor >= 50 && skor <= 59) {
    grade = "D";
  } else {
    grade = "E";
  }

  print("Skor Anda : $skor");
  print("Grade Anda : $grade");
}

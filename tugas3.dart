import 'dart:io';

class MenuItem {
  String nama;
  int harga;

  MenuItem(this.nama, this.harga);
}

void main() {
  // Daftar menu makanan
  List<MenuItem> makanan = [
    MenuItem("Nasi Goreng Biasa", 20000),
    MenuItem("Nasi Goreng Spesial", 28000),
    MenuItem("Mie Ayam", 18000),
    MenuItem("Mie Ayam Bakso", 22000),
    MenuItem("Ayam Lalap", 20000),
    MenuItem("Ayam Geprek", 15000),
  ];

  // Daftar menu minuman
  List<MenuItem> minuman = [
    MenuItem("Es Teh Manis", 5000),
    MenuItem("Es Teh Leci", 10000),
    MenuItem("Cappucino", 15000),
    MenuItem("Jus Buah", 20000),
  ];

  bool stay = true;

  while (stay) {
    print("=== Aplikasi Restoran ===");

    // Tampilkan menu makanan
    print("\nMenu Makanan:");
    for (int i = 0; i < makanan.length; i++) {
      print("${i + 1}. ${makanan[i].nama} - Rp${makanan[i].harga}");
    }

    stdout.write("\nPilih makanan (pisahkan dengan koma): ");
    String? inputMakanan = stdin.readLineSync();
    List<int> pilihanMakanan = [];
    if (inputMakanan != null && inputMakanan.isNotEmpty) {
      pilihanMakanan = inputMakanan
          .split(",")
          .map((e) => int.tryParse(e.trim()) ?? 0)
          .where((e) => e > 0 && e <= makanan.length)
          .toList();
    }

    // Tampilkan menu minuman
    print("\nMenu Minuman:");
    for (int i = 0; i < minuman.length; i++) {
      print("${i + 1}. ${minuman[i].nama} - Rp${minuman[i].harga}");
    }

    stdout.write("\nPilih minuman (pisahkan dengan koma): ");
    String? inputMinuman = stdin.readLineSync();
    List<int> pilihanMinuman = [];
    if (inputMinuman != null && inputMinuman.isNotEmpty) {
      pilihanMinuman = inputMinuman
          .split(",")
          .map((e) => int.tryParse(e.trim()) ?? 0)
          .where((e) => e > 0 && e <= minuman.length)
          .toList();
    }

    // Tampilkan pesanan dan hitung total
    int total = 0;
    print("\n=== Pesanan Anda ===");
    for (var i in pilihanMakanan) {
      var item = makanan[i - 1];
      print("- ${item.nama} Rp${item.harga}");
      total += item.harga;
    }

    for (var i in pilihanMinuman) {
      var item = minuman[i - 1];
      print("- ${item.nama} Rp${item.harga}");
      total += item.harga;
    }

    print("Total Harga: Rp$total");

    // Proses pembayaran
    stdout.write("\nMasukkan jumlah uang pembayaran: ");
    int bayar = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

    if (bayar >= total) {
      int kembalian = bayar - total;
      print("Pembayaran berhasil. Kembalian Anda: Rp$kembalian");
    } else {
      print("Uang tidak cukup. Transaksi dibatalkan.");
    }

    // Tanya apakah mau lanjut
    stdout.write("\nApakah Anda ingin tetap di aplikasi? (y/n): ");
    String? lanjut = stdin.readLineSync();
    if (lanjut == null || lanjut.toLowerCase() != "y") {
      stay = false;
      print("Terima kasih telah menggunakan aplikasi restoran!");
    }
  }
}

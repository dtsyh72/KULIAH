void main() {
  String nama = "Dita";
  int jamKerja = 35;
  double upah_per_jam = 50000;
  bool statusKaryawan = true;

  double gajiKotor = jamKerja * upah_per_jam;
  double pajak = statusKaryawan ? gajiKotor * 0.10 : gajiKotor * 0.05;
  double gajiBersih = gajiKotor - pajak;

  print("Nama Karyawan = $nama");
  print("Gaji Kotor = $gajiKotor");
  print("Pajak = $pajak");
  print("Gaji Bersih = $gajiBersih");
}

import 'dart:math';

abstract class Transportasi {
  String id;
  String nama;
  double tarif;
  int kapasitas;

  Transportasi(this.id, this.nama, this.tarif, this.kapasitas);
  double get tarifDasar => tarif;

  double hitungTarif(int jumlahPenumpang);
  void tampilInfo();
}

class Taksi extends Transportasi {
  double jarak;

  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar * jarak;
  }

  @override
  void tampilInfo() {
    print("===== Info Taksi =====");
    print("ID: $id");
    print("Nama: $nama");
    print("Tarif: $tarifDasar");
    print("Kapasitas: $kapasitas penumpang");
    print("Jarak: $jarak km\n");
  }
}

class Bus extends Transportasi {
  bool adaWifi;

  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
  }

  @override
  void tampilInfo() {
    print("===== Info Bus =====");
    print("ID: $id");
    print("Nama: $nama");
    print("Tarif: $tarifDasar");
    print("Kapasitas: $kapasitas penumpang");
    print("Ada Wifi: ${adaWifi ? "Ya" : "Tidak"}\n");
  }
}

class Pesawat extends Transportasi {
  String kelas;

  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelas)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    double faktor = (kelas == "Bisnis") ? 1.5 : 1.0;
    return tarifDasar * jumlahPenumpang * faktor;
  }

  @override
  void tampilInfo() {
    print("===== Info Pesawat =====");
    print("ID: $id");
    print("Nama: $nama");
    print("Tarif: $tarifDasar");
    print("Kapasitas: $kapasitas penumpang");
    print("Kelas: $kelas\n");
  }
}

class Pemesanan {
  String idPemesanan;
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan(
    this.idPemesanan,
    this.namaPelanggan,
    this.transportasi,
    this.jumlahPenumpang,
    this.totalTarif,
  );

  void cetakStruk() {
    print("======== Struk Pemesanan =======-");
    print("ID Pemesanan: $idPemesanan");
    print("Nama Pelanggan: $namaPelanggan");
    print("Transportasi: ${transportasi.nama}");
    print("Jumlah Penumpang: $jumlahPenumpang");
    print("Total Tarif: $totalTarif");
    print("================================");
  }

  Map<String, dynamic> toMap() {
    return {
      "idPemesanan": idPemesanan,
      "namaPelanggan": namaPelanggan,
      "transportasi": transportasi.nama,
      "jumlahPenumpang": jumlahPenumpang,
      "totalTarif": totalTarif,
    };
  }
}

Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  String id = "PSN-${Random().nextInt(1000)}";
  double total = t.hitungTarif(jumlahPenumpang);
  Pemesanan p = Pemesanan(id, nama, t, jumlahPenumpang, total);
  return p;
}

void tampilPemesanan(List<Pemesanan> daftar) {
  print("\n===== DAFTAR PEMESANAN =========");
  for (var p in daftar) {
    p.cetakStruk();
  }
}

void main() {
  Taksi taksi = Taksi("TX01", "BlueBird", 7500, 4, 12.5);
  Bus bus = Bus("BUS01", "TransJakarta", 3500, 30, true);
  Pesawat pesawat = Pesawat(
    "PSW01",
    "Garuda Indonesia",
    1500000,
    180,
    "Bisnis",
  );

  taksi.tampilInfo();
  bus.tampilInfo();
  pesawat.tampilInfo();

  List<Pemesanan> daftarPemesanan = [];
  daftarPemesanan.add(buatPemesanan(taksi, "Dita", 2));
  daftarPemesanan.add(buatPemesanan(bus, "Tio", 4));
  daftarPemesanan.add(buatPemesanan(pesawat, "Ara", 3));

  tampilPemesanan(daftarPemesanan);
}

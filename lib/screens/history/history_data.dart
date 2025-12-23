class HistoryData {
  // ===== HISTORY OBAT =====
  static final List<Map<String, dynamic>> historyObat = [];

  static void tambahHistory({
    required List<Map<String, dynamic>> obat,
    required int total,
  }) {
    historyObat.add({
      'tanggal': DateTime.now(),
      'obat': obat,
      'total': total,
    });
  }

  // ===== HISTORY ANTRIAN =====
  static final List<Map<String, dynamic>> historyAntrian = [];

  static void tambahAntrian({
    required String dokter,
    required String spesialis,
    required int nomor,
  }) {
    historyAntrian.add({
      'dokter': dokter,
      'spesialis': spesialis,
      'nomor': nomor,
      'tanggal': DateTime.now(),
    });
  }
}

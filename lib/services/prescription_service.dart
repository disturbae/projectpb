class PrescriptionService {
  // RIWAYAT RESEP
  static List<List<Map<String, dynamic>>> prescriptionHistory = [];

  // RESEP AKTIF (dari chat / upload)
  static List<Map<String, dynamic>> currentPrescription = [];

  static void setPrescription(List<Map<String, dynamic>> meds) {
    currentPrescription = meds;
    prescriptionHistory.add(meds);
  }

  static void clearCurrent() {
    currentPrescription = [];
  }

  static void savePrescription(List<Map<String, String>> list) {}
}
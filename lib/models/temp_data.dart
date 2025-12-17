class TempData {
  // === CHAT & RESEP ===
  static List<Map<String, dynamic>> prescriptionMedicines = [];
  static List<Map<String, dynamic>> cart = [];

  // === DOKTER (CHAT & JANJI) ===
  static List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr. Andi',
      'specialist': 'Dokter Umum',
      'queue': 0,
    },
    {
      'name': 'Dr. Siti',
      'specialist': 'Penyakit Dalam',
      'queue': 0,
    },
    {
      'name': 'Dr. Budi',
      'specialist': 'Anak',
      'queue': 0,
    },
    {
      'name': 'Dr. Maya',
      'specialist': 'Kandungan',
      'queue': 0,
    },
  ];
}

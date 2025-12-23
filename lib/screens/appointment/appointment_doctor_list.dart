import 'package:flutter/material.dart';
import 'dart:math';

class AppointmentDoctorList extends StatelessWidget {
  const AppointmentDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      {
        'name': 'Dr. Andi',
        'specialist': 'Dokter Umum',
        'hospital': 'RS Sehat Sentosa',
        'icon': Icons.local_hospital,
      },
      {
        'name': 'Dr. Sinta',
        'specialist': 'Dokter Anak',
        'hospital': 'RS Ibu & Anak',
        'icon': Icons.child_care,
      },
      {
        'name': 'Dr. Budi',
        'specialist': 'Penyakit Dalam',
        'hospital': 'RS Medika',
        'icon': Icons.favorite,
      },
      {
        'name': 'Dr. Maya',
        'specialist': 'Kandungan',
        'hospital': 'RS Harapan Bunda',
        'icon': Icons.pregnant_woman,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Janji Dokter'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doc = doctors[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== HEADER =====
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.blue.shade100,
                        child: Icon(
                          doc['icon'] as IconData,
                          size: 32,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doc['name'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(doc['specialist'] as String),
                            Text(
                              doc['hospital'] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // ===== JAM PRAKTIK =====
                  const Row(
                    children: [
                      Icon(Icons.schedule, size: 18, color: Colors.blue),
                      SizedBox(width: 6),
                      Text('Praktik: 09.00 - 15.00'),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // ===== BUTTON =====
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      onPressed: () {
                        _ambilAntrian(
                          context,
                          doc['name'] as String,
                          doc['specialist'] as String,
                        );
                      },
                      child: const Text('Ambil Antrian'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ================= AMBIL ANTRIAN =================
  void _ambilAntrian(
    BuildContext context,
    String dokter,
    String poli,
  ) {
    final nomor = 'A-${Random().nextInt(30) + 1}';

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Antrian Berhasil',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.confirmation_number,
                size: 60,
                color: Colors.green,
              ),
              const SizedBox(height: 12),
              Text(
                nomor,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                dokter,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(poli),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }
}

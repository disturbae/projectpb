import 'package:flutter/material.dart';
import 'appointment_result_screen.dart';

class AppointmentDoctorList extends StatelessWidget {
  const AppointmentDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    final doctors = [
      {
        'name': 'Dr. Andi',
        'specialist': 'Dokter Umum',
        'hospital': 'RS Sehat Selalu'
      },
      {
        'name': 'Dr. Sinta',
        'specialist': 'Dokter Anak',
        'hospital': 'RS Harapan Bunda'
      },
      {
        'name': 'Dr. Budi',
        'specialist': 'Penyakit Dalam',
        'hospital': 'RS Medika'
      },
      {
        'name': 'Dr. Maya',
        'specialist': 'Kandungan',
        'hospital': 'RS Ibu & Anak'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Janji Dokter')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doc = doctors[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: const Icon(Icons.local_hospital,
                    color: Colors.green),
              ),
              title: Text(
                doc['name']!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${doc['specialist']}\n${doc['hospital']}',
              ),
              isThreeLine: true,
              trailing: ElevatedButton(
                child: const Text('Ambil Antrian'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AppointmentResultScreen(
                        doctorName: doc['name']!,
                        specialist: doc['specialist']!,
                        hospital: doc['hospital']!,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

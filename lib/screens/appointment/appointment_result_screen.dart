import 'dart:math';
import 'package:flutter/material.dart';

class AppointmentResultScreen extends StatelessWidget {
  final String doctorName;
  final String specialist;
  final String hospital;

  AppointmentResultScreen({
    super.key,
    required this.doctorName,
    required this.specialist,
    required this.hospital,
  });

  final int queueNumber = Random().nextInt(50) + 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Janji')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.confirmation_number,
                size: 80, color: Colors.green),
            const SizedBox(height: 20),
            Text(
              'Nomor Antrian Anda',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Text(
              queueNumber.toString(),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dokter : $doctorName'),
                    Text('Spesialis : $specialist'),
                    Text('Rumah Sakit : $hospital'),
                    const SizedBox(height: 8),
                    const Text(
                      'Silakan datang 15 menit sebelum jadwal.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Selesai'),
            )
          ],
        ),
      ),
    );
  }
}

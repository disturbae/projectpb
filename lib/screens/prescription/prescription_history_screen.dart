import 'package:flutter/material.dart';
import '../../services/prescription_service.dart';

class PrescriptionHistoryScreen extends StatelessWidget {
  const PrescriptionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = PrescriptionService.prescriptionHistory;

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Resep')),
      body: history.isEmpty
          ? const Center(child: Text('Belum ada resep'))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final meds = history[index];

                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    title: Text('Resep #${index + 1}'),
                    subtitle:
                        Text('${meds.length} jenis obat'),
                  ),
                );
              },
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'history_data.dart';

class HistoryObatScreen extends StatelessWidget {
  const HistoryObatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History Pembelian Obat')),
      body: HistoryData.historyObat.isEmpty
          ? const Center(child: Text('Belum ada pembelian'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: HistoryData.historyObat.length,
              itemBuilder: (context, index) {
                final data = HistoryData.historyObat[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tanggal: ${data['tanggal']}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 8),
                        ...data['obat'].map<Widget>((o) {
                          return Text(
                              '- ${o['nama']} x${o['qty']}');
                        }).toList(),
                        const Divider(),
                        Text(
                          'Total: Rp ${data['total']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

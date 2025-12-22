import 'package:flutter/material.dart';
import '../../data/app_data.dart';

class HistoryObatScreen extends StatelessWidget {
  const HistoryObatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History Obat')),
      body: AppData.historyObat.isEmpty
          ? const Center(child: Text('Belum ada pembelian'))
          : ListView.builder(
              itemCount: AppData.historyObat.length,
              itemBuilder: (context, index) {
                final item = AppData.historyObat[index];
                return ListTile(
                  leading: const Icon(Icons.history),
                  title: Text(item['nama']!),
                  subtitle: Text(item['tanggal']!),
                  trailing: Text(item['harga']!),
                );
              },
            ),
    );
  }
}

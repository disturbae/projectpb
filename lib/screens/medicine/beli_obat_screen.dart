import 'package:flutter/material.dart';
import '../history/history_data.dart';
import '../history/history_obat_screen.dart';

class BeliObatScreen extends StatefulWidget {
  const BeliObatScreen({super.key});

  @override
  State<BeliObatScreen> createState() => _BeliObatScreenState();
}

class _BeliObatScreenState extends State<BeliObatScreen> {
  final List<Map<String, dynamic>> obatList = [
    {'nama': 'Paracetamol', 'harga': 5000},
    {'nama': 'Amoxicillin', 'harga': 12000},
    {'nama': 'Vitamin C', 'harga': 8000},
    {'nama': 'Ibuprofen', 'harga': 10000},
    {'nama': 'Antasida', 'harga': 7000},
    {'nama': 'CTM', 'harga': 4000},
    {'nama': 'OBH Batuk', 'harga': 15000},
    {'nama': 'Asam Mefenamat', 'harga': 9000},
    {'nama': 'Salbutamol', 'harga': 11000},
    {'nama': 'Zinc', 'harga': 6000},
  ];

  final Map<String, int> keranjang = {};

  int get totalHarga {
    int total = 0;
    keranjang.forEach((nama, qty) {
      final obat =
          obatList.firstWhere((element) => element['nama'] == nama);
      total += (obat['harga'] as int) * qty;
    });
    return total;
  }

  void tambahObat(String nama) {
    setState(() {
      keranjang[nama] = (keranjang[nama] ?? 0) + 1;
    });
  }

  void kurangObat(String nama) {
    setState(() {
      if (keranjang[nama]! > 1) {
        keranjang[nama] = keranjang[nama]! - 1;
      } else {
        keranjang.remove(nama);
      }
    });
  }

  // ================= QRIS POPUP =================
  void showQrisPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Pembayaran QRIS',
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/qris.png',
                height: 220,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              const Text('Total Bayar'),
              const SizedBox(height: 6),
              Text(
                'Rp $totalHarga',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                // ===== SIMPAN KE HISTORY =====
                final List<Map<String, dynamic>> obatDibeli =
                    keranjang.entries.map((e) {
                  return {
                    'nama': e.key,
                    'qty': e.value,
                  };
                }).toList();

                HistoryData.tambahHistory(
                  obat: obatDibeli,
                  total: totalHarga,
                );

                // ===== TUTUP POPUP =====
                Navigator.pop(context);

                // ===== KOSONGKAN KERANJANG =====
                setState(() {
                  keranjang.clear();
                });

                // ===== PINDAH KE HISTORY =====
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HistoryObatScreen(),
                  ),
                );
              },
              child: const Text('Saya Sudah Bayar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beli Obat')),
      body: Column(
        children: [
          // ================= LIST OBAT =================
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: obatList.length,
              itemBuilder: (context, index) {
                final obat = obatList[index];
                final qty = keranjang[obat['nama']] ?? 0;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Icon(Icons.medication,
                            size: 36, color: Colors.blue),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                obat['nama'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text('Rp ${obat['harga']}'),
                            ],
                          ),
                        ),
                        qty == 0
                            ? ElevatedButton(
                                onPressed: () =>
                                    tambahObat(obat['nama']),
                                child: const Text('Tambah'),
                              )
                            : Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () =>
                                        kurangObat(obat['nama']),
                                  ),
                                  Text(
                                    qty.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () =>
                                        tambahObat(obat['nama']),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // ================= TOTAL & BAYAR =================
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Total: Rp $totalHarga',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed:
                      keranjang.isEmpty ? null : showQrisPopup,
                  child: const Text('Bayar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

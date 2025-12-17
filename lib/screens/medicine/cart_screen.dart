import 'package:flutter/material.dart';
import '../../models/medicine.dart';

class CartScreen extends StatefulWidget {
  final List<Medicine> cart;

  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int get totalPrice {
    int total = 0;
    for (var item in widget.cart) {
      total += item.price * item.qty;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang')),
      body: widget.cart.isEmpty
          ? const Center(child: Text('Keranjang kosong'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: widget.cart.length,
                    itemBuilder: (context, index) {
                      final item = widget.cart[index];
                      return Card(
                        margin:
                            const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          title: Text(item.name),
                          subtitle: Text(
                              'Rp ${item.price} x ${item.qty}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (item.qty > 1) {
                                      item.qty--;
                                    }
                                  });
                                },
                              ),
                              Text(item.qty.toString()),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    item.qty++;
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    widget.cart.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Total: Rp $totalPrice',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize:
                              const Size(double.infinity, 50),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title:
                                  const Text('Pembayaran QRIS'),
                              content: const Text(
                                'Scan QRIS (dummy)\n\nPembayaran berhasil',
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text('Bayar dengan QRIS'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

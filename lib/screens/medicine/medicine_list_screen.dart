import 'package:flutter/material.dart';
import '../../models/medicine.dart';
import 'cart_screen.dart';

class MedicineListScreen extends StatefulWidget {
  const MedicineListScreen({super.key});

  @override
  State<MedicineListScreen> createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {
  final List<Medicine> medicines = [
    Medicine(name: 'Paracetamol', price: 15000),
    Medicine(name: 'Amoxicillin', price: 30000),
    Medicine(name: 'Vitamin C', price: 12000),
    Medicine(name: 'Ibuprofen', price: 22000),
    Medicine(name: 'OBH Batuk', price: 18000),
    Medicine(name: 'Antasida', price: 14000),
    Medicine(name: 'CTM', price: 10000),
    Medicine(name: 'Salbutamol', price: 25000),
    Medicine(name: 'Asam Mefenamat', price: 20000),
    Medicine(name: 'Oralit', price: 8000),
  ];

  final List<Medicine> cart = [];

  int get totalItem =>
      cart.fold(0, (sum, item) => sum + item.qty);

  void addToCart(Medicine med) {
    setState(() {
      final index = cart.indexWhere((e) => e.name == med.name);
      if (index >= 0) {
        cart[index].qty++;
      } else {
        cart.add(Medicine(name: med.name, price: med.price));
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${med.name} ditambahkan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Beli Obat'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartScreen(cart: cart),
                    ),
                  ).then((_) => setState(() {}));
                },
              ),
              if (totalItem > 0)
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      totalItem.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          final med = medicines[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.medication,
                    size: 48, color: Colors.blue),
                const SizedBox(height: 10),
                Text(
                  med.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text('Rp ${med.price}'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => addToCart(med),
                  child: const Text('Tambah'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

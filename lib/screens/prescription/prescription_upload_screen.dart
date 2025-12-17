import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../medicine/medicine_list_screen.dart';

class PrescriptionUploadScreen extends StatefulWidget {
  const PrescriptionUploadScreen({super.key});

  @override
  State<PrescriptionUploadScreen> createState() =>
      _PrescriptionUploadScreenState();
}

class _PrescriptionUploadScreenState
    extends State<PrescriptionUploadScreen> {
  File? image;
  final picker = ImagePicker();

  List<Map<String, dynamic>> detectedMedicines = [];

  Future<void> pickImage() async {
    final XFile? picked =
        await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        image = File(picked.path);

        // SIMULASI HASIL OBAT DARI RESEP
        detectedMedicines = [
          {'name': 'Paracetamol', 'price': 15000, 'dose': '3x1'},
          {'name': 'Amoxicillin', 'price': 30000, 'dose': '3x1'},
          {'name': 'Vitamin C', 'price': 12000, 'dose': '1x1'},
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(title: const Text('Upload Resep')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue),
                ),
                child: image == null
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file,
                              size: 60, color: Colors.blue),
                          SizedBox(height: 8),
                          Text('Klik untuk upload resep'),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(image!, fit: BoxFit.cover),
                      ),
              ),
            ),

            const SizedBox(height: 20),

            if (detectedMedicines.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: detectedMedicines.length,
                  itemBuilder: (context, index) {
                    final med = detectedMedicines[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      child: ListTile(
                        leading: const Icon(Icons.medication),
                        title: Text(med['name']),
                        subtitle: Text('Aturan: ${med['dose']}'),
                        trailing: const Icon(Icons.check_circle,
                            color: Colors.green),
                      ),
                    );
                  },
                ),
              ),

            if (detectedMedicines.isNotEmpty)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Lanjut Beli Obat'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MedicineListScreen(),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

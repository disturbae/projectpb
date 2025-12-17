import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Janji Dokter')),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Dokter Umum'),
            subtitle: Text('No Antrian: 12'),
            trailing: Icon(Icons.check_circle, color: Colors.green),
          ),
          ListTile(
            title: Text('Dokter Anak'),
            subtitle: Text('No Antrian: 5'),
            trailing: Icon(Icons.check_circle, color: Colors.green),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../models/doctor.dart';
import 'chat_room_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Doctor> doctors = [
      Doctor(
        name: 'Dr. Andi',
        specialist: 'Dokter Umum',
        icon: Icons.local_hospital,
      ),
      Doctor(
        name: 'Dr. Sinta',
        specialist: 'Dokter Anak',
        icon: Icons.child_care,
      ),
      Doctor(
        name: 'Dr. Budi',
        specialist: 'Penyakit Dalam',
        icon: Icons.favorite,
      ),
      Doctor(
        name: 'Dr. Maya',
        specialist: 'Dokter Kandungan',
        icon: Icons.pregnant_woman,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Chat Dokter')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Icon(doctor.icon, color: Colors.blue),
              ),
              title: Text(
                doctor.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(doctor.specialist),
              trailing: const Icon(Icons.chat),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatRoomScreen(
                      doctorName: doctor.name,
                      specialist: doctor.specialist,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
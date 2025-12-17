import 'package:flutter/material.dart';
import 'chat_list_screen.dart';

class ChatCategoryScreen extends StatelessWidget {
  const ChatCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Dokter')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _categoryCard(
              context,
              title: 'Dokter Umum',
              icon: Icons.local_hospital,
            ),
            _categoryCard(
              context,
              title: 'Dokter Anak',
              icon: Icons.child_care,
            ),
            _categoryCard(
              context,
              title: 'Penyakit Dalam',
              icon: Icons.favorite,
            ),
            _categoryCard(
              context,
              title: 'Dokter Kandungan',
              icon: Icons.pregnant_woman,
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryCard(
    BuildContext context, {
    required String title,
    required IconData icon,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ChatListScreen(),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blue),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
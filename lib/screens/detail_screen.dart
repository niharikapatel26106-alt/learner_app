import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;
  const DetailScreen({super.key, required this.item});

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(Icons.article, size: 70, color: Colors.indigo),
          const SizedBox(height: 22),
          Text('Item #${item['id']}', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 14),
          Text(item['title'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 18),
          Text(item['body'], style: const TextStyle(fontSize: 17, height: 1.5)),
        ]),
      ),
    );
  }
}

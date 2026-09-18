import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, String> user = {};
  @override void initState() { super.initState(); load(); }
  Future<void> load() async {
    final u = await StorageService.getUser();
    if (mounted) setState(() => user = u);
  }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Profile')),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 55)),
        const SizedBox(height: 20),
        Text(user['username'] ?? '', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(user['email'] ?? ''),
      ])));
  }
}

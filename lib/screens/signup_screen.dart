import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void error(String text) => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text), backgroundColor: Colors.red),
  );

  Future<void> signup() async {
    final u = username.text.trim(), e = email.text.trim(), p = password.text;
    if (u.isEmpty || e.isEmpty || p.isEmpty) return error('Please fill all fields.');
    if (!e.contains('@')) return error('Please enter a valid email.');
    if (p.length < 6) return error('Password must contain at least 6 characters.');
    await StorageService.saveUser(u, e, p);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Account created successfully!')),
    );
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(children: [
          const SizedBox(height: 25),
          const Icon(Icons.school, size: 80, color: Colors.indigo),
          const SizedBox(height: 15),
          const Text('Learner App', textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          TextField(controller: username, decoration: const InputDecoration(
            labelText: 'Username', prefixIcon: Icon(Icons.person), border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(controller: email, decoration: const InputDecoration(
            labelText: 'Email', prefixIcon: Icon(Icons.email), border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(controller: password, obscureText: true, decoration: const InputDecoration(
            labelText: 'Password', prefixIcon: Icon(Icons.lock), border: OutlineInputBorder())),
          const SizedBox(height: 24),
          SizedBox(height: 52, child: ElevatedButton(onPressed: signup, child: const Text('SIGN UP'))),
          TextButton(onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            child: const Text('Already have an account? Login')),
        ]),
      ),
    );
  }
}

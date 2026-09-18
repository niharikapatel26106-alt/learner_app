import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  void error(String text) => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(text), backgroundColor: Colors.red),
  );

  Future<void> login() async {
    final e = email.text.trim(), p = password.text;
    if (e.isEmpty || p.isEmpty) return error('Please enter email and password.');
    if (!await StorageService.validateLogin(e, p)) return error('Invalid email or password.');
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(children: [
          const SizedBox(height: 55),
          const Icon(Icons.school, size: 90, color: Colors.indigo),
          const SizedBox(height: 15),
          const Text('Learner App', textAlign: TextAlign.center,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Login to continue', textAlign: TextAlign.center),
          const SizedBox(height: 35),
          TextField(controller: email, decoration: const InputDecoration(
            labelText: 'Email', prefixIcon: Icon(Icons.email), border: OutlineInputBorder())),
          const SizedBox(height: 18),
          TextField(controller: password, obscureText: true, decoration: const InputDecoration(
            labelText: 'Password', prefixIcon: Icon(Icons.lock), border: OutlineInputBorder())),
          const SizedBox(height: 24),
          SizedBox(height: 52, child: ElevatedButton(onPressed: login, child: const Text('LOGIN'))),
          TextButton(onPressed: () => Navigator.pushNamed(context, '/signup'),
            child: const Text("Don't have an account? Sign Up")),
        ]),
      )),
    );
  }
}

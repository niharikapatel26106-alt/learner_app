import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});
  @override State<NotificationsScreen> createState() => _NotificationsScreenState();
}
class _NotificationsScreenState extends State<NotificationsScreen> {
  bool enabled = true;
  @override void initState() { super.initState(); NotificationService.initialize(); }

  Future<void> test() async {
    await NotificationService.showTestNotification();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Test notification triggered.')));
  }

  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Notifications')),
      body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
        SwitchListTile(title: const Text('Enable Notifications'),
          subtitle: const Text('Allow Learner App notifications'),
          value: enabled, onChanged: (v) => setState(() => enabled = v)),
        const SizedBox(height: 30),
        SizedBox(width: double.infinity, height: 52,
          child: ElevatedButton.icon(
            onPressed: enabled ? test : null,
            icon: const Icon(Icons.notifications_active),
            label: const Text('SEND TEST NOTIFICATION'))),
      ])));
  }
}

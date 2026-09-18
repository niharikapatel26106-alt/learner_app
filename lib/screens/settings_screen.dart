import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override State<SettingsScreen> createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen> {
  bool darkMode = false, autoSync = true, notifications = true;
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Settings')),
      body: ListView(children: [
        SwitchListTile(title: const Text('Dark Mode'), subtitle: const Text('Change application appearance'),
          value: darkMode, onChanged: (v) => setState(() => darkMode = v)),
        SwitchListTile(title: const Text('Auto Sync'), subtitle: const Text('Automatically synchronize data'),
          value: autoSync, onChanged: (v) => setState(() => autoSync = v)),
        SwitchListTile(title: const Text('Notifications'), subtitle: const Text('Receive application notifications'),
          value: notifications, onChanged: (v) => setState(() => notifications = v)),
        const Divider(),
        const ListTile(leading: Icon(Icons.info), title: Text('About'),
          subtitle: Text('Learner App version 1.0')),
      ]));
  }
}

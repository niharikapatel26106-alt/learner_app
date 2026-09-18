import 'package:flutter/material.dart';

class SettingsMenuScreen extends StatelessWidget {
  const SettingsMenuScreen({super.key});
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Settings Menu')),
      body: ListView(children: [
        ListTile(leading: const Icon(Icons.settings), title: const Text('Settings'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.pushNamed(context, '/settings')),
        ListTile(leading: const Icon(Icons.notifications), title: const Text('Notifications'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.pushNamed(context, '/notifications')),
        ListTile(leading: const Icon(Icons.person), title: const Text('Profile'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.pushNamed(context, '/profile')),
        ListTile(leading: const Icon(Icons.favorite), title: const Text('Favorites'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.pushNamed(context, '/favorites')),
      ]));
  }
}

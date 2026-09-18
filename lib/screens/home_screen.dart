import 'package:flutter/material.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Map<String, dynamic>>> items;
  @override void initState() { super.initState(); items = ApiService.getItems(); }

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(children: const [
        Icon(Icons.school), SizedBox(width: 10), Text('Learner App')
      ]), actions: [
        IconButton(icon: const Icon(Icons.settings),
          onPressed: () => Navigator.pushNamed(context, '/settings-menu'))
      ]),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: items,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
          final data = snapshot.data ?? [];
          return ListView.builder(
            padding: const EdgeInsets.all(16), itemCount: data.length,
            itemBuilder: (context, i) {
              final item = data[i];
              return Card(child: ListTile(
                leading: CircleAvatar(child: Text('${item['id']}')),
                title: Text(item['title'], maxLines: 2, overflow: TextOverflow.ellipsis),
                subtitle: Text(item['body'], maxLines: 2, overflow: TextOverflow.ellipsis),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.pushNamed(context, '/detail', arguments: item),
              ));
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ], onTap: (i) {
        if (i == 1) Navigator.pushNamed(context, '/favorites');
        if (i == 2) Navigator.pushNamed(context, '/profile');
      }),
    );
  }
}

import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});
  @override State<FavoritesScreen> createState() => _FavoritesScreenState();
}
class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favorites = [];
  @override void initState() { super.initState(); load(); }
  Future<void> load() async {
    final f = await StorageService.getFavorites();
    if (mounted) setState(() => favorites = f);
  }
  @override Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Favorites')),
      body: favorites.isEmpty
        ? const Center(child: Text('No favorite items yet.'))
        : ListView.builder(itemCount: favorites.length, itemBuilder: (_, i) =>
            ListTile(leading: const Icon(Icons.favorite, color: Colors.red),
              title: Text('Favorite Item ${favorites[i]}'))));
  }
}

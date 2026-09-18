import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> saveUser(String username, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  static Future<bool> validateLogin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    return email == prefs.getString('email') &&
        password == prefs.getString('password');
  }

  static Future<Map<String, String>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'username': prefs.getString('username') ?? '',
      'email': prefs.getString('email') ?? '',
    };
  }

  static Future<void> saveFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];
    if (!favorites.contains(id.toString())) favorites.add(id.toString());
    await prefs.setStringList('favorites', favorites);
  }

  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites') ?? [];
  }
}

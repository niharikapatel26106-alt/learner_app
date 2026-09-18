import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<Map<String, dynamic>>> getItems() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode != 200) throw Exception('Failed to load data');
    final List data = jsonDecode(response.body);
    return data.take(10).map((item) => {
      'id': item['id'],
      'title': item['title'],
      'body': item['body'],
    }).toList();
  }
}

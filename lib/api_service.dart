import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://dummyjson.com';

  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      if(data["accessToken"] != null) {
        return data['accessToken'];
      } else {
        throw Exception('Access token not found');
      }  
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> getUserProfile(String id) async {
    final response = await http.get(Uri.parse("$baseUrl/users/$id"));

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data; // langsung return object user
    } else {
      throw Exception('Failed to load user');
    }
  }
}
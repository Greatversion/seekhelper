import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seekhelperpro/models/userModel.dart';


class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}

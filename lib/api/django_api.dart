import 'dart:convert';

import 'package:http/http.dart';

import '../core/models/user/user.dart';

//TODO: Add validation before sending request
class DjangoApi {
  // DjangoApi._private();
  //
  // static final DjangoApi _instance = DjangoApi._private();
  //
  // factory DjangoApi() => _instance;

  static Future<User?> createUser(String email, String password,
      {String? firstName, String? lastName}) async {
    final response = await post(
      Uri.parse('https://fyp-music-app-eva.herokuapp.com/api=create_user/'),
      body: jsonEncode({
        "username": email,
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode == 401) return null;
    final body = response.body;
    final Map<String, dynamic> result = jsonDecode(body);
    return User.fromJson(result);
  }

  static Future<User?> loginWithEmailAndPassword(
      String email, String password) async {
    final response = await post(
      Uri.parse('https://fyp-music-app-eva.herokuapp.com/api=signin/'),
      body: jsonEncode({
        "username": email,
        "email": email,
        "password": password,
      }),
    );
    if (response.statusCode == 401) return null;
    final body = response.body;
    final Map<String, dynamic> result = jsonDecode(body);
    return User.fromJson(result);
  }

  static Future<User?> resetPassword(String email, String newPassword) async {
    final response = await post(
      Uri.parse('https://fyp-music-app-eva.herokuapp.com/api=forgot_password/'),
      body: jsonEncode({
        "email": email,
        "new_password": newPassword,
      }),
    );
    if (response.statusCode == 401) return null;
    final body = response.body;
    final Map<String, dynamic> result = jsonDecode(body);
    return User.fromJson(result);
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthService {
//   static const String baseUrl = 'https://nodejs-ck-x8q8.onrender.com'; // Thay bằng URL của bạn
//   // static const String baseUrl = 'http://localhost:3000';


//   // Đăng ký
//   static Future<Map<String, dynamic>> register(String name, String email, String password, String confirmPassword, {int? age}) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/api/register'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'name': name,
//           'email': email,
//           'password': password,
//           'confirmpassword': confirmPassword,
//           'age': age,
//         }),
//       );

//       print('Register response status: ${response.statusCode}');
//       print('Register response body: ${response.body}');

//       if (response.statusCode == 201) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception(jsonDecode(response.body)['message'] ?? 'Registration failed');
//       }
//     } catch (e) {
//       print('Error during register: $e');
//       rethrow;
//     }
//   }

//   // Đăng nhập
//   static Future<Map<String, dynamic>> login(String email, String password) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/api/login'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': email, 'password': password}),
//       );

//       print('Login response status: ${response.statusCode}');
//       print('Login response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('user', jsonEncode(data['user']));
//         return data;
//       } else {
//         throw Exception(jsonDecode(response.body)['message'] ?? 'Login failed');
//       }
//     } catch (e) {
//       print('Error during login: $e');
//       rethrow;
//     }
//   }

//   // Lấy thông tin user hiện tại
//   static Future<Map<String, dynamic>?> getCurrentUser() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userString = prefs.getString('user');
//     return userString != null ? jsonDecode(userString) : null;
//   }

//   // Đăng xuất
//   static Future<void> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('user');
//   }
// }

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthService {
//   static const String baseUrl = 'https://nodejs-ck-x8q8.onrender.com'; // Thay bằng URL của bạn
//   // static const String baseUrl = 'http://localhost:3000';


//   // Đăng ký
//   static Future<Map<String, dynamic>> register(String name, String email, String password, String confirmPassword, {int? age}) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/api/register'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'name': name,
//           'email': email,
//           'password': password,
//           'confirmpassword': confirmPassword,
//           'age': age,
//         }),
//       );

//       print('Register response status: ${response.statusCode}');
//       print('Register response body: ${response.body}');

//       if (response.statusCode == 201) {
//         return jsonDecode(response.body);
//       } else {
//         throw Exception(jsonDecode(response.body)['message'] ?? 'Registration failed');
//       }
//     } catch (e) {
//       print('Error during register: $e');
//       rethrow;
//     }
//   }

//   // Đăng nhập
//   static Future<Map<String, dynamic>> login(String email, String password) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl/api/login'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'email': email, 'password': password}),
//       );

//       print('Login response status: ${response.statusCode}');
//       print('Login response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('user', jsonEncode(data['user']));
//         return data;
//       } else {
//         throw Exception(jsonDecode(response.body)['message'] ?? 'Login failed');
//       }
//     } catch (e) {
//       print('Error during login: $e');
//       rethrow;
//     }
//   }

//   // Lấy thông tin user hiện tại
//   static Future<Map<String, dynamic>?> getCurrentUser() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userString = prefs.getString('user');
//     return userString != null ? jsonDecode(userString) : null;
//   }

//   // Đăng xuất
//   static Future<void> logout() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('user');
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl = 'http://localhost:3000'; // Thay bằng https://nodejs-ck-x8q8.onrender.com nếu test trên server deploy

  static Future<Map<String, dynamic>> register(String name, String email, String password, String confirmPassword, {int? age}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'confirmpasword': confirmPassword, // Đảm bảo đúng tên field
          'age': age,
        }),
      );

      print('Register response status: ${response.statusCode}');
      print('Register response body: ${response.body}');

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(data['user']));
        return data;
      } else {
        // Xử lý lỗi chi tiết hơn
        try {
          final errorData = jsonDecode(response.body);
          throw Exception(errorData['message'] ?? 'Registration failed');
        } catch (e) {
          throw Exception('Registration failed: ${response.body}');
        }
      }
    } catch (e) {
      print('Error during register: $e');
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      print('Login response status: ${response.statusCode}');
      print('Login response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', jsonEncode(data['user']));
        return data;
      } else {
        // Xử lý lỗi chi tiết hơn
        try {
          final errorData = jsonDecode(response.body);
          throw Exception(errorData['message'] ?? 'Login failed');
        } catch (e) {
          throw Exception('Login failed: ${response.body}');
        }
      }
    } catch (e) {
      print('Error during login: $e');
      rethrow;
    }
  }

  static Future<Map<String, dynamic>?> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userString = prefs.getString('user');
      return userString != null ? jsonDecode(userString) : null;
    } catch (e) {
      print('Error getting current user: $e');
      return null;
    }
  }

  static Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
    } catch (e) {
      print('Error during logout: $e');
      rethrow;
    }
  }
}
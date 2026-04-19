import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Use http://10.0.2.2:8000 for Android Emulator
  // Use http://localhost:8000 for iOS Simulator or Web
  static const String baseUrl = 'https://amigopay-backend.vercel.app';

  Future<List<Map<String, dynamic>>> getTransactions(int userId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/transactions?user_id=$userId'));
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      print('Error fetching transactions: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>> createTransaction(Map<String, dynamic> transaction) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/transactions'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(transaction),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to create transaction');
      }
    } catch (e) {
      print('Error creating transaction: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>> getUser(String email) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/user?email=$email'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return {};
      }
    } catch (e) {
      print('Error fetching user: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>> createUser(Map<String, dynamic> user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(user),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      print('Error creating user: $e');
      return {};
    }
  }

  Future<List<Map<String, dynamic>>> getNotifications(int userId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/notifications?user_id=$userId'));
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(json.decode(response.body));
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching notifications: $e');
      return [];
    }
  }

  Future<void> markNotificationAsRead(int id) async {
    try {
      await http.patch(
        Uri.parse('$baseUrl/notifications/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'leido': 1}),
      );
    } catch (e) {
      print('Error marking notification as read: $e');
    }
  }

  Future<double> getBalance(int userId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/balance?user_id=$userId'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return (data['balance'] as num).toDouble();
      } else {
        return 0.0;
      }
    } catch (e) {
      print('Error fetching balance: $e');
      return 0.0;
    }
  }
}

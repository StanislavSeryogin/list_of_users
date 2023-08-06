import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:list_of_users/model/support_data.dart';
import 'package:list_of_users/model/user_data.dart';
import 'package:list_of_users/utilities/constants.dart';

class UserRepository {
  final http.Client httpClient;

  UserRepository(this.httpClient);

  Future<Map<String, dynamic>> getUsers({int page = 1}) async {
    final response = await httpClient.get(Uri.parse("$kUsersURL?page=$page"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<dynamic> usersData = jsonData['data'];
      SupportData supportData = SupportData.fromJson(jsonData['support']);

      return {
        'users': usersData.map((user) => UserData.fromJson(user)).toList(),
        'support': supportData
      };
    } else {
      throw Exception('Failed to load users');
    }
  }
}

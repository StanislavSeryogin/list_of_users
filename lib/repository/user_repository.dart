import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:list_of_users/model/user_data.dart';
import 'package:list_of_users/utilities/constants.dart';

class UserRepository {
  final http.Client httpClient;

  UserRepository(this.httpClient);

  Future<List<UserData>> getUsers() async {
    final response = await httpClient.get(Uri.parse(kUsersURL));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<dynamic> usersData = jsonData['data'];
      return usersData.map((user) => UserData.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
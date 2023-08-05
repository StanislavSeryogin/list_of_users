import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:list_of_users/model/user_data.dart';
import 'package:list_of_users/repository/user_repository.dart';

class AllUsersPageController extends GetxController {
  final users = <UserData>[].obs;
  final UserRepository userRepository = UserRepository(Client());

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      List<UserData> fetchedUsers = await userRepository.getUsers();
      users.value = fetchedUsers;
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }
}

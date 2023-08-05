import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:list_of_users/model/support_data.dart';
import 'package:list_of_users/model/user_data.dart';
import 'package:list_of_users/repository/user_repository.dart';

class AllUsersPageController extends GetxController {
  final users = <UserData>[].obs;
  final UserRepository userRepository = UserRepository(Client());
  final supportData = Rx<SupportData?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      Map<String, dynamic> fetchedData = await userRepository.getUsers();
      List<UserData>? fetchedUsers = fetchedData['users'];
      SupportData? fetchedSupportData = fetchedData['support'];

      if (fetchedUsers != null) {
        users.value = fetchedUsers;
      }

      supportData.value = fetchedSupportData;
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }
}

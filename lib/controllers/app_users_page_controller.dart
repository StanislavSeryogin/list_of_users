import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:list_of_users/model/support_data.dart';
import 'package:list_of_users/model/user_data.dart';
import 'package:list_of_users/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUsersPageController extends GetxController {
  final users = <UserData>[].obs;
  final UserRepository userRepository = UserRepository(Client());
  final supportData = Rx<SupportData?>(null);

  var currentPage = 1.obs;
  var isLoading = false.obs;
  var canLoadMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadUsersFromPreferences();
    fetchUsers();
  }

  Future<void> loadUsersFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    // Default to an empty list in JSON format
    final storedUsersString = prefs.getString('users') ?? '[]';
    final List<dynamic> storedUsersList = jsonDecode(storedUsersString);

    users.value =
        storedUsersList.map((userMap) => UserData.fromJson(userMap)).toList();
  }

  Future<void> saveUsersToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final usersAsString = jsonEncode(users.toList());
    prefs.setString('users', usersAsString);
  }

  Future<void> fetchUsers() async {
    isLoading.value = true;
    try {
      Map<String, dynamic> fetchedData =
          await userRepository.getUsers(page: currentPage.value);
      List<UserData>? fetchedUsers = fetchedData['users'];
      SupportData? fetchedSupportData = fetchedData['support'];

      if (fetchedUsers != null && fetchedUsers.isNotEmpty) {
        users.addAll(fetchedUsers); // Appending to existing users
        saveUsersToPreferences(); // Save the updated list to preferences
      } else {
        canLoadMore.value = false; // No more users to load
      }

      supportData.value = fetchedSupportData;
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    } finally {
      isLoading.value = false;
    }
  }

  void fetchMoreUsers() {
    if (!isLoading.value && canLoadMore.value) {
      currentPage.value++;
      fetchUsers();
    }
  }
}

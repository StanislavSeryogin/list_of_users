import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_users/pages/all_users_page.dart';
import 'package:list_of_users/pages/selected_user_page.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => AllUsersPage(),
      '/selected_user_page': (context) => const SelectedUserPage(),
    },
  ));
}

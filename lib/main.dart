import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_users/controllers/app_users_page_controller.dart';
import 'package:list_of_users/pages/all_users_page.dart';
import 'package:list_of_users/utilities/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppUsersPageController());

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        foregroundColor: Colors.black,
        backgroundColor: kUserContainerColor,
      ),
    ),
    home: const AllUsersPage(),
  ));
}

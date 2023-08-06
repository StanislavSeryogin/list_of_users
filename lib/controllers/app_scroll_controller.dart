import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_users/controllers/app_users_page_controller.dart';

class AppScrollController extends GetxController {
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    _setupScrollController();
  }

  void _setupScrollController() {
    scrollController.addListener(() {
      if (!scrollController.hasClients) return;

      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        Get.find<AppUsersPageController>().fetchMoreUsers();
      }
    });
  }

  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void scrollToEnd() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

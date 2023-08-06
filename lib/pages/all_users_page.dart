import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_users/components/top_and_end_list_button.dart';
import 'package:list_of_users/controllers/app_scroll_controller.dart';
import 'package:list_of_users/controllers/app_users_page_controller.dart';
import 'package:list_of_users/pages/selected_user_page.dart';
import 'package:list_of_users/widgets/users_list_widget.dart';

class AllUsersPage extends GetView<AppUsersPageController> {
  const AllUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppScrollController scrollController = Get.put(AppScrollController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: Obx(() {
        if (controller.users.isEmpty) {
          return const CircularProgressIndicator();
        } else {
          return ListView.builder(
            controller: scrollController.scrollController,
            itemCount: controller.users.length + 1,
            itemBuilder: (context, index) {
              if (index == controller.users.length) {
                // Reached the end of the list
                controller.fetchMoreUsers();
                return const Center(child: CircularProgressIndicator());
              } else {
                return UsersListWidget(
                  goTo: () => Get.to(
                    () => SelectedUserPage(
                      id: controller.users[index].id,
                      pathImageAvatar: controller.users[index].avatar,
                      firstName: controller.users[index].firstName,
                      lastName: controller.users[index].lastName,
                      email: controller.users[index].email,
                      supportUrl:
                          controller.supportData.value?.url ?? "No url link",
                      supportText: controller.supportData.value?.text ??
                          "No support data available.",
                    ),
                  ),
                  userId: controller.users[index].id,
                  pathImageAvatar: controller.users[index].avatar,
                  firstName: controller.users[index].firstName,
                  lastName: controller.users[index].lastName,
                  email: controller.users[index].email,
                );
              }
            },
          );
        }
      }),
      floatingActionButton:
          TopAndEndListButton(scrollController: scrollController),
    );
  }
}

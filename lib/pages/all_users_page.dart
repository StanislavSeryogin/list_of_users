import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_users/controllers/all_users_page_controller.dart';
import 'package:list_of_users/pages/selected_user_page.dart';
import 'package:list_of_users/widgets/users_list_widget.dart';

class AllUsersPage extends StatelessWidget {
  AllUsersPage({super.key});

  final AllUsersPageController allUsersController =
      Get.put(AllUsersPageController());

  @override
  Widget build(BuildContext context) {
    final users = allUsersController.users;
    final support = allUsersController.supportData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Data'),
      ),
      body: Obx(() {
        if (users.isEmpty) {
          return const CircularProgressIndicator();
        } else {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return UsersListWidget(
                goTo: () => Get.to(
                  () => SelectedUserPage(
                    id: users[index].id,
                    checkImageAvatar: users[index].avatar.isNotEmpty,
                    pathImageAvatar: users[index].avatar,
                    firstName: users[index].firstName,
                    lastName: users[index].lastName,
                    email: users[index].email,
                    supportText:
                        support.value?.text ?? "No support data available.",
                    supportUrl: support.value?.url ?? "No url link",
                  ),
                ),
                userId: users[index].id,
                checkImageAvatar: users[index].avatar.isNotEmpty,
                pathImageAvatar: users[index].avatar,
                firstName: users[index].firstName,
                lastName: users[index].lastName,
                email: users[index].email,
              );
            },
          );
        }
      }),
    );
  }
}

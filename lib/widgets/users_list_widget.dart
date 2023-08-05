import 'package:flutter/material.dart';
import 'package:list_of_users/components/app_circle_avatar.dart';
import 'package:list_of_users/utilities/constants.dart';
import 'package:list_of_users/widgets/user_details_widget.dart';

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({
    super.key,
    required this.checkImageAvatar,
    required this.pathImageAvatar,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final bool checkImageAvatar;
  final String pathImageAvatar;
  final String firstName;
  final String lastName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.all(20),
        width: double.maxFinite,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kUserContainerColor,
        ),
        child: Row(
          children: [
            AppCircleAvatar(
              check: checkImageAvatar,
              pathImageNetwork: pathImageAvatar,
            ),
            Expanded(
              child: UserDetailsWidget(
                firstName: firstName,
                lastName: lastName,
                email: email,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
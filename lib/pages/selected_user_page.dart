import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_users/components/app_circle_avatar_widget.dart';
import 'package:list_of_users/components/app_link_widget.dart';
import 'package:list_of_users/components/app_text_widget.dart';
import 'package:list_of_users/utilities/constants.dart';

class SelectedUserPage extends StatelessWidget {
  const SelectedUserPage({
    super.key,
    required this.id,
    required this.pathImageAvatar,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.supportText,
    required this.supportUrl,
  });

  final int id;
  final String pathImageAvatar;
  final String firstName;
  final String lastName;
  final String email;

  final String supportUrl;
  final String supportText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kUserContainerColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: id,
                      child: AppCircleAvatarWidget(
                        pathImageNetwork: pathImageAvatar,
                        radiusCircle: 100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const AppTextWidget(
                  text: 'Main Info',
                  fontSize: 30,
                ),
                AppTextWidget(
                  text: 'User id: $id',
                  fontSize: 20,
                ),
                AppTextWidget(
                  text: 'First Name: $firstName',
                  fontSize: 20,
                ),
                AppTextWidget(
                  text: 'Last Name: $lastName',
                  fontSize: 20,
                ),
                AppTextWidget(
                  text: 'Email: $email',
                  fontSize: 20,
                ),
                const SizedBox(height: 10.0),
                const AppTextWidget(
                  text: 'Support',
                  fontSize: 30,
                ),
                Row(
                  children: [
                    const AppTextWidget(
                      text: 'Email: ',
                      fontSize: 20,
                    ),
                    Expanded(child: AppLinkWidget(supportUrl: supportUrl))
                  ],
                ),
                AppTextWidget(
                  text: 'Support: $supportText',
                  fontSize: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

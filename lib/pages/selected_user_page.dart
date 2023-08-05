import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_users/components/app_circle_avatar.dart';
import 'package:list_of_users/utilities/constants.dart';

class SelectedUserPage extends StatelessWidget {
  const SelectedUserPage({
    super.key,
    required this.id,
    required this.checkImageAvatar,
    required this.pathImageAvatar,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.supportText,
    required this.supportUrl,
  });

  final int id;
  final bool checkImageAvatar;
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
                      child: AppCircleAvatar(
                        check: checkImageAvatar,
                        pathImageNetwork: pathImageAvatar,
                        radiusCircle: 100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  'ID: $id',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'First Name: $firstName',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Last Name: $lastName',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Email: $email',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Email: $supportUrl',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Email: $supportText',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

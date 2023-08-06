import 'package:flutter/material.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final String firstName;
  final String lastName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$firstName $lastName",
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          email,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

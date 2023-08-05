import 'package:flutter/material.dart';

import 'package:list_of_users/utilities/constants.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    required this.check,
    required this.pathImageNetwork,
  });

  final bool check;
  final String pathImageNetwork;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundImage: check
          ? NetworkImage(pathImageNetwork)
          : const AssetImage(kDefaultAvatarPath) as ImageProvider<Object>,
    );
  }
}

import 'package:flutter/material.dart';

import 'package:list_of_users/utilities/constants.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({
    super.key,
    required this.check,
    required this.pathImageNetwork,
    required this.radiusCircle,
  });

  final bool check;
  final String pathImageNetwork;
  final double radiusCircle;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radiusCircle,
      backgroundImage: check
          ? NetworkImage(pathImageNetwork)
          : const AssetImage(kDefaultAvatarPath) as ImageProvider<Object>,
    );
  }
}

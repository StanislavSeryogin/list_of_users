import 'package:flutter/material.dart';
import 'package:list_of_users/utilities/constants.dart';

class AppCircleAvatarWidget extends StatelessWidget {
  const AppCircleAvatarWidget({
    super.key,
    required this.radiusCircle,
    required this.pathImageNetwork,
  });

  final double radiusCircle;
  final String pathImageNetwork;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radiusCircle,
      foregroundImage: NetworkImage(pathImageNetwork),
      backgroundImage: const AssetImage(kDefaultAvatarPath),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class AppLinkWidget extends StatelessWidget {
  const AppLinkWidget({
    super.key,
    required this.supportUrl,
  });

  final String supportUrl;

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(supportUrl),
      builder: (context, openLink) => TextButton(
        onPressed: openLink,
        child: Text(
          supportUrl,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

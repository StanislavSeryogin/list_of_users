import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  const AppTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}

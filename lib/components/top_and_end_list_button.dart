import 'package:flutter/material.dart';
import 'package:list_of_users/controllers/app_scroll_controller.dart';
import 'package:list_of_users/utilities/constants.dart';

class TopAndEndListButton extends StatelessWidget {
  const TopAndEndListButton({
    super.key,
    required this.scrollController,
  });

  final AppScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          backgroundColor: kUserContainerColor,
          onPressed: scrollController.scrollToTop,
          tooltip: 'Scroll to Top',
          child: const Icon(Icons.arrow_upward),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          backgroundColor: kUserContainerColor,
          onPressed: scrollController.scrollToEnd,
          tooltip: 'Scroll to End',
          child: const Icon(Icons.arrow_downward),
        ),
      ],
    );
  }
}

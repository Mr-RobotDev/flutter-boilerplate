import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    this.leading,
    required this.title,
    this.trailing,
  });

  final Widget? leading;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leading ?? const SizedBox.shrink(),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        trailing ?? const SizedBox.shrink(),
      ],
    );
  }
}

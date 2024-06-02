import 'package:community_app/common/colors.dart';
import 'package:flutter/material.dart';

class AppBarWithTitle extends StatelessWidget {
  const AppBarWithTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: containerColor),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 35,
            ))
      ],
    );
  }
}

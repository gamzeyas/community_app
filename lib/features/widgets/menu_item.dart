import 'package:community_app/common/colors.dart';
import 'package:community_app/common/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    this.onTap,
    required this.title,
    required this.leadingAsset,
  });
  final Function()? onTap;
  final String title;
  final String leadingAsset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: vertical5,
        child: Card(
          color: activeColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 10,
          child: ListTile(
            leading: SvgPicture.asset(leadingAsset),
            title: Text(
              title,
              style: const TextStyle(color: containerColor, fontSize: 16),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: containerColor,
            ),
          ),
        ),
      ),
    );
  }
}
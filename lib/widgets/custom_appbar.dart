import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'gdsc_logo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final Widget? trailing;
  const CustomAppBar({super.key, this.text, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      title: Padding(
        padding: const EdgeInsets.only(left: 27),
        child: text != null
            ? Text(
          text!,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        )
            : const Logo(),
      ),
      actions: trailing != null ? [trailing!, const SizedBox(width: 27)] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}


import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class GreetingComp extends StatelessWidget {
  const GreetingComp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 25,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Norhan,',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Seize the day!!',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.subtextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
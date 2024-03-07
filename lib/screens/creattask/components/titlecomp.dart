import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants/colors.dart';
import '../../../constants/asset_data.dart';
import '../../../util/validators.dart';
import '../../../widgets/input_field.dart';

class Titlecomp extends StatelessWidget {


  final TextEditingController controller;
  const Titlecomp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Task Title',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppColors.text),
        ),
        const SizedBox(height: 10),
        InputField(
          controller: controller,
          hintText: 'Title',
          prefix: SvgPicture.asset(AssetData.titleSvg),
          validator: Validators.checkLength,
        ),
      ],
    );
  }
}
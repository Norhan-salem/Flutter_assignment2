import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:session3/constants/colors.dart';
import '../../../constants/asset_data.dart';
import '../../../util/validators.dart';
import '../../../widgets/input_field.dart';

class Todoscomp extends StatelessWidget {



  final List<TextEditingController> controllers;
  final void Function(int) onRemove;
  const Todoscomp({super.key, required this.controllers, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'To-dos',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        ListView(
          shrinkWrap: true,
          children: [
            for (var i = 0; i < controllers.length; i++) ...[
              InputField(
                controller: controllers[i],
                hintText: 'ToDo ${i + 1}',
                prefix: SvgPicture.asset(AssetData.clipboardSvg),
                suffix: i != 0
                    ? IconButton(
                  icon: const Icon(Icons.close, color: AppColors.crossColor),
                  onPressed: () => onRemove(i),
                )
                    : null,
                validator: Validators.checkLength,
              ),
              if (i != controllers.length - 1) const SizedBox(height: 15),
            ]
          ],
        ),
      ],
    );
  }
}
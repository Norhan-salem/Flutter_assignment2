import 'package:flutter/material.dart';
import 'package:session3/constants/asset_data.dart';
import 'package:session3/constants/colors.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final String hintText;
  final String? Function(String?) validator;

  const InputField({super.key,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefix,
    this.suffix,
    required this.hintText,
    required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(color: AppColors.subtextColor),
      // This sets the input text color
      decoration: InputDecoration(
        fillColor: AppColors.inputFieldBackgroundColor,
        // This sets the background color
        filled: true,
        // Don't forget to set filled to true
        focusedBorder: _getBorder(),
        focusedErrorBorder: _getBorder(color: AppColors.crossColor),
        enabledBorder: _getBorder(),
        errorBorder: _getBorder(color: AppColors.crossColor),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.subtextColor,
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }

  InputBorder _getBorder({Color color = AppColors.inputFieldBackgroundColor}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: color,
      ),
      borderRadius: BorderRadius.circular(100),
    );
  }
}
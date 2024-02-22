import 'package:flutter/material.dart';

class TodoInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final String hintText;
  final String? Function(String?) validator;

  const TodoInputField(
      {super.key,
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
      decoration: InputDecoration(
        focusedBorder: _getBorder(),
        focusedErrorBorder: _getBorder(color: Colors.red),
        enabledBorder: _getBorder(),
        errorBorder: _getBorder(color: Colors.red),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }

  InputBorder _getBorder({Color color = Colors.black}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: color,
      ),
      borderRadius: BorderRadius.circular(100),
    );
  }
}

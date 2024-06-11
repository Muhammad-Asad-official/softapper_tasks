import 'package:flutter/material.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  required String hintText,
  required IconData prefixIcon,
  bool obscureText = false,
  TextInputType? keyboardType,
  Widget? suffixIcon,
  required String? Function(String?) validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.white70,
      prefixIcon: Icon(
        prefixIcon,
        color: Colors.black38,
      ),
      suffixIcon: suffixIcon,
    ),
    validator: validator,
  );
}


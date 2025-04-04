import 'package:flutter/material.dart';
import 'package:one_chat_app/domain/constants/app_colors/app_colors.dart';

Widget myTextField(
    {required String hinttxt,
    Icon? preIcon,
    Widget? suffIcon,
    String? labelTxt,
    required keyboardType,
    required TextEditingController mcrontroller,
  
    String? Function(String? value)? validator}) {
  return TextFormField(
    keyboardType: keyboardType,
    validator: validator,
    controller: mcrontroller,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 16.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: AppColors.lightPrimaryColor),
      ),
      label: Text(labelTxt!),
      prefixIcon: preIcon,
      suffixIcon: suffIcon,
      hintText: hinttxt,
    ),
  );
}

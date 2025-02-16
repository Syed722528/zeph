import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class AuthInputDecorations {
  static InputDecoration inputDecoration({
    String? hintText,
  }) {
    return InputDecoration(
      fillColor: AppColors.backgroundLight,
      filled: true,
      contentPadding: EdgeInsets.all(15),
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    );
  }
}

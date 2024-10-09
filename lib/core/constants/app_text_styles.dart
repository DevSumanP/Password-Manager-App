import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_manager/core/constants/app_colors.dart';

class AppTextStyles {
  // Heading styles
  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  // Subtitle styles
  static TextStyle subtitle1 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  // Body text
  static TextStyle bodyText = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.textLightColor,
  );

  // Password text (masked)
  static TextStyle passwordText = GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.normal,
      color: AppColors.textLightColor,
      letterSpacing: 2.0);

  // Button text
  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white, // Assuming a white text on colored buttons
  );
}

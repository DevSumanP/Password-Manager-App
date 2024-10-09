import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_manager/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  final bool isObscure;
  final TextInputType type;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.isObscure,
      required this.type,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            labelText,
            style: GoogleFonts.roboto(
                color: AppColors.textColor,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          keyboardType: type,
          decoration: InputDecoration(
            fillColor: AppColors.cardBackgroundColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.fromLTRB(15, 30, 15, 10),
            hintMaxLines: 1,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.textLightColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  final bool isObscure;
  final TextInputType type;
  const MyTextField(
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
                color: const Color.fromARGB(255, 201, 201, 201),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          keyboardType: type,
          decoration: InputDecoration(
            fillColor: const Color.fromARGB(179, 39, 35, 35),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.fromLTRB(15, 30, 15, 2),
            hintMaxLines: 1,
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color.fromARGB(255, 196, 196, 196),
              fontWeight: FontWeight.w400,
            ),
          ),
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}

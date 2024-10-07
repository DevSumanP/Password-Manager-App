import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatefulWidget {
  final String text;
  final Color background;
  final Color foreground;
  final Function()? onTap;

  const MyButton({
    super.key,
    required this.text,
    required this.background,
    required this.foreground,
    required this.onTap,
  });

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 290,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.background,
          foregroundColor: widget.foreground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onPressed: () async {
          setState(() {
            _isLoading = true;
          });
          await widget.onTap!();
          setState(() {
            _isLoading = false;
          });
        },
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff1e1e1e)),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.text,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: widget.foreground,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

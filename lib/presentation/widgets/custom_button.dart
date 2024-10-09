import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/app_text_styles.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Color background;
  final Color foreground;
  final Function()? onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.background,
    required this.foreground,
    required this.onTap,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.background,
          foregroundColor: widget.foreground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
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
                  Text(widget.text, style: AppTextStyles.buttonText),
                ],
              ),
      ),
    );
  }
}

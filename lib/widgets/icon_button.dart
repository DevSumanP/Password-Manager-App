import 'package:flutter/material.dart';

class MyIconButton extends StatefulWidget {
  final Function()? onTap;

  const MyIconButton({
    super.key,
    required this.onTap,
  });

  @override
  _MyIconButtonState createState() => _MyIconButtonState();
}

class _MyIconButtonState extends State<MyIconButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
            height: 55,
            width: 55,
            color: const Color.fromARGB(255, 87, 88, 88),
            child: const Icon(
              Icons.fingerprint_outlined,
              size: 30,
              color: Color(0xffffffff),
            )),
      ),
    );
  }
}

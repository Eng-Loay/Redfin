import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const CustomButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      color: Color(0xFF90CAF9),
      textColor: Colors.white,
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

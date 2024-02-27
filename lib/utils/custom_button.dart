import 'package:flutter/material.dart';
import 'package:stationery/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Size size;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.size,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      width: size.width * 0.75,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: appBarColor),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

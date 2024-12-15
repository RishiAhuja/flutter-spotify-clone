import 'package:flutter/material.dart';
import 'dart:ui';

class BlurredButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final String text;
  const BlurredButton(
      {super.key,
      required this.iconData,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 34, 34, 34).withOpacity(0.3),
              borderRadius: BorderRadius.circular(100),
            ),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Icon(iconData, color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: const TextStyle(
              fontFamily: 'Satoshi',
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.only(left: 7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode
                ? Colors.white.withOpacity(0.03)
                : Colors.black.withOpacity(0.03),
          ),
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: context.isDarkMode ? Colors.white : Colors.black,
          )),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/appbar/back_icon.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  //implementing interface: PreferredSizeWidget

  final Widget? title;
  const BasicAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title ?? const Text(''),
      leading: const BackIcon(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  /*When you implement PreferredSizeWidget in Flutter, 
  you need to provide the preferredSize getter to specify the 
  preferred size of your custom widget. 
  This is particularly important for widgets like app bars, 
  which need to inform their parent widgets (like Scaffold) '
  about their preferred size. */

  /* More widgets which might out this interface implementation
  - Custom Bottom App Bar:
  - Custom Tab Bar:
  - Custom Search Bar:
  - Custom Header: */
}

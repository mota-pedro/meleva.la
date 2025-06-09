import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool? addBackButton;

  const CustomAppbar({super.key, this.addBackButton});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Colors.white,
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: addBackButton ?? true,
      centerTitle: true,
      title: const Image(
          image: AssetImage('assets/images/melevala_white.png'),
          width: 160,
      ),
    );
  }
}

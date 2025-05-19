import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomListTile({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      leading: Icon(
          icon,
          color: Colors.grey,
      ),
      title: Text(
          title,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold
          ),
      ),
      onTap: onTap,
    );
  }
}

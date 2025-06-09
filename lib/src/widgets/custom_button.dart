import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? leadingIcon;
  final String title;
  final bool? isLoading;
  final Color? color;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.width,
    this.height,
    this.leadingIcon,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        fixedSize: Size(
          width ?? MediaQuery.sizeOf(context).width,
          height ?? 60,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child:
          isLoading != null && isLoading == true
              ? Center(child: CircularProgressIndicator(color: Colors.white,))
              : leadingIcon != null
              ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(leadingIcon, size: 26, color: Colors.white),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
              : Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
    );
  }
}

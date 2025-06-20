import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData? icon;
  final String label;
  final bool? isPassword;

  const CustomTextField({
    super.key,
    required this.controller,
    this.icon,
    required this.label,
    this.isPassword,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  late Color iconColor;
  late Color labelColor;

  bool viewPassword = true;

  @override
  void initState() {
    super.initState();
    iconColor = Colors.grey;
    labelColor = Colors.grey;

    _focusNode.addListener(() {
      setState(() {
        iconColor =
            _focusNode.hasFocus
                ? Theme.of(context).colorScheme.primary
                : Colors.grey;
        labelColor =
            _focusNode.hasFocus
                ? Theme.of(context).colorScheme.primary
                : Colors.grey;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: widget.isPassword != null && widget.isPassword! ? viewPassword : false,
      style: TextStyle(
          color: Theme.of(context).colorScheme.tertiaryFixed
      ),
      decoration: InputDecoration(

        prefixIcon: Icon(widget.icon, color: iconColor),
        suffixIcon: widget.isPassword != null && widget.isPassword!
          ? IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              viewPassword = !viewPassword;
            });
          },
          icon:
          viewPassword
              ? Icon(
            FontAwesomeIcons.eye,
            color: Colors.grey,
            size: 20,
          )
              : Icon(FontAwesomeIcons.eyeSlash, color: Colors.grey, size: 20)
        ) : Icon(null),
        labelText: widget.label,
        labelStyle: TextStyle(color: labelColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}

class CustomChatTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomChatTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
          color: Theme.of(context).colorScheme.tertiaryFixed
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}

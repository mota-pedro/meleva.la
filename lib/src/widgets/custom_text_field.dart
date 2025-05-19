import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final String label;

  const CustomTextField({super.key, required this.controller, required this.icon, required this.label});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  late Color iconColor;
  late Color labelColor;

  @override
  void initState() {
    super.initState();
    iconColor = Colors.grey;
    labelColor = Colors.grey;

    _focusNode.addListener(() {
      setState(() {
        iconColor = _focusNode.hasFocus
            ? Theme.of(context).colorScheme.primary
            : Colors.grey;
        labelColor = _focusNode.hasFocus
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
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: iconColor,
        ),
        labelText: widget.label,
        labelStyle: TextStyle(
            color: labelColor
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2.0),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(40)
        ),
      ),
    );
  }
}

class CustomHomeTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String label;

  const CustomHomeTextField({super.key, required this.controller, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5),
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.5),
        ),
      ),
    );
  }
}

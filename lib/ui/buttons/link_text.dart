import 'package:flutter/material.dart';

class LinkText extends StatefulWidget {
  final String text;
  final Function onPressed;

  const LinkText({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onPressed(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => isHover = true),
        onExit: (event) => setState(() => isHover = false),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.text,
            style: TextStyle(
              color: isHover ? Colors.grey[700] : Colors.grey.withOpacity(0.5),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

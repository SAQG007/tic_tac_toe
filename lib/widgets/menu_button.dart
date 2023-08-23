import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  final String title;
  final Function()? onTap;

  const MenuButton({
    required this.title,
    required this.onTap,
    Key? key
  }) : super(key: key);

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(100.0, 10.0, 100.0, 0.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: widget.onTap,
            child: Text(
              widget.title
            ),
          ),
        ),
      ),
    );
  }
}

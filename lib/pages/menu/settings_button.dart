import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingsButton extends StatefulWidget {
  final String title;
  bool switchValue;

  SettingsButton({
    required this.title,
    required this.switchValue,
    Key? key
  }) : super(key: key);

  @override
  _SettingsButtonState createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Switch(
          value: widget.switchValue,
          onChanged: (bool value) {
            setState(() {
              widget.switchValue = value;
              print(widget.switchValue);
            });
          }
        ),
      ],
    );
  }
}

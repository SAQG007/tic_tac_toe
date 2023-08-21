import 'package:flutter/material.dart';

class SettingsButton extends StatefulWidget {
  final String title;
  final bool switchValue;
  // callback function that will return a bool and will be called whenever the value of switch changes
  final Function(bool) onChangedCallBack; 

  const SettingsButton({
    required this.title,
    required this.switchValue,
    required this.onChangedCallBack,
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
              widget.onChangedCallBack(value);
            });
          }
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class SettingsSwitch extends StatefulWidget {
  final String title;
  final bool switchValue;
  // callback function that will return a bool and will be called whenever the value of switch changes
  final Function(bool) onChangedCallBack; 

  const SettingsSwitch({
    required this.title,
    required this.switchValue,
    required this.onChangedCallBack,
    Key? key
  }) : super(key: key);

  @override
  _SettingsSwitchState createState() => _SettingsSwitchState();
}

class _SettingsSwitchState extends State<SettingsSwitch> {
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
          inactiveThumbColor: Colors.deepPurple,
          trackOutlineColor: const MaterialStatePropertyAll<Color>(Colors.deepPurple),
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

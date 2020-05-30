import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'common.dart';

import 'custom_switch_button.dart';

class Switch extends StatelessWidget {
  const Switch({
    @required this.value,
    @required this.activeTrackColor,
    @required this.inActiveTrackColor,
    @required this.indicatorActiveColor,
    @required this.indicatorInActiveColor,
    this.onChanged,
    Key key,
  }) : super(key: key);

  final bool value;
  final Color activeTrackColor;
  final Color inActiveTrackColor;
  final Color indicatorActiveColor;
  final Color indicatorInActiveColor;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return HandCursor(
      child: CustomSwitchButton(
        value: value,
        animationDuration: const Duration(milliseconds: 300),
        indicatorActiveColor: indicatorActiveColor,
        indicatorInActiveColor: indicatorInActiveColor,
        activeTrackColor: activeTrackColor,
        inActiveTrackColor: inActiveTrackColor,
        onChanged: onChanged,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/common/common.dart';

class ScaledSwitch extends StatelessWidget {
  final bool value;
  final Color activeColor;
  final Color trackColor;
  final ValueChanged<bool> onChanged;
  final double scale;

  const ScaledSwitch({
    @required this.value,
    @required this.activeColor,
    @required this.trackColor,
    this.scale = 0.5,
    this.onChanged,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HandCursor(
      child: Transform.scale(
        scale: scale,
        child: CupertinoSwitch(
          value: value,
          activeColor: activeColor,
          trackColor: trackColor,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

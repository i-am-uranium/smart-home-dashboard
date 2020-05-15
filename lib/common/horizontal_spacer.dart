import 'package:flutter/material.dart';

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({
    this.space = 8.0,
    Key key,
  }) : super(key: key);
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}

import 'package:flutter/material.dart';
import '../common/common.dart';
import '../constants/constant.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({
    @required this.icon,
    @required this.label,
    Key key,
  }) : super(key: key);

  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 20,
          height: 20,
        ),
        const HorizontalSpacer(space: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

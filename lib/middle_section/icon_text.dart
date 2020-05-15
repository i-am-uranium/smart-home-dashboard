import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/common/common.dart';
import 'package:smart_home_dashboard/constants/constant.dart';

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
        HorizontalSpacer(space: 4),
        Text(
          label,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

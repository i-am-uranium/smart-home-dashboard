import 'package:flutter/material.dart';
import '../constants/constant.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    @required this.child,
    this.borderRadius = 8.0,
    this.color = AppColors.containerFill,
    Key key,
  }) : super(key: key);
  final Widget child;
  final double borderRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        border: Border.all(
          width: 1,
          color: AppColors.containerBorder,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.containerShadowLeft,
            offset: Offset(-5, -5),
            blurRadius: 12,
          ),
          BoxShadow(
            color: AppColors.containerShadowLRight,
            offset: Offset(6, 6),
            blurRadius: 12,
          ),
          BoxShadow(
            color: AppColors.containerShadowLeft,
            blurRadius: 3,
          ),
        ],
      ),
      child: child,
    );
  }
}

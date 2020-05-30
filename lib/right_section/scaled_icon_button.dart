import 'package:flutter/material.dart';
import '../common/common.dart';
import '../constants/constant.dart';

class ScaledIconButton extends StatelessWidget {
  const ScaledIconButton({
    @required this.icon,
    this.scale = 2.0,
    this.onClick,
    Key key,
  }) : super(key: key);
  final double scale;
  final String icon;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Material(
        color: AppColors.containerFill,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
        ),
        child: HandCursor(
          child: IconButton(
            hoverColor: AppColors.buttonHover,
            onPressed: onClick,
            icon: Center(
              child: Transform.scale(
                scale: scale,
                child: Image.asset(
                  icon,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

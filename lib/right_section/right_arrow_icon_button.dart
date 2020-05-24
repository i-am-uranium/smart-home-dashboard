import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:smart_home_dashboard/common/common.dart';
import 'package:smart_home_dashboard/constants/constant.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    this.onClick,
    Key key,
  }) : super(key: key);
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ContentContainer(
        child: Material(
          color: AppColors.containerFill,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
          ),
          child: HandCursor(
            child: IconButton(
              hoverColor: AppColors.buttonHover,
              onPressed: onClick,
              icon: Center(
                child: Icon(
                  SimpleLineIcons.arrow_right,
                  size: 16,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

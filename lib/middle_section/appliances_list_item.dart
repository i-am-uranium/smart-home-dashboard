import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/common/common.dart';
import 'package:smart_home_dashboard/common/scaled_switch.dart';
import 'package:smart_home_dashboard/constants/constant.dart';

class AppliancesListItem extends StatelessWidget {
  const AppliancesListItem({
    @required this.name,
    @required this.activeIcon,
    @required this.inActiveIcon,
    @required this.selectedIcon,
    this.value = true,
    this.selected = false,
    this.onStateChange,
    this.onSelected,
    Key key,
  }) : super(key: key);

  final String name;
  final String activeIcon;
  final String inActiveIcon;
  final String selectedIcon;
  final bool selected;
  final bool value;
  final Function(bool) onStateChange;
  final Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return _build;
  }

  Widget get _build {
    return ContentContainer(
      borderRadius: 20,
      child: Container(
        width: 140,
        height: 56,
        child: HandCursor(
          child: Material(
            color: selected
                ? AppColors.switchContainerColor
                : AppColors.containerFill,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
            ),
            child: InkWell(
              onTap: onSelected,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          value ? 'ON' : 'OFF',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ScaledSwitch(
                        value: value,
                        activeColor: selected
                            ? AppColors.onSwitchContainerSelectedColor
                            : AppColors.switchActiveColor,
                        trackColor: AppColors.switchTrackColor,
                        onChanged: onStateChange,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Image.asset(
                      selected
                          ? selectedIcon
                          : (value ? activeIcon : inActiveIcon),
                      height: 30,
                      width: 16,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      top: 16,
                      bottom: 16,
                    ),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.54,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

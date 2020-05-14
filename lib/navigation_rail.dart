import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/dimens.dart';
import 'package:smart_home_dashboard/hand_cursor_widget.dart';

import 'app_colors.dart';
import 'assets.dart';
import 'vertical_spacer.dart';

class MainNavigationRail extends StatefulWidget {
  MainNavigationRail({Key key}) : super(key: key);

  @override
  _MainNavigationRailState createState() => _MainNavigationRailState();
}

class _MainNavigationRailState extends State<MainNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: Dimens.logoTopPosition,
          left: Dimens.logoLeftPosition,
          child: const LogoWidget(),
        ),
        Positioned(
          top: Dimens.navigationRailTopPosition,
          left: Dimens.navigationRailLeftPosition,
          child: Container(
            height: MediaQuery.of(context).size.height -
                Dimens.navigationRailTopPosition,
            width: 100,
            decoration: BoxDecoration(
              color: AppColors.containerFill,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.0),
              ),
              border: Border.all(
                width: 1,
                color: AppColors.containerBorder,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.containerShadowLeft,
                  offset: Offset(-5, -5),
                  blurRadius: 12,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: AppColors.containerShadowLRight,
                  offset: Offset(6, 6),
                  blurRadius: 12,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: AppColors.containerShadowLeft,
                  offset: Offset(0, 0),
                  blurRadius: 3,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 40,
              ),
              child: ListView(
                children: [
                  NavigationDestination(
                    iconPath: Assets.homePng,
                    isActive: true,
                  ),
                  VerticalSpacer(),
                  NavigationDestination(
                    iconPath: Assets.lampPng,
                    isActive: false,
                  ),
                  VerticalSpacer(),
                  NavigationDestination(
                    iconPath: Assets.securityPng,
                    isActive: false,
                  ),
                  VerticalSpacer(),
                  NavigationDestination(
                    iconPath: Assets.locationPng,
                    isActive: false,
                  ),
                  VerticalSpacer(),
                  NavigationDestination(
                    iconPath: Assets.usersPng,
                    isActive: false,
                  ),
                  VerticalSpacer(),
                  NavigationDestination(
                    iconPath: Assets.chartPng,
                    isActive: false,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 24,
          bottom: 36,
          child: NavigationDestination(
            iconPath: Assets.logoutPng,
          ),
        )
      ],
    );
  }
}

class NavigationDestination extends StatelessWidget {
  const NavigationDestination({
    @required this.iconPath,
    this.isActive = false,
    this.tooltip,
    Key key,
  }) : super(key: key);

  final String iconPath;
  final String tooltip;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          visible: isActive,
          child: VerticalLine(),
        ),
        HandCursor(
          child: Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Container(
              width: 48,
              height: 48,
              child: IconButton(
                hoverColor: AppColors.buttonHover,
                onPressed: () {
                  print('home button pressed');
                },
                icon: Image.asset(
                  iconPath,
                  width: Dimens.navigationRailIconWidth,
                  height: Dimens.navigationRailIconHeight,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 4,
        ),
      ],
    );
  }
}

class VerticalLine extends StatelessWidget {
  const VerticalLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: 48,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.activeLineGradients,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.logoPng,
      width: Dimens.logoWidth,
      height: Dimens.logoHeight,
    );
  }
}

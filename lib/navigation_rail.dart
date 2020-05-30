import 'package:flutter/material.dart';

import 'common/common.dart';
import 'constants/constant.dart';
import 'model/navigation_destination.dart';
import 'strings.dart';

class MainNavigationRail extends StatefulWidget {
  const MainNavigationRail({
    @required this.destinations,
    this.onDestinationClick,
    this.onLogoutButtonClick,
    Key key,
  }) : super(key: key);

  final Function onLogoutButtonClick;
  final ValueChanged<int> onDestinationClick;
  final List<NavigationDestination> destinations;

  @override
  _MainNavigationRailState createState() => _MainNavigationRailState();
}

class _MainNavigationRailState extends State<MainNavigationRail> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: Dimens.logoTopPosition,
          left: Dimens.logoLeftPosition,
          child: LogoWidget(),
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
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
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
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
              ),
              child: ListView.builder(
                itemCount: widget.destinations.length,
                itemBuilder: (context, index) {
                  final destination = widget.destinations[index];
                  return NavigationItem(
                    navigationDestination: destination,
                    onClick: () => widget.onDestinationClick(index),
                  );
                },
              ),
            ),
          ),
        ),
        Positioned(
          left: 24,
          bottom: 36,
          child: LogoutButton(
            icon: Assets.logoutPng,
            onClick: widget.onLogoutButtonClick,
            tooltip: Strings.logout,
          ),
        )
      ],
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    @required this.icon,
    this.tooltip,
    this.onClick,
    Key key,
  }) : super(key: key);

  final String icon;
  final String tooltip;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return HandCursor(
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          width: 48,
          height: 48,
          child: IconButton(
            tooltip: tooltip,
            hoverColor: AppColors.buttonHover,
            onPressed: onClick,
            icon: Image.asset(
              icon,
              width: Dimens.navigationRailIconWidth,
              height: Dimens.navigationRailIconHeight,
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    @required this.navigationDestination,
    this.onClick,
    Key key,
  }) : super(key: key);
  final Function onClick;
  final NavigationDestination navigationDestination;

  Widget _getIcon(bool active) {
    if (active) {
      return Image.asset(
        navigationDestination.icon,
        width: Dimens.navigationRailIconWidth,
        height: Dimens.navigationRailIconHeight,
      );
    }
    return Image.asset(
      navigationDestination.icon,
      width: Dimens.navigationRailIconWidth,
      height: Dimens.navigationRailIconHeight,
      color: AppColors.navigationRailInActiveIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: navigationDestination.isActive,
              child: const VerticalLine(),
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
                    tooltip: navigationDestination.tooltip,
                    hoverColor: AppColors.buttonHover,
                    onPressed: onClick,
                    icon: _getIcon(navigationDestination.isActive),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
          ],
        ),
        const VerticalSpacer(),
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
      decoration: const BoxDecoration(
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

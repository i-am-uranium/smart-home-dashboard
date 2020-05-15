import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:smart_home_dashboard/common/common.dart';
import 'package:smart_home_dashboard/common/vertical_spacer.dart';
import 'package:smart_home_dashboard/constants/constant.dart';

import 'icon_text.dart';

class HomeSectionWidget extends StatefulWidget {
  const HomeSectionWidget({Key key}) : super(key: key);

  @override
  _HomeSectionWidgetState createState() => _HomeSectionWidgetState();
}

class _HomeSectionWidgetState extends State<HomeSectionWidget> {
  String currentRoom = 'Living Room';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .6 - 100,
      height: 200,
      child: Column(
        children: [
          _selectRoomWidget,
          VerticalSpacer(space: 16),
          Expanded(
            child: _electronicAppliances,
          ),
        ],
      ),
    );
  }

  bool _isRefrigeratorOn = true;
  bool _isAcOn = true;
  bool _isTemperatureOn = false;
  bool _areLightsOn = false;

  bool _isRefrigeratorSelected = false;
  bool _isAcSelected = false;
  bool _isTemperatureSelected = false;
  bool _isAllLightsSelected = false;

  Widget _appliance({
    @required String applianceName,
    @required String activeIcon,
    @required String inActiveIcon,
    @required String selectedIcon,
    bool selected = false,
    bool value = true,
    Function(bool) onStateChange,
    Function() onSelected,
  }) {
    return ContentContainer(
      borderRadius: 20,
      color: AppColors.containerFill,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      Transform.scale(
                        scale: 0.5,
                        child: CupertinoSwitch(
                          value: value,
                          activeColor: selected
                              ? AppColors.onSwitchContainerSelectedColor
                              : AppColors.switchActiveColor,
                          trackColor: AppColors.switchTrackColor,
                          onChanged: onStateChange,
                        ),
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
                      applianceName,
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

  Widget get _electronicAppliances {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _appliance(
          applianceName: 'Refrigerator',
          activeIcon: Assets.refrigeratorActivePng,
          inActiveIcon: Assets.refrigeratorInActivePng,
          selectedIcon: Assets.refrigeratorSelectedPng,
          value: _isRefrigeratorOn,
          selected: _isRefrigeratorSelected,
          onStateChange: (value) => setState(() => _isRefrigeratorOn = value),
          onSelected: () {
            setState(() {
              _isRefrigeratorSelected = true;
              _isAcSelected = false;
              _isTemperatureSelected = false;
              _isAllLightsSelected = false;
            });
          },
        ),
        HorizontalSpacer(space: 32),
        _appliance(
          applianceName: 'Temperature',
          activeIcon: Assets.flashActivePng,
          inActiveIcon: Assets.flashInActivePng,
          selectedIcon: Assets.flashSelectedPng,
          value: _isTemperatureOn,
          selected: _isTemperatureSelected,
          onStateChange: (value) => setState(() => _isTemperatureOn = value),
          onSelected: () {
            setState(() {
              _isRefrigeratorSelected = false;
              _isAcSelected = false;
              _isTemperatureSelected = true;
              _isAllLightsSelected = false;
            });
          },
        ),
        HorizontalSpacer(space: 32),
        _appliance(
          applianceName: 'Air Conditioner',
          activeIcon: Assets.acActivePng,
          inActiveIcon: Assets.acInActivePng,
          selectedIcon: Assets.acSelectedPng,
          value: _isAcOn,
          selected: _isAcSelected,
          onStateChange: (value) => setState(() => _isAcOn = value),
          onSelected: () {
            setState(() {
              _isRefrigeratorSelected = false;
              _isAcSelected = true;
              _isTemperatureSelected = false;
              _isAllLightsSelected = false;
            });
          },
        ),
        HorizontalSpacer(space: 32),
        _appliance(
          activeIcon: Assets.allLightsActivePng,
          inActiveIcon: Assets.allLightsInActivePng,
          selectedIcon: Assets.allLightsSelectedPng,
          applianceName: 'Lights',
          value: _areLightsOn,
          selected: _isAllLightsSelected,
          onStateChange: (value) => setState(() => _areLightsOn = value),
          onSelected: () {
            setState(() {
              _isRefrigeratorSelected = false;
              _isAcSelected = false;
              _isTemperatureSelected = false;
              _isAllLightsSelected = true;
            });
          },
        ),
      ],
    );
  }

  Widget get _selectRoomWidget {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Scarlett\'s Home',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.normal,
              letterSpacing: 1.54,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconWithText(
                icon: Assets.dropPng,
                label: '35%',
              ),
              HorizontalSpacer(space: 16),
              IconWithText(
                icon: Assets.thermometerPng,
                label: '+25${'\u2103'}',
              ),
              HorizontalSpacer(space: 16),
              ContentContainer(
                borderRadius: 8.0,
                child: Container(
                  width: 150,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  padding: EdgeInsets.only(left: 16, right: 8),
                  child: HandCursor(
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      icon: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Icon(
                          FontAwesome.chevron_down,
                          color: AppColors.white,
                          size: 16,
                        ),
                      ),
                      elevation: 16,
                      dropdownColor: AppColors.containerFill,
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                      value: currentRoom,
                      items: [
                        DropdownMenuItem(
                          value: 'Bedroom',
                          child: HandCursor(
                            child: Text(
                              'Bedroom',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Kitchen',
                          child: HandCursor(
                            child: Text('Kitchen'),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Living Room',
                          child: HandCursor(
                            child: Text('Living Room'),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() => currentRoom = value);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:smart_home_dashboard/common/common.dart';
import 'package:smart_home_dashboard/common/vertical_spacer.dart';
import 'package:smart_home_dashboard/constants/constant.dart';
import 'package:smart_home_dashboard/middle_section/appliance.dart';
import 'package:smart_home_dashboard/middle_section/appliances_list.dart';
import 'package:smart_home_dashboard/middle_section/selected_item.dart';

import 'icon_text.dart';

class HomeSectionWidget extends StatefulWidget {
  const HomeSectionWidget({Key key}) : super(key: key);

  @override
  _HomeSectionWidgetState createState() => _HomeSectionWidgetState();
}

class _HomeSectionWidgetState extends State<HomeSectionWidget> {
  String currentRoom = 'Living Room';

  static final List<Appliance> appliances = []
    ..add(
      Appliance(
        1,
        name: 'Refrigerator',
        activeIcon: Assets.refrigeratorActivePng,
        inActiveIcon: Assets.refrigeratorInActivePng,
        selectedIcon: Assets.refrigeratorSelectedPng,
        isActive: true,
        selected: true,
      ),
    )
    ..add(
      Appliance(
        2,
        name: 'Temperature',
        activeIcon: Assets.flashActivePng,
        inActiveIcon: Assets.flashInActivePng,
        selectedIcon: Assets.flashSelectedPng,
        isActive: false,
        selected: false,
      ),
    )
    ..add(
      Appliance(
        3,
        name: 'Air Conditioner',
        activeIcon: Assets.acActivePng,
        inActiveIcon: Assets.acInActivePng,
        selectedIcon: Assets.acSelectedPng,
        isActive: false,
        selected: false,
      ),
    )
    ..add(
      Appliance(
        4,
        name: 'Lights',
        activeIcon: Assets.allLightsActivePng,
        inActiveIcon: Assets.allLightsInActivePng,
        selectedIcon: Assets.allLightsSelectedPng,
        isActive: false,
        selected: false,
      ),
    );
  Appliance sleetedAppliance = appliances.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .6 - 100,
      height: MediaQuery.of(context).size.height - 296,
      child: Column(
        children: [
          _selectRoomWidget,
          VerticalSpacer(space: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6 - 100,
            height: 117,
            child: _electronicAppliances,
          ),
          VerticalSpacer(
            space: 16,
          ),
          SelectedItem(
            icon: sleetedAppliance.selectedIcon,
            title: sleetedAppliance.name,
            itemOn: sleetedAppliance.isActive,
            onItemStateChange: (value) =>
                setState(() => sleetedAppliance.isActive = value),
          ),
        ],
      ),
    );
  }

  Widget get _electronicAppliances {
    return AppliancesList(
      appliances: appliances,
      onSelect: (appliance) {
        setState(() {
          appliances.forEach((element) {
            if (appliance.id == element.id) {
              appliance.selected = true;
            } else {
              element.selected = false;
            }
          });
          sleetedAppliance = appliance;
        });
      },
      onApplianceStateChange: (appliance, state) {
        int id = appliance.id;
        final Appliance stateChangedAppliances =
            appliances.firstWhere((element) => element.id == id);
        setState(() {
          stateChangedAppliances.isActive = state;
        });
      },
    );
  }

  Widget get _selectRoomWidget {
    return Row(
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
    );
  }
}

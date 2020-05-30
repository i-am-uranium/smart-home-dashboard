import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../common/common.dart';
import '../common/vertical_spacer.dart';
import '../constants/constant.dart';
import 'appliance.dart';
import 'appliances_list.dart';
import 'icon_text.dart';
import 'selected_item.dart';

class HomeSectionWidget extends StatefulWidget {
  const HomeSectionWidget({Key key}) : super(key: key);

  @override
  _HomeSectionWidgetState createState() => _HomeSectionWidgetState();
}

class _HomeSectionWidgetState extends State<HomeSectionWidget> {
  String currentRoom = 'Living Room';

  static final List<Appliance> appliances = [
    Appliance(
      1,
      name: 'Refrigerator',
      activeIcon: Assets.refrigeratorActivePng,
      inActiveIcon: Assets.refrigeratorInActivePng,
      selectedIcon: Assets.refrigeratorSelectedPng,
      isActive: true,
      selected: true,
    ),
    Appliance(
      2,
      name: 'Temperature',
      activeIcon: Assets.flashActivePng,
      inActiveIcon: Assets.flashInActivePng,
      selectedIcon: Assets.flashSelectedPng,
      isActive: false,
      selected: false,
    ),
    Appliance(
      3,
      name: 'Air Conditioner',
      activeIcon: Assets.acActivePng,
      inActiveIcon: Assets.acInActivePng,
      selectedIcon: Assets.acSelectedPng,
      isActive: false,
      selected: false,
    ),
    Appliance(
      4,
      name: 'Lights',
      activeIcon: Assets.allLightsActivePng,
      inActiveIcon: Assets.allLightsInActivePng,
      selectedIcon: Assets.allLightsSelectedPng,
      isActive: false,
      selected: false,
    )
  ];
  Appliance sleetedAppliance = appliances.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .6 - 100,
      height: MediaQuery.of(context).size.height - 296,
      child: Column(
        children: [
          _selectRoomWidget,
          const VerticalSpacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6 - 100,
            height: 117,
            child: _electronicAppliances,
          ),
          const VerticalSpacer(),
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
        final int id = appliance.id;
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
        const Text(
          "Scarlett's Home",
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
            const IconWithText(
              icon: Assets.dropPng,
              label: '35%',
            ),
            const HorizontalSpacer(space: 16),
            const IconWithText(
              icon: Assets.thermometerPng,
              label: '+25${'\u2103'}',
            ),
            const HorizontalSpacer(space: 16),
            ContentContainer(
              borderRadius: 8,
              child: Container(
                width: 150,
                height: 36,
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: HandCursor(
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    icon: const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(
                        SimpleLineIcons.arrow_down,
                        color: AppColors.white,
                        size: 16,
                      ),
                    ),
                    elevation: 16,
                    dropdownColor: AppColors.containerFill,
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                    value: currentRoom,
                    items: [
                      DropdownMenuItem(
                        value: 'Bedroom',
                        child: HandCursor(
                          child: const Text(
                            'Bedroom',
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Kitchen',
                        child: HandCursor(
                          child: const Text('Kitchen'),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Living Room',
                        child: HandCursor(
                          child: const Text('Living Room'),
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

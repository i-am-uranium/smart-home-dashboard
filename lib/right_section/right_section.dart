import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../common/common.dart';
import '../constants/constant.dart';
import '../model/device.dart';
import '../model/profile.dart';
import 'device_filter.dart';
import 'device_list.dart';
import 'power_consumption_graph.dart';
import 'profile.dart';
import 'profile_drop_down.dart';
import 'right_arrow_icon_button.dart';
import 'scaled_icon_button.dart';

class RightSection extends StatefulWidget {
  const RightSection({Key key}) : super(key: key);

  @override
  _RightSectionState createState() => _RightSectionState();
}

class _RightSectionState extends State<RightSection> {
  String initialDeviceFilter = 'ON';
  List<Device> devices = [];
  List<Profile> profiles = [];

  @override
  void initState() {
    super.initState();
    profiles = Profile.list;
    devices = Device.list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                  ),
                  child: ScaledIconButton(
                    scale: 1,
                    icon: Assets.settingsPng,
                    onClick: () {
                      print('Setting button clicked');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: ScaledIconButton(
                    icon: Assets.activeNotificationsPng,
                    onClick: () {
                      print('Notification button clicked');
                    },
                  ),
                ),
              ],
            ),
            SelectProfileWidget(
              profiles: profiles,
              onProfileChange: (profileId) {
                print('Profile selected: $profileId');
                setState(() {
                  profiles.forEach((profile) {
                    if (profile.id == profileId) {
                      profile.selected = true;
                    } else {
                      profile.selected = false;
                    }
                  });
                });
              },
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width * .4,
          height: MediaQuery.of(context).size.height - 80,
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
          decoration: BoxDecoration(
            color: AppColors.rightSectionFill,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              _devicesSection,
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: DeviceListWidget(
                  devices: devices,
                  onDeviceStateChange: (value, index) {
                    setState(() {
                      devices[index].isActive = value;
                    });
                  },
                ),
              ),
              const VerticalSpacer(space: 8),
              _membersSections,
              const VerticalSpacer(space: 8),
              ProfileListWidget(
                profiles: profiles,
                onProfileSelect: (profile) {
                  print('Profile Selected: ${profile.firstName}');
                },
              ),
              const VerticalSpacer(space: 8),
              _powerCConsumptionsSection,
              const VerticalSpacer(space: 8),
              PowerConsumptionGraph(
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.height - 586,
              ),
              const VerticalSpacer(),
            ],
          ),
        ),
      ],
    );
  }

  Widget get _membersSections {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Members',
          style: TextStyle(
            fontSize: 22,
            color: AppColors.white,
          ),
        ),
        CustomIconButton(
          onClick: () => print('Members right arrow button clicked.'),
        ),
      ],
    );
  }

  Widget get _powerCConsumptionsSection {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Power Consumed',
          style: TextStyle(
            fontSize: 22,
            color: AppColors.white,
          ),
        ),
        Row(
          children: [
            ContentContainer(
              child: Container(
                width: 120,
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
                        size: 12,
                      ),
                    ),
                    elevation: 16,
                    dropdownColor: AppColors.containerFill,
                    style: const TextStyle(
                      color: AppColors.white,
                    ),
                    value: 'Month',
                    items: ['Month', 'Week']
                        .map(
                          (value) => DropdownMenuItem(
                            value: value,
                            child: HandCursor(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8,
                                    ),
                                    child: Image.asset(
                                      Assets.calenderPng,
                                      width: 16,
                                      height: 16,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Text(
                                    value,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      letterSpacing: .13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      print('Power consumed section drop down clicked: $value');
                    },
                  ),
                ),
              ),
            ),
            const HorizontalSpacer(
              space: 16,
            ),
            CustomIconButton(
              onClick: () =>
                  print('Power consumed right arrow button clicked.'),
            ),
          ],
        ),
      ],
    );
  }

  Widget get _devicesSection {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'My Devices',
          style: TextStyle(
            fontSize: 22,
            color: AppColors.white,
          ),
        ),
        Row(
          children: [
            DeviceFilter(
              filters: const ['ON', 'OFF'],
              initValue: initialDeviceFilter,
              onChange: (value) {
                print('Device filter state change to: $value');
                setState(() => initialDeviceFilter = value);
              },
            ),
            const HorizontalSpacer(
              space: 24,
            ),
            CustomIconButton(
              onClick: () => print('My Devices right arrow button clicked.'),
            ),
          ],
        ),
      ],
    );
  }
}

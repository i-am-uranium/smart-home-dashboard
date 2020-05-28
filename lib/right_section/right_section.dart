import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:smart_home_dashboard/common/common.dart';
import 'package:smart_home_dashboard/constants/constant.dart';
import 'package:smart_home_dashboard/model/device.dart';
import 'package:smart_home_dashboard/model/profile.dart';
import 'package:smart_home_dashboard/right_section/profile.dart';

import 'device_filter.dart';
import 'device_list.dart';
import 'power_consumption_graph.dart';
import 'profile_drop_down.dart';
import 'right_arrow_icon_button.dart';
import 'scaled_icon_button.dart';

class RightSection extends StatefulWidget {
  RightSection({Key key}) : super(key: key);

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
                  padding: EdgeInsets.only(
                    left: 32,
                  ),
                  child: ScaledIconButton(
                    scale: 1.0,
                    icon: Assets.settingsPng,
                    onClick: () {
                      print('Setting button clicked');
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32),
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
          margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.only(top: 16, left: 32, right: 32),
          decoration: BoxDecoration(
            color: AppColors.rightSectionFill,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              _devicesSection,
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: DeviceListWidget(
                  devices: devices,
                  onDeviceStateChange: (value, index) {
                    setState(() {
                      devices[index].isActive = value;
                    });
                  },
                ),
              ),
              VerticalSpacer(space: 8),
              _membersSections,
              VerticalSpacer(space: 8),
              ProfileListWidget(
                profiles: profiles,
                onProfileSelect: (profile) {
                  print('Profile Selected: ${profile.firstName}');
                },
              ),
              VerticalSpacer(space: 8),
              _powerCConsumptionsSection,
              VerticalSpacer(space: 8),
              PowerConsumptionGraph(
                width: MediaQuery.of(context).size.width * .4,
                height: MediaQuery.of(context).size.height - 586,
              ),
              VerticalSpacer(space: 16),
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
        Text(
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
        Text(
          'Power Consumed',
          style: TextStyle(
            fontSize: 22,
            color: AppColors.white,
          ),
        ),
        CustomIconButton(
          onClick: () => print('Power consumed right arrow button clicked.'),
        ),
      ],
    );
  }

  Widget get _devicesSection {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Devices',
          style: TextStyle(
            fontSize: 22,
            color: AppColors.white,
          ),
        ),
        Row(
          children: [
            DeviceFilter(
              filters: ['ON', 'OFF'],
              initValue: initialDeviceFilter,
              onChange: (value) {
                print('Device filter state change to: $value');
                setState(() => initialDeviceFilter = value);
              },
            ),
            HorizontalSpacer(
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

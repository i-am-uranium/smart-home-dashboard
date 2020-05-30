import 'package:flutter/material.dart';

import '../common/common.dart';
import '../common/custom_switch.dart' as cs;
import '../constants/constant.dart';
import '../model/device.dart';

class DeviceCard extends StatefulWidget {
  const DeviceCard({
    @required this.device,
    this.onDeviceActiveStateChange,
    Key key,
  }) : super(key: key);

  final Device device;
  final ValueChanged<bool> onDeviceActiveStateChange;

  @override
  _DeviceCardState createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: widget.device.linearGradient,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Image.asset(
                  widget.device.icon,
                  color: AppColors.white,
                  height: 28,
                  width: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 16),
                child: Row(
                  children: [
                    Text(
                      widget.device.isActive ? 'ON' : 'OFF',
                      style: const TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                    const HorizontalSpacer(),
                    cs.Switch(
                      value: widget.device.isActive,
                      activeTrackColor: AppColors.white,
                      inActiveTrackColor: AppColors.white,
                      indicatorActiveColor:
                          widget.device.linearGradient.colors.last,
                      indicatorInActiveColor: AppColors.grey,
                      onChanged: widget.onDeviceActiveStateChange,
                    )
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Text(
              widget.device.name,
              style: const TextStyle(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

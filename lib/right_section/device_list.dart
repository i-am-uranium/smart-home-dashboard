import 'package:flutter/material.dart';
import '../model/device.dart';

import 'device_card.dart';

class DeviceListWidget extends StatefulWidget {
  const DeviceListWidget({
    @required this.devices,
    this.onDeviceStateChange,
    Key key,
  }) : super(key: key);
  final List<Device> devices;

  final Function(bool, int) onDeviceStateChange;

  @override
  _DeviceListWidgetState createState() => _DeviceListWidgetState();
}

class _DeviceListWidgetState extends State<DeviceListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.devices.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 170 / 320,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('on Device click');
            },
            child: DeviceCard(
              device: widget.devices[index],
              onDeviceActiveStateChange: (value) =>
                  widget.onDeviceStateChange(value, index),
            ),
          );
        },
      ),
    );
  }
}

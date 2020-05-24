import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/constants/constant.dart';

class Device {
  final int id;
  final String name;
  bool isActive;
  final LinearGradient linearGradient;
  final String icon;

  Device({
    @required this.id,
    @required this.name,
    @required this.isActive,
    @required this.linearGradient,
    @required this.icon,
  });

  static List<Device> _devices = [];
  static List<Device> get list => _devices
    ..add(
      Device(
        id: 1,
        name: 'Refrigerator',
        isActive: false,
        icon: Assets.refrigeratorPng,
        linearGradient: LinearGradient(
          colors: [
            AppColors.refrigeratorDeviceContainer,
            AppColors.refrigeratorDeviceContainer,
          ],
          stops: [0.0, 1.0],
        ),
      ),
    )
    ..add(
      Device(
        id: 2,
        name: 'Music',
        isActive: false,
        icon: Assets.musicPng,
        linearGradient: LinearGradient(
          colors: AppColors.musicDeviceContainerGradient,
          stops: [0.0, 0.2, 0.4],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    )
    ..add(
      Device(
        id: 3,
        name: 'Router',
        isActive: false,
        icon: Assets.routerPng,
        linearGradient: LinearGradient(
          colors: AppColors.routerDeviceContainerGradient,
          stops: [0.0, 0.1, 0.4],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    )
    ..add(
      Device(
        id: 4,
        name: 'Lamps',
        isActive: false,
        icon: Assets.lampPng,
        linearGradient: LinearGradient(
          colors: AppColors.lampDeviceContainerGradient,
          stops: [0.0, 0.2, 0.4],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
}

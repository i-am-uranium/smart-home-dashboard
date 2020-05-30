import 'package:flutter/material.dart';
import '../constants/constant.dart';

class Device {
  Device({
    @required this.id,
    @required this.name,
    @required this.isActive,
    @required this.linearGradient,
    @required this.icon,
  });

  final int id;
  final String name;
  bool isActive;
  final LinearGradient linearGradient;
  final String icon;

  static final List<Device> _devices = [];
  static List<Device> get list => _devices
    ..add(
      Device(
        id: 1,
        name: 'Refrigerator',
        isActive: false,
        icon: Assets.refrigeratorPng,
        linearGradient: const LinearGradient(
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
        linearGradient: const LinearGradient(
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
        linearGradient: const LinearGradient(
          colors: AppColors.routerDeviceContainerGradient,
          stops: [0.0, 0.1, 0.4],
        ),
      ),
    )
    ..add(
      Device(
        id: 4,
        name: 'Lamps',
        isActive: false,
        icon: Assets.lampPng,
        linearGradient: const LinearGradient(
          colors: AppColors.lampDeviceContainerGradient,
          stops: [0.0, 0.2, 0.4],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
}

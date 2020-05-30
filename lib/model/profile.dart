import 'package:flutter/material.dart';
import '../constants/constant.dart';

class Profile {
  Profile({
    @required this.id,
    @required this.firstName,
    @required this.role,
    @required this.avatar,
    this.lastName,
    this.selected = false,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String role;
  final String avatar;
  bool selected;

  String get fullName => '$firstName $lastName';

  static final List<Profile> _profiles = [];
  static List<Profile> get list => _profiles
    ..add(
      Profile(
        avatar: Assets.jasicaPng,
        id: 1,
        firstName: 'Jasica',
        lastName: 'Wingleton',
        role: 'Admin',
        selected: true,
      ),
    )
    ..add(
      Profile(
        avatar: Assets.nariyaPng,
        id: 2,
        firstName: 'Nariya',
        lastName: '',
        role: 'Full Access',
      ),
    )
    ..add(
      Profile(
        avatar: Assets.riyaPng,
        id: 3,
        firstName: 'Riya',
        lastName: '',
        role: 'Full Access',
      ),
    )
    ..add(
      Profile(
        avatar: Assets.dadPng,
        id: 4,
        firstName: 'Dad',
        lastName: '',
        role: 'Full Access',
      ),
    )
    ..add(
      Profile(
        avatar: Assets.momPng,
        id: 5,
        firstName: 'Mom',
        lastName: '',
        role: 'Full Access',
      ),
    );
}

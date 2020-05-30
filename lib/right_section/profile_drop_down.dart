import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../common/common.dart';
import '../constants/constant.dart';
import '../model/profile.dart';

class SelectProfileWidget extends StatelessWidget {
  const SelectProfileWidget({
    @required this.profiles,
    Key key,
    this.onProfileChange,
  }) : super(key: key);

  final List<Profile> profiles;

  final ValueChanged<int> onProfileChange;

  @override
  Widget build(BuildContext context) {
    final Profile selectedProfile =
        profiles.firstWhere((profile) => profile.selected);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Image.asset(
            selectedProfile.avatar,
            width: 40,
            height: 40,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: HandCursor(
            child: DropdownButton<int>(
              underline: const SizedBox(),
              icon: const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Icon(
                  SimpleLineIcons.arrow_down,
                  color: AppColors.profileName,
                  size: 16,
                ),
              ),
              elevation: 16,
              dropdownColor: AppColors.containerFill,
              style: const TextStyle(
                color: AppColors.white,
              ),
              value: selectedProfile.id,
              items: profiles
                  .map(
                    (profile) => DropdownMenuItem(
                      value: profile.id,
                      child: HandCursor(
                        child: Text(
                          profile.fullName,
                          style: const TextStyle(
                            color: AppColors.profileName,
                            letterSpacing: .15,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onProfileChange,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:smart_home_dashboard/common/common.dart';
import 'package:smart_home_dashboard/constants/constant.dart';
import 'package:smart_home_dashboard/model/profile.dart';

class SelectProfileWidget extends StatelessWidget {
  SelectProfileWidget({
    @required this.profiles,
    Key key,
    this.onProfileChange,
  }) : super(key: key);

  final List<Profile> profiles;

  final ValueChanged<int> onProfileChange;

  Widget build(BuildContext context) {
    Profile selectedProfile =
        profiles.firstWhere((profile) => profile.selected);
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 24),
          child: Image.asset(
            selectedProfile.avatar,
            width: 40,
            height: 40,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: HandCursor(
            child: DropdownButton<int>(
              underline: SizedBox(),
              icon: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Icon(
                  SimpleLineIcons.arrow_down,
                  color: AppColors.profileName,
                  size: 16,
                ),
              ),
              elevation: 16,
              dropdownColor: AppColors.containerFill,
              style: TextStyle(
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
                          style: TextStyle(
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

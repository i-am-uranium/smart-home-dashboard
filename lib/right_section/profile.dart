import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/common/common.dart';
import 'package:smart_home_dashboard/constants/constant.dart';
import 'package:smart_home_dashboard/model/profile.dart';

class ProfileListWidget extends StatelessWidget {
  const ProfileListWidget({
    @required this.profiles,
    this.onProfileSelect,
    Key key,
  })  : assert(profiles != null, 'Profiles cannot be null'),
        super(key: key);

  final List<Profile> profiles;
  final ValueChanged<Profile> onProfileSelect;

  Widget _avatar(String avatar) {
    return Image.asset(
      avatar,
      width: 40,
      height: 40,
      alignment: Alignment.center,
    );
  }

  Widget _name(String name) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.white,
        fontSize: 13,
        fontWeight: FontWeight.bold,
        letterSpacing: .13,
      ),
    );
  }

  Widget _role(String role) {
    return Text(
      role,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.roleTextColor,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: .11,
      ),
    );
  }

  Widget _listViewItem(BuildContext context, Profile profile, int index) {
    return HandCursor(
      child: SizedBox(
        width: (MediaQuery.of(context).size.width * .4 - 120) / 5,
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onProfileSelect(profiles[index]),
              hoverColor: AppColors.buttonHover,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 8, right: 8),
                    child: _avatar(profile.avatar),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: _name(profile.firstName),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 8),
                    child: _role(profile.role),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      borderRadius: 20,
      child: SizedBox(
        height: 108,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: profiles.length,
          itemBuilder: (context, index) =>
              _listViewItem(context, profiles[index], index),
        ),
      ),
    );
  }
}

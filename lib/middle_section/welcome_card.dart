import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/common/common.dart';
import 'package:smart_home_dashboard/constants/constant.dart';

class WelcomeCardWidget extends StatelessWidget {
  const WelcomeCardWidget({Key key}) : super(key: key);
// \u2109
  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      borderRadius: 16.0,
      child: Container(
        width: MediaQuery.of(context).size.width * .6 - 100,
        height: 220,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.welcomeBackground,
            ),
            fit: BoxFit.fitHeight,
            alignment: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 24,
            bottom: 24,
            left: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Jasica!',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.54,
                ),
              ),
              VerticalSpacer(
                space: 8,
              ),
              Text(
                'Welcome Home! The air quality is good & Fresh you can go out today',
                style: TextStyle(
                  color: AppColors.description,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  letterSpacing: .64,
                  height: 1.4,
                ),
              ),
              VerticalSpacer(
                space: 8,
              ),
              Row(
                children: [
                  Text(
                    '+25${'\u2103'}',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Image.asset(
                    Assets.cloudPng,
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
              VerticalSpacer(space: 4),
              Text(
                'Outdoor temperature',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.54,
                ),
              ),
              VerticalSpacer(space: 4),
              Text(
                'Fuzzy cloudy weather',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

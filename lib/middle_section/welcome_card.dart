import 'package:flutter/material.dart';
import '../common/common.dart';
import '../constants/constant.dart';

class WelcomeCardWidget extends StatelessWidget {
  const WelcomeCardWidget({Key key}) : super(key: key);
// \u2109
  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      borderRadius: 16,
      child: Container(
        width: MediaQuery.of(context).size.width * .6 - 100,
        height: 180,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.welcomeBackground,
            ),
            fit: BoxFit.fitHeight,
            alignment: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi Jasica!',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.54,
                ),
              ),
              const VerticalSpacer(
                space: 8,
              ),
              const Text(
                'Welcome Home! The air quality is good & Fresh you can go out today',
                style: TextStyle(
                  color: AppColors.description,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  letterSpacing: .64,
                  height: 1.4,
                ),
              ),
              const VerticalSpacer(
                space: 8,
              ),
              Row(
                children: [
                  const Text(
                    '+25${'\u2103'}',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
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
              const VerticalSpacer(space: 4),
              const Text(
                'Outdoor temperature',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.54,
                ),
              ),
              const VerticalSpacer(space: 4),
              const Text(
                'Fuzzy cloudy weather',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
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

import 'package:flutter/material.dart';

import 'common/common.dart';
import 'constants/app_colors.dart';
import 'constants/assets.dart';
import 'middle_section.dart';
import 'model/navigation_destination.dart';
import 'navigation_rail.dart';
import 'right_section/right_section.dart';
import 'strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartHome',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<NavigationDestination> destinations = [
    NavigationDestination(
      icon: Assets.homePng,
      isActive: true,
      tooltip: Strings.home,
    ),
    NavigationDestination(
      icon: Assets.lampPng,
      tooltip: Strings.lights,
    ),
    NavigationDestination(
      icon: Assets.securityPng,
      tooltip: Strings.security,
    ),
    NavigationDestination(
      icon: Assets.locationPng,
      tooltip: Strings.location,
    ),
    NavigationDestination(
      icon: Assets.usersPng,
      tooltip: Strings.users,
    ),
    NavigationDestination(
      icon: Assets.chartPng,
      tooltip: Strings.stats,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainFill,
      body: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 100,
            color: AppColors.mainFill,
            child: MainNavigationRail(
              destinations: destinations,
              onDestinationClick: (index) {
                print('Index $index pressed');
              },
              onLogoutButtonClick: () {
                print('On logout click');
              },
            ),
          ),
          const HorizontalSpacer(
            space: 32,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .6 - 100,
            color: AppColors.mainFill,
            padding: const EdgeInsets.only(top: 16),
            child: const MiddleSection(),
          ),
          Container(
            color: AppColors.mainFill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .4 - 32,
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: const RightSection(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/common/common.dart';

import 'package:smart_home_dashboard/constants/app_colors.dart';

import 'middle_section.dart';
import 'navigation_rail.dart';
import 'right_section/right_section.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            child: MainNavigationRail(),
          ),
          HorizontalSpacer(
            space: 32.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .6 - 100,
            color: AppColors.mainFill,
            padding: EdgeInsets.only(top: 16),
            child: MiddleSection(),
          ),
          Container(
            color: AppColors.mainFill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .4 - 32,
            padding: EdgeInsets.only(top: 16, left: 16),
            child: RightSection(),
          ),
        ],
      ),
    );
  }
}

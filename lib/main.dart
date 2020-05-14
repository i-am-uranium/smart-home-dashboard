import 'package:flutter/material.dart';
import 'package:smart_home_dashboard/app_colors.dart';

import 'middle_sectioin.dart';
import 'navigation_rail.dart';

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
      backgroundColor: AppColors.containerFill,
      body: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: 100,
            child: MainNavigationRail(),
          ),
          HorizontalSpacer(
            space: 32.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .6 - 100,
            padding: EdgeInsets.only(
              top: 16,
            ),
            child: MiddleSection(),
          ),
        ],
      ),
    );
  }
}

class HorizontalSpacer extends StatelessWidget {
  const HorizontalSpacer({
    this.space = 16.0,
    Key key,
  }) : super(key: key);

  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}

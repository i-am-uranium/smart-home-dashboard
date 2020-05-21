import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:smart_home_dashboard/common/common.dart';
import 'package:smart_home_dashboard/common/scaled_switch.dart';
import 'package:smart_home_dashboard/constants/constant.dart';

import 'appliance_controller.dart';

class SelectedItem extends StatefulWidget {
  final String icon;
  final String title;
  final bool itemOn;
  final ValueChanged<bool> onItemStateChange;

  SelectedItem({
    @required this.icon,
    @required this.title,
    @required this.itemOn,
    @required this.onItemStateChange,
    Key key,
  }) : super(key: key);

  @override
  _SelectedItemState createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {
  static const double kInitialAngle = 2 * math.pi / 40;
  double swapAngle = 10 * kInitialAngle;
  final double speed = 1.0;

  final List<Color> linearGradientColors = [
    Color(0xFF889BFF),
    Color(0xFF7DAEFF),
    Color(0xFF75BCFF),
    Color(0xFF65D6FF),
    Color(0xFF9586FF),
    Color(0xFF9F75FF),
    Color(0xFFB85BE6),
    Color(0xFFD35A9E),
    Color(0xFFE25A76),
    Color(0xFFF55945),
  ];

  final stops = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      borderRadius: 16,
      child: Container(
        width: MediaQuery.of(context).size.width * .6 - 100,
        height: MediaQuery.of(context).size.height - 486,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColors.switchContainerColor,
                        ),
                        child: Image.asset(
                          widget.icon,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      HorizontalSpacer(
                        space: 12,
                      ),
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          letterSpacing: .57,
                        ),
                      ),
                    ],
                  ),
                  ScaledSwitch(
                    value: widget.itemOn,
                    activeColor: AppColors.switchActiveColor,
                    trackColor: AppColors.switchTrackColor,
                    onChanged: widget.onItemStateChange,
                  ),
                ],
              ),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width * .6 - 100) / 2,
              top: (MediaQuery.of(context).size.height - 454) / 2,
              child: CustomPaint(
                size: Size(500, 500),
                painter: ApplianceControllerPainter(
                  swapAngle: swapAngle,
                  linearGradientColors: linearGradientColors,
                  stops: stops,
                ),
              ),
            ),
            Positioned(
              left: 70,
              bottom: (MediaQuery.of(context).size.height - 486) / 2 - 24,
              child: ContentContainer(
                child: Material(
                  color: AppColors.containerFill,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: HandCursor(
                    child: IconButton(
                      hoverColor: AppColors.buttonHover,
                      onPressed: () {
                        setState(() {
                          if (swapAngle > kInitialAngle) {
                            linearGradientColors.shuffle(math.Random());
                            swapAngle -= kInitialAngle;
                          }
                        });
                      },
                      icon: Center(
                        child: Icon(
                          FontAwesome.minus,
                          color: AppColors.switchTrackColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 70,
              bottom: (MediaQuery.of(context).size.height - 486) / 2 - 24,
              child: ContentContainer(
                child: Material(
                  color: AppColors.switchContainerColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: HandCursor(
                    child: IconButton(
                      hoverColor: AppColors.buttonHover,
                      onPressed: () {
                        setState(() {
                          if (swapAngle <= 2 * math.pi - kInitialAngle) {
                            linearGradientColors.shuffle(math.Random());
                            swapAngle += kInitialAngle;
                          }
                        });
                      },
                      icon: Center(
                        child: Icon(
                          FontAwesome.plus,
                          color: AppColors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

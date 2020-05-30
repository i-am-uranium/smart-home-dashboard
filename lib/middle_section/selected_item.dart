import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../common/common.dart';
import '../common/custom_switch.dart' as cs;
import '../constants/constant.dart';
import 'appliance_controller.dart';

class SelectedItem extends StatefulWidget {
  const SelectedItem({
    @required this.icon,
    @required this.title,
    @required this.itemOn,
    @required this.onItemStateChange,
    Key key,
  }) : super(key: key);

  final String icon;
  final String title;
  final bool itemOn;
  final ValueChanged<bool> onItemStateChange;

  @override
  _SelectedItemState createState() => _SelectedItemState();
}

class _SelectedItemState extends State<SelectedItem> {
  static const double kInitialAngle = 2 * math.pi / 40;
  double swapAngle = 10 * kInitialAngle;
  final double speed = 1;

  final List<Color> applianceControllerLinearGradientColors = [
    const Color(0xFF889BFF),
    const Color(0xFF7DAEFF),
    const Color(0xFF75BCFF),
    const Color(0xFF65D6FF),
    const Color(0xFF9586FF),
    const Color(0xFF9F75FF),
    const Color(0xFFB85BE6),
    const Color(0xFFD35A9E),
    const Color(0xFFE25A76),
    const Color(0xFFF55945),
  ];

  final List<double> stops = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];

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
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColors.switchContainer,
                        ),
                        child: Image.asset(
                          widget.icon,
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const HorizontalSpacer(
                        space: 12,
                      ),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          letterSpacing: .57,
                        ),
                      ),
                    ],
                  ),
                  cs.Switch(
                    value: widget.itemOn,
                    activeTrackColor: AppColors.white,
                    inActiveTrackColor: AppColors.white,
                    indicatorActiveColor:
                        AppColors.selectedSwitchIndicatorActive,
                    indicatorInActiveColor: AppColors.grey,
                    onChanged: widget.onItemStateChange,
                  ),
                ],
              ),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width * .6 - 100) / 2,
              top: (MediaQuery.of(context).size.height - 454) / 2,
              child: CustomPaint(
                size: const Size(500, 500),
                painter: ApplianceControllerPainter(
                  swapAngle: swapAngle,
                  linearGradientColors: applianceControllerLinearGradientColors,
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
                      8,
                    ),
                  ),
                  child: HandCursor(
                    child: IconButton(
                      hoverColor: AppColors.buttonHover,
                      onPressed: () {
                        setState(() {
                          if (swapAngle > kInitialAngle) {
                            applianceControllerLinearGradientColors
                                .shuffle(math.Random());
                            swapAngle -= kInitialAngle;
                          }
                        });
                      },
                      icon: const Center(
                        child: Icon(
                          FontAwesome.minus,
                          color: AppColors.switchTrack,
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
                  color: AppColors.switchContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: HandCursor(
                    child: IconButton(
                      hoverColor: AppColors.buttonHover,
                      onPressed: () {
                        setState(() {
                          if (swapAngle <= 2 * math.pi - kInitialAngle) {
                            applianceControllerLinearGradientColors
                                .shuffle(math.Random());
                            swapAngle += kInitialAngle;
                          }
                        });
                      },
                      icon: const Center(
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

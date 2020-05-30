import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class CustomSwitchButton extends StatefulWidget {
  const CustomSwitchButton({
    @required this.activeTrackColor,
    @required this.value,
    @required this.indicatorActiveColor,
    @required this.indicatorInActiveColor,
    @required this.animationDuration,
    @required this.inActiveTrackColor,
    this.width = 32.0,
    this.onChanged,
    this.indicatorPadding = const EdgeInsets.all(1),
  })  : assert(animationDuration != null, 'Animation duration cannot be null'),
        assert(indicatorInActiveColor != null,
            'indicatorInActiveColor cannot be null'),
        assert(activeTrackColor != null, 'activeTrackColor cannot be null'),
        assert(indicatorActiveColor != null,
            'indicatorActiveColor cannot be null'),
        assert(value != null, 'value cannot be null');

  final bool value;
  final Color indicatorActiveColor;
  final Color indicatorInActiveColor;
  final Color activeTrackColor;
  final Color inActiveTrackColor;
  final double width;
  final Duration animationDuration;
  final EdgeInsets indicatorPadding;
  final ValueChanged<bool> onChanged;

  @override
  _CustomSwitchButtonState createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  double height;
  double outerBoxRadius;
  double innerBoxRadius;
  double indicatorHeight;
  double indicatorWidth;

  @override
  void initState() {
    super.initState();
    height = widget.width / 2;
    outerBoxRadius = height;
    indicatorHeight = height;
    indicatorWidth = height;
    innerBoxRadius = indicatorWidth / 2;
  }

  @override
  Widget build(BuildContext context) {
    var tween = MultiTrackTween([
      Track("paddingLeft").add(
        widget.animationDuration,
        Tween(begin: 0.0, end: height),
      ),
      Track("paddingRight").add(
        widget.animationDuration,
        Tween(begin: height, end: 0),
      ),
      Track("color").add(
          widget.animationDuration,
          ColorTween(
              begin: widget.indicatorInActiveColor,
              end: widget.indicatorActiveColor)),
    ]);

    return ControlledAnimation(
      playback: widget.value ? Playback.PLAY_FORWARD : Playback.PLAY_REVERSE,
      startPosition: widget.value ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildSwitch,
    );
  }

  Widget _buildSwitch(context, animation) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: Container(
        decoration: _outerBoxDecoration(widget.activeTrackColor),
        width: widget.width,
        height: height,
        padding: widget.indicatorPadding,
        child: Stack(
          children: [
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(
                  left: animation['paddingLeft'],
                  right: animation['paddingRight'],
                ),
                child: Container(
                  decoration: _innerBoxDecoration(animation['color']),
                  width: indicatorWidth,
                  height: indicatorHeight,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(
                        side: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      onTap: () {
                        widget.onChanged(!widget.value);
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _innerBoxDecoration(color) => BoxDecoration(
        borderRadius: BorderRadius.circular(innerBoxRadius),
        color: color,
      );

  BoxDecoration _outerBoxDecoration(color) => BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(outerBoxRadius),
        ),
        color:
            widget.value ? widget.activeTrackColor : widget.inActiveTrackColor,
      );
}

import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import '../constants/constant.dart';

class ApplianceControllerPainter extends CustomPainter {
  ApplianceControllerPainter({
    @required this.linearGradientColors,
    @required this.stops,
    @required this.swapAngle,
  }) : assert(linearGradientColors.length == stops.length,
            'linearGradientColors length must match stops length') {
    initialTemperature += swapAngle / _kInitialAngle;
  }

  final double swapAngle;
  final List<Color> linearGradientColors;
  final List<double> stops;
  double initialTemperature = 5;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    final paint = Paint();
    const center = Offset(0, 0);
    _addOuterDottedLines(paint, size, center, canvas);
    final gradientRadius = size.width / 7.4;
    _addControllerArc(paint, size, center, gradientRadius, canvas);
    _addControllerCircles(paint, center, size, canvas);
    _addInitialDotIndicator(paint, gradientRadius, canvas);
    _addTemperatureIndicator(paint, gradientRadius, swapAngle, canvas);
    _addTexts(canvas, size);
    canvas.restore();
  }

  void _addTemperatureIndicator(
      Paint paint, double radius, double arcAngle, Canvas canvas) {
    paint
      ..color = AppColors.white
      ..style = PaintingStyle.fill;

    final double x1 = radius * cos(-pi + arcAngle);
    final double y1 = radius * sin(-pi + arcAngle);

    canvas.drawCircle(
      Offset(
        x1,
        y1,
      ),
      9,
      paint,
    );
    paint
      ..color = linearGradientColors.last
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(
        x1,
        y1,
      ),
      4.5,
      paint,
    );
  }

  void _addControllerArc(Paint paint, Size size, Offset center,
      double gradientRadius, Canvas canvas) {
    final rect = Rect.fromCircle(
      center: center,
      radius: gradientRadius,
    );
    final gradientPaint = Paint()
      ..color = AppColors.white
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        colors: linearGradientColors,
        stops: stops,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect);
    canvas.drawArc(
      rect,
      -pi,
      swapAngle,
      true,
      gradientPaint,
    );

    final outer1Circle = Rect.fromCircle(
      center: center,
      radius: size.width / 7.8,
    );
    paint
      ..color = AppColors.white
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        colors: <Color>[
          AppColors.containerShadowLeft,
          AppColors.containerShadowLRight,
        ],
        stops: [0.3, 0.5],
      ).createShader(outer1Circle);
    canvas.drawArc(
      outer1Circle,
      -2 * pi,
      2 * pi,
      true,
      paint,
    );
  }

  void _addOuterDottedLines(
      Paint paint, Size size, Offset center, Canvas canvas) {
    paint
      ..color = AppColors.controllerBorderColor
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;
    double r = size.width / 5.9;
    final double arcAngle = 2 * pi / 40;
    double init = -2 * pi;
    for (var i = 0; i < 40; i++) {
      if (init == -pi / 2 ||
          init == (-3 * pi) / 2 ||
          init == -pi ||
          init == -2 * pi) {
        paint.strokeWidth = 0.6;
        r = r + 5;
      } else {
        paint.strokeWidth = 0.5;
        r = size.width / 5.9;
      }
      final double x = r * cos(init);
      final double y = r * sin(init);
      canvas.drawLine(center, Offset(x, y), paint);
      init = init + arcAngle;
    }
    paint
      ..style = PaintingStyle.fill
      ..color = AppColors.containerFill
      ..shader = null;
    canvas.drawCircle(center, size.width / 6.5, paint);
  }

  void _addControllerCircles(
      Paint paint, Offset center, Size size, Canvas canvas) {
    //Second OuterCircle
    paint
      ..color = AppColors.containerBorder
      ..shader = null;
    canvas.drawCircle(center, size.width / 8.92, paint);
    //First OuterCircle
    paint.color = AppColors.containerFill;
    canvas.drawCircle(center, size.width / 9.0, paint);
    //firstBorder
    paint.color = AppColors.controllerBorder;
    canvas.drawCircle(center, size.width / 9.9, paint);
    //firstInnerCircle
    paint.color = AppColors.containerFill;
    canvas.drawCircle(center, size.width / 10.0, paint);
  }

  //Dot::Small circle
  void _addInitialDotIndicator(Paint paint, double radius, Canvas canvas) {
    paint
      ..color = AppColors.white
      ..style = PaintingStyle.fill;

    final double x1 = radius * cos(-pi);
    final double y1 = radius * sin(-pi);

    canvas.drawCircle(
      Offset(
        x1 + 1.5,
        y1,
      ),
      6,
      paint,
    );
    //Dot::inner small circle
    paint
      ..color = const Color(0xFF75BCFF)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(
        x1 + 1.5,
        y1 + .5,
      ),
      3,
      paint,
    );
  }

  final double _kInitialAngle = 2 * pi / 40;

  void _addTexts(Canvas canvas, Size size) {
    final leftTextOffset = Offset(-size.width / 4.6 - 15, -10);
    canvas.drawParagraph(
        _paragraph('05', AppColors.chilledTemperature), leftTextOffset);

    final topTextOffset = Offset(-15, -size.width / 4.6);
    canvas.drawParagraph(
        _paragraph('15', AppColors.coolTemperature), topTextOffset);

    final rightOffset = Offset(size.width / 4.6 - 15, -10);
    canvas.drawParagraph(
        _paragraph('25', AppColors.warmTemperature), rightOffset);

    final bottomTextOffset = Offset(-15, size.width / 4.6 - 15);
    canvas.drawParagraph(
        _paragraph('35', AppColors.hotTemperature), bottomTextOffset);

    _addTemperatureText(canvas, const Offset(-32, -24));
    _addTemperatureUnit(canvas, const Offset(-20, 8));
  }

  void _addTemperatureUnit(Canvas canvas, Offset offset) {
    final paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle())
      ..pushStyle(ui.TextStyle(
        color: AppColors.roleTextColor,
        fontSize: 11,
        letterSpacing: .13,
      ))
      ..addText('Celsius');
    final paragraph = paragraphBuilder.build()
      ..layout(const ui.ParagraphConstraints(width: 100));
    canvas.drawParagraph(paragraph, offset);
  }

  void _addTemperatureText(Canvas canvas, Offset offset) {
    final paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle())
      ..pushStyle(ui.TextStyle(
        color: AppColors.white,
        fontSize: 27,
      ))
      ..addText('$initialTemperature${'\u2103'}');
    final paragraph = paragraphBuilder.build()
      ..layout(const ui.ParagraphConstraints(width: 100));
    canvas.drawParagraph(paragraph, offset);
  }

  ui.Paragraph _paragraph(String temperature, Color color) {
    final paragraphBuilder = ui.ParagraphBuilder(ui.ParagraphStyle())
      ..pushStyle(_textStyle(color))
      ..addText('$temperature${'\u2103'}');
    final paragraph = paragraphBuilder.build()
      ..layout(const ui.ParagraphConstraints(width: 100));
    return paragraph;
  }

  ui.TextStyle _textStyle(Color color) => ui.TextStyle(color: color);

  @override
  bool shouldRepaint(ApplianceControllerPainter oldDelegate) {
    return linearGradientColors != oldDelegate.linearGradientColors;
  }
}

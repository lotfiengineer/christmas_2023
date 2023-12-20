import 'package:christmas_2024/src/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

class Santa extends StatefulWidget {
  const Santa({super.key});

  @override
  State<Santa> createState() => _SantaState();
}

class _SantaState extends State<Santa> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const MovingLinesWidget(),
        const SizedBox(
          width: 5,
        ),
        Transform.flip(
          flipX: true,
          child: Image.asset(
            'lib/assets/images/santa.png',
            color: AppTheme.lightWhiteColor,
            width: 100,
          ),
        ),
      ],
    );
  }
}

class MovingLinesWidget extends StatefulWidget {
  const MovingLinesWidget({super.key});

  @override
  State<MovingLinesWidget> createState() => _MovingLinesWidgetState();
}

class _MovingLinesWidgetState extends State<MovingLinesWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CustomPaint(
        painter: MovingLinesPainter(_controller),
        size: const Size(25, 1),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class MovingLinesPainter extends CustomPainter {
  final Animation<double> animation;

  MovingLinesPainter(this.animation) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(104, 255, 255, 255)
      ..strokeWidth = 10.0;

    double lineHeight = 0.5;
    double lineGap = 4.0;

    double yOffset = (size.height - lineHeight * 3 - lineGap * 2) / 2;

    double line1X = size.width - size.width * animation.value + 5;
    double line2X = size.width - size.width * (animation.value - 0.33) + 4;
    double line3X = size.width - size.width * (animation.value - 0.55) - 6;

    canvas.drawLine(
      Offset(line2X, yOffset + lineHeight + lineGap - 3),
      Offset(line2X, yOffset + 2 * lineHeight + lineGap - 3),
      paint,
    );

    canvas.drawLine(
      Offset(line1X, yOffset + 5),
      Offset(line1X, yOffset + lineHeight + 5),
      paint,
    );

    canvas.drawLine(
      Offset(line3X, yOffset + lineHeight + lineGap + 4),
      Offset(line3X, yOffset + 2 * lineHeight + lineGap + 4),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

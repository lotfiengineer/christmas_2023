import 'package:christmas_2024/src/config/themes/app_theme.dart';
import 'package:christmas_2024/src/utils/resources/GiftModel.dart';
import 'package:flutter/material.dart';

class ReceivedGiftContainer extends StatefulWidget {
  const ReceivedGiftContainer({super.key, required this.gift});

  final GiftModel gift;

  @override
  State<ReceivedGiftContainer> createState() => _ReceivedGiftContainerState();
}

class _ReceivedGiftContainerState extends State<ReceivedGiftContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ClipRect(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(
                  color: AppTheme.transparentBlueColor,
                ),
                child: Image.asset(
                    'lib/assets/images/gift_images/watch.png'),
              ),
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: CustomPaint(
                  painter: LinePainter(_controller.value),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class LinePainter extends CustomPainter {
  final double progress;

  LinePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final double offset = size.width * progress;

    final Paint paint = Paint()
      ..color = Color.fromARGB(102, 15, 9, 184)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final Paint paint2 = Paint()
      ..color = Color.fromARGB(148, 98, 0, 115)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(offset, 0),
      Offset(size.width, 0),
      paint2,
    );

    canvas.drawLine(
      Offset(size.width, offset),
      Offset(size.width, 0),
      paint2,
    );

    canvas.drawLine(
      Offset(0, size.height - offset),
      Offset(0, size.height),
      paint,
    );

    canvas.drawLine(
      Offset(size.width - offset, size.height),
      Offset(0, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

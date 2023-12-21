import 'package:flutter/material.dart';

class ClosedBox extends StatefulWidget {
  const ClosedBox({super.key});

  @override
  State<ClosedBox> createState() => ClosedBoxState();
}

class ClosedBoxState extends State<ClosedBox> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween(begin: 0.0, end: 9.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _animation.addListener(() {
      setState(() {});
    });

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0.0, _animation.value),
      child: Image.asset(
        'lib/assets/images/gift.png',
        width: 110,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

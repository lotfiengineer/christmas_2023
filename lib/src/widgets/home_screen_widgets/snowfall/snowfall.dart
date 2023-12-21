import 'package:flutter/material.dart';
import './widget/snow_widget.dart';

class Snowfall extends StatelessWidget {
  const Snowfall({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SnowWidget(
          isRunning: true,
          totalSnow: 60,
          speed: 0.1,
          maxRadius: 5,
          snowColor: Color.fromARGB(106, 255, 255, 255),
        ),
        child
      ],
    );
  }
}

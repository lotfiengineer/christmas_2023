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
    return Transform.flip(
      flipX: true,
      child: Image.asset(
        'lib/assets/images/santa.png',
        color: AppTheme.lightWhiteColor,
        width: 100,
      ),
    );
  }
}

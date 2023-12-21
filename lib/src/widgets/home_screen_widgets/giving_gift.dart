import 'package:christmas_2024/src/config/themes/app_theme.dart';
import 'package:christmas_2024/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class GivingGift extends StatefulWidget {
  const GivingGift({super.key});

  @override
  State<GivingGift> createState() => _GivingGiftState();
}

class _GivingGiftState extends State<GivingGift> {
  Widget _buildContent() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                alignment: Alignment.center,
                actionsAlignment: MainAxisAlignment.center,
                title: const Text('icon'),
                content: const Text(
                  'description',
                  textAlign: TextAlign.center,
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: context.textTheme.bodyMedium,
                      foregroundColor: AppTheme.lightYelllow,
                    ),
                    child: const Text(
                      'Got It 🎅',
                      style: TextStyle(color: AppTheme.yellowColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
      child: Image.asset(
        'lib/assets/images/gift.png',
        width: 110,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}

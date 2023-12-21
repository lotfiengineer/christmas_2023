import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:christmas_2024/src/config/themes/app_theme.dart';

class BottomNavigationBarUi extends StatefulWidget {
  const BottomNavigationBarUi({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int) onTap;

  @override
  State<BottomNavigationBarUi> createState() => _BottomNavigationBarUiState();
}

class _BottomNavigationBarUiState extends State<BottomNavigationBarUi> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          unselectedItemColor: AppTheme.superLightWhiteColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.house,
              ),
              label: 'Home',
              backgroundColor: AppTheme.transparentGreenColor,
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.gift,
              ),
              label: 'Received Gifts',
              backgroundColor: AppTheme.transparentBlueColor,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          selectedFontSize: AppTheme.smallSize - 5,
          iconSize: AppTheme.mediumSize - 5,
          selectedIconTheme: const IconThemeData(size: AppTheme.mediumSize),
          selectedItemColor: AppTheme.yellowColor,
          currentIndex: widget.currentIndex,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}

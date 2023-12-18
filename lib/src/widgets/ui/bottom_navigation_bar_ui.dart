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
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      selectedFontSize: 12,
      iconSize: 16,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.house,
          ),
          label: 'Home',
          backgroundColor: AppTheme.greenColor,
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.gift,
          ),
          label: 'Received Gifts',
          backgroundColor: AppTheme.blueColor,
        ),
      ],
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
    );
  }
}

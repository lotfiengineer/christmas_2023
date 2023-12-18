import 'package:christmas_2024/src/screens/gifts_screen.dart';
import 'package:christmas_2024/src/screens/home_screen.dart';
import 'package:christmas_2024/src/utils/extensions/build_context_extensions.dart';
import 'package:christmas_2024/src/widgets/ui/bottom_navigation_bar_ui.dart';
import 'package:flutter/material.dart';

class ScaffoldUi extends StatefulWidget {
  const ScaffoldUi({super.key});

  @override
  State<ScaffoldUi> createState() => _ScaffoldUiState();
}

class _ScaffoldUiState extends State<ScaffoldUi> {
  int currentIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const GiftsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget _buildAppBarText() {
    return currentIndex == 0
        ? const Text('Home')
        : const Text('Received Gifts');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildAppBarText(),
      ),
      body: widgetOptions[currentIndex],
      bottomNavigationBar: BottomNavigationBarUi(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

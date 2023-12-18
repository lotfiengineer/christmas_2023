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
    const Text(
      'Home Screen',
    ),
    const Text(
      'gifts screen',
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Christmas 2024 Home Page'),
      ),
      body: widgetOptions[currentIndex],
      bottomNavigationBar: BottomNavigationBarUi(
        currentIndex: currentIndex,
        onTap: onItemTapped,
      ),
    );
  }
}

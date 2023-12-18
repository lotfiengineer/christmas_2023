import 'package:christmas_2024/src/config/themes/app_theme.dart';
import 'package:christmas_2024/src/widgets/ui/bottom_navigation_bar_ui.dart';
import 'package:christmas_2024/src/widgets/ui/scaffold_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Christmas 2024',
      theme: AppTheme.light,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldUi();
  }
}

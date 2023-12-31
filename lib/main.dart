import 'package:christmas_2024/src/config/themes/app_theme.dart';
import 'package:christmas_2024/src/gifts_viewmodel.dart';
import 'package:christmas_2024/src/widgets/ui/scaffold_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GiftsViewmodel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Christmas 2024',
      theme: AppTheme.light,
      home: const ScaffoldUi(),
    );
  }
}

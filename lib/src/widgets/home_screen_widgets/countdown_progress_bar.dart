import 'package:flutter/material.dart';

class CountdownProgressBar extends StatefulWidget {
  const CountdownProgressBar({super.key});

  @override
  State<CountdownProgressBar> createState() => _CountdownProgressBarState();
}

class _CountdownProgressBarState extends State<CountdownProgressBar>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          LinearProgressIndicator(
            value: 0.5,
            color: Colors.red,
            semanticsLabel: 'Linear progress indicator',
          ),
          LinearProgressIndicator(
            value: controller.value,
            color: Colors.green,
            backgroundColor: Colors.transparent,
            semanticsLabel: 'Linear progress indicator',
          )
        ],
      ),
    );
  }

  // DateTime targetDate = DateTime(2023, 12, 25);
  // late double progress;

  // @override
  // void initState() {
  //   super.initState();
  //   updateProgress();
  // }

  // void updateProgress() {
  //   DateTime startDate = DateTime(2023, 12, 15);
  //   Duration remainingTime = targetDate.difference(startDate);

  //   // Calculate progress as a percentage
  //   double totalDays = targetDate.difference(startDate).inDays.toDouble();
  //   double daysPassed = totalDays - remainingTime.inDays.toDouble();
  //   progress = daysPassed / totalDays;

  //   print('dasdf $daysPassed');

  //   // Ensure progress is between 0 and 1
  //   setState(() {
  //     progress = progress.clamp(0.0, 1.0);
  //     progress = 0.2;
  //   });

  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Countdown Progress'),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           const Text(
  //             'Days until Christmas:',
  //             style: TextStyle(fontSize: 18),
  //           ),
  //           const SizedBox(height: 16),
  //           LinearProgressIndicator(
  //             value: progress,
  //             color: Colors.green, // Customize the color as needed
  //             valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
  //           ),
  //           const SizedBox(height: 16),
  //           Text(
  //             '${targetDate.difference(DateTime.now()).inDays} days remaining',
  //             style: const TextStyle(fontSize: 18),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

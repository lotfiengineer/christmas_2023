import 'package:christmas_2024/src/config/themes/app_theme.dart';
import 'package:christmas_2024/src/utils/constants/date_values.dart';
import 'package:christmas_2024/src/utils/extensions/build_context_extensions.dart';
import 'package:christmas_2024/src/utils/methods/is_progress_finished.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountdownProgressSanta extends StatefulWidget {
  const CountdownProgressSanta({super.key});

  @override
  State<CountdownProgressSanta> createState() => _CountdownProgressSantaState();
}

class _CountdownProgressSantaState extends State<CountdownProgressSanta>
    with TickerProviderStateMixin {
  late AnimationController controller;

  DateTime today = DateTime.now();
  late double progress;

  @override
  void initState() {
    super.initState();

    updateProgress();

    if (DateValues.targetDate.difference(today).isNegative ||
        today == DateValues.targetDate) {
      controller = AnimationController(
        vsync: this,
        upperBound: 1,
      );
      controller.value = 1;
      progress = 1;
      return;
    } else {
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 10),
        upperBound: progress,
      )..addListener(() {
          updateProgress();
        });
      controller.repeat();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateProgress() {
    Duration remainingTime = DateValues.targetDate.difference(today);

    double totalDays = DateValues.targetDate
        .difference(DateValues.startDate)
        .inSeconds
        .toDouble();
    double daysPassed = totalDays - remainingTime.inSeconds.toDouble();

    setState(() {
      progress = daysPassed / totalDays;
    });

    if (today == DateValues.targetDate) {
      setState(() {
        progress = 1;
      });
    } else {
      setState(() {
        progress = daysPassed / totalDays;
      });
    }
  }

  _buildMerryChristmasText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FaIcon(
          FontAwesomeIcons.star,
          size: context.textTheme.bodySmall!.fontSize,
          color: AppTheme.lightYelllow,
        ),
        Text(
          'Merry Christmas',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppTheme.yellowColor,
            fontSize: context.textTheme.titleMedium!.fontSize,
          ),
        ),
        FaIcon(
          FontAwesomeIcons.star,
          size: context.textTheme.bodySmall!.fontSize,
          color: AppTheme.lightYelllow,
        ),
      ],
    );
  }

  _buildSantaClauseComing() {
    return const Text('Santa');
  }

  @override
  Widget build(BuildContext context) {
    CrossAxisAlignment santaAlignment = isProgressFinished(progress)
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;

    return Column(
      crossAxisAlignment: santaAlignment,
      children: [
        LayoutBuilder(
          builder: (ctx, constraints) => Container(
            margin: EdgeInsets.only(
              left: isProgressFinished(progress)
                  ? 0
                  : constraints.biggest.width * progress,
            ),
            child: isProgressFinished(progress)
                ? _buildMerryChristmasText()
                : _buildSantaClauseComing(),
          ),
        ),
        const SizedBox(height: 3),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                minHeight: 8,
                value: progress,
                color: AppTheme.greenColor,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                minHeight: 8,
                value: controller.value,
                color: AppTheme.lightGreen,
                backgroundColor: Colors.transparent,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

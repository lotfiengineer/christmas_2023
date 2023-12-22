import 'package:christmas_2024/src/config/themes/app_theme.dart';
import 'package:christmas_2024/src/gifts_viewmodel.dart';
import 'package:christmas_2024/src/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ConfirmResetDialog extends StatefulWidget {
  const ConfirmResetDialog({super.key, required this.goBackHome});

  final void Function() goBackHome;

  @override
  State<ConfirmResetDialog> createState() =>
      _ConfirmResetDialogStateState();
}

class _ConfirmResetDialogStateState extends State<ConfirmResetDialog> {
  Widget _buildContent() {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              backgroundColor: AppTheme.lightBlue,
              contentPadding: EdgeInsets.zero,
              actionsPadding: const EdgeInsets.all(7),
              titlePadding: const EdgeInsets.only(
                bottom: 10,
                top: 20,
                left: 20,
                right: 20,
              ),
              alignment: Alignment.center,
              actionsAlignment: MainAxisAlignment.center,
              title: Text(
                'Are you sure you want to delete all of the gifts you received from 🎅?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: context.textTheme.titleMedium!.fontSize),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: context.textTheme.bodyMedium,
                    foregroundColor: AppTheme.lightYelllow,
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: AppTheme.yellowColor),
                  ),
                  onPressed: () {
                    Provider.of<GiftsViewmodel>(context, listen: false)
                        .resetReceivedGifts();
                    Navigator.of(context).pop();
                    widget.goBackHome();
                  },
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    textStyle: context.textTheme.bodyMedium,
                    foregroundColor: AppTheme.lightYelllow,
                    backgroundColor: AppTheme.blueColor
                  ),
                  child: const Text(
                    'No',
                    style: TextStyle(color: AppTheme.yellowColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      icon: const FaIcon(
        Icons.refresh,
        color: AppTheme.lightWhiteColor,
        size: 22,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}

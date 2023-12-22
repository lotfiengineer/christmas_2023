import 'package:christmas_2024/src/config/themes/app_theme.dart';
import 'package:christmas_2024/src/gifts_viewmodel.dart';
import 'package:christmas_2024/src/utils/extensions/build_context_extensions.dart';
import 'package:christmas_2024/src/utils/resources/GiftModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GiftsDescriptionScreen extends StatefulWidget {
  const GiftsDescriptionScreen({super.key, required this.movePreviousPage});

  final void Function() movePreviousPage;

  @override
  State<GiftsDescriptionScreen> createState() => _GiftsDescriptionScreenState();
}

class _GiftsDescriptionScreenState extends State<GiftsDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final GiftModel gift =
        Provider.of<GiftsViewmodel>(context, listen: false).selectedGift;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(gift.giftImageSrc, height: 220),
          const SizedBox(height: 22),
          Text(
            gift.giftTitle,
            style: TextStyle(
              fontSize: context.textTheme.titleMedium!.fontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          Text(gift.giftDescription),
          const SizedBox(height: 25),
          SizedBox(
            width: 200,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 2.0, color: Colors.blue),
                foregroundColor: AppTheme.transparentBlueColor,
              ),
              onPressed: widget.movePreviousPage,
              child: Text(
                'Go back',
                style: TextStyle(
                  fontSize: context.textTheme.bodyMedium!.fontSize! + 3,
                  color: AppTheme.blueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

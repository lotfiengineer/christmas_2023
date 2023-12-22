import 'package:christmas_2024/src/config/themes/app_theme.dart';
import 'package:christmas_2024/src/gifts_viewmodel.dart';
import 'package:christmas_2024/src/utils/extensions/build_context_extensions.dart';
import 'package:christmas_2024/src/utils/resources/GiftModel.dart';
import 'package:christmas_2024/src/widgets/home_screen_widgets/closed_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GivingGift extends StatefulWidget {
  const GivingGift({super.key});

  @override
  State<GivingGift> createState() => _GivingGiftState();
}

class _GivingGiftState extends State<GivingGift> {
  bool isDialogOpen = false;

  Widget _buildContent() {
    GiftsViewmodel giftsViewmodel =
        Provider.of<GiftsViewmodel>(context, listen: false);
    return GestureDetector(
      onTap: () {
        setState(() {
          isDialogOpen = true;
        });

        GiftModel gift = giftsViewmodel.giveRandomGift();

        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return WillPopScope(
                onWillPop: () async {
                  setState(() {
                    isDialogOpen = false;
                  });
                  Navigator.of(context).pop();
                  return true;
                },
                child: AlertDialog(
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
                  title: Image.asset(
                    gift.giftImageSrc,
                    // width: 100,
                    height: 180,
                  ),
                  content: Text(
                    gift.giftTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: context.textTheme.titleMedium!.fontSize,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: context.textTheme.bodyMedium,
                        foregroundColor: AppTheme.lightYelllow,
                      ),
                      child: const Text(
                        'Got It 🎅',
                        style: TextStyle(color: AppTheme.yellowColor),
                      ),
                      onPressed: () {
                        setState(() {
                          isDialogOpen = false;
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              );
            });
      },
      child: isDialogOpen ? _buildOpenBox() : const ClosedBox(),
    );
  }

  Widget _buildOpenBox() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 58,
        // top: 15,
      ),
      child: Image.asset(
        'lib/assets/images/gift_opened.png',
        width: 250,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}

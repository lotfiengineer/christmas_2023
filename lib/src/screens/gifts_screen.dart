import 'package:christmas_2024/src/gifts_viewmodel.dart';
import 'package:christmas_2024/src/utils/resources/GiftModel.dart';
import 'package:christmas_2024/src/widgets/gifts_screen_widgets/received_gift_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GiftsScreen extends StatefulWidget {
  const GiftsScreen({super.key});

  @override
  State<GiftsScreen> createState() => _GiftsScreenState();
}

class _GiftsScreenState extends State<GiftsScreen> {
  Widget _buildContent() {
    GiftsViewmodel giftsViewmodel =
        Provider.of<GiftsViewmodel>(context, listen: true);

    List<Widget> sadf = (giftsViewmodel.receivedGifts
        .map((gift) => Text(gift.giftTitle))).toList();

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          const ReceivedGiftContainer(),
          const ReceivedGiftContainer(),
          const ReceivedGiftContainer(),
          const ReceivedGiftContainer(),
        ],
      ),
    );

    // return Wrap(
    //   children: sadf,
    // );
  }

  Widget _buildGiftContainer(String tt) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(tt),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}

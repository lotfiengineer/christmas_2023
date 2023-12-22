import 'package:christmas_2024/src/gifts_viewmodel.dart';
import 'package:christmas_2024/src/screens/gifts_description_screen.dart';
import 'package:christmas_2024/src/widgets/gifts_screen_widgets/received_gift_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GiftsScreen extends StatefulWidget {
  const GiftsScreen({super.key});

  @override
  State<GiftsScreen> createState() => _GiftsScreenState();
}

class _GiftsScreenState extends State<GiftsScreen> {
  final PageController controller = PageController();

  Widget _buildContent() {
    GiftsViewmodel giftsViewmodel =
        Provider.of<GiftsViewmodel>(context, listen: true);

    List<Widget> giftsList = (giftsViewmodel.receivedGifts.map(
      (gift) => GestureDetector(
        onTap: () {
          moveNextPage();
          giftsViewmodel.setSelectedGift(gift);
        },
        child: ReceivedGiftContainer(
          gift: gift,
        ),
      ),
    )).toList();

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 3,
            crossAxisSpacing: 28,
            mainAxisSpacing: 28,
            children: giftsList,
          ),
          GiftsDescriptionScreen(
            movePreviousPage: movePreviousPage,
          ),
        ],
      ),
    );
  }

  void moveNextPage() {
    controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  void movePreviousPage() {
    controller.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}

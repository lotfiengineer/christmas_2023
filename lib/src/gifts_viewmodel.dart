import 'dart:math';

import 'package:christmas_2024/src/utils/resources/GiftModel.dart';
import 'package:flutter/material.dart';

class GiftsViewmodel extends ChangeNotifier {
  final List<GiftModel> receivedGifts = [];
  late GiftModel selectedGift;
  Random random = Random();

  final List<GiftModel> allGifts = [
    GiftModel(
      giftTitle: 'Box Of Chocolate',
      giftDescription:
          "Indulge in a symphony of sweet sensations with this delightful box of chocolates. Each velvety piece is a miniature masterpiece, promising a journey of blissful flavors that dance on your taste buds—a perfect gift to sweeten any moment.",
      giftImageSrc: 'lib/assets/images/gift_images/box_of_chocolate.jpg',
    ),
    GiftModel(
      giftTitle: 'Earphone',
      giftDescription:
          "Elevate your auditory experience with these sleek earphones. Immerse yourself in a world of crystal-clear sound, whether you're on a jog, commuting, or just unwinding. A thoughtful gift for those who appreciate the harmony of music in their daily lives.",
      giftImageSrc: 'lib/assets/images/gift_images/earphone.png',
    ),
    GiftModel(
      giftTitle: 'Iphone',
      giftDescription:
          'Unwrap the future with the iconic iPhone—an elegant blend of cutting-edge technology and seamless design. This pocket-sized marvel opens doors to limitless possibilities, from capturing memories in stunning detail to staying connected with the world. A gift that encapsulates innovation and style.',
      giftImageSrc: 'lib/assets/images/gift_images/iphone.png',
    ),
    GiftModel(
      giftTitle: 'Mug',
      giftDescription:
          "Sip your favorite brew in style with this charming mug. Its warmth doesn't just come from the beverage it holds but from the memories and moments it helps create. The perfect vessel for cozy conversations and quiet reflections, a mug is a timeless gift that warms the heart with every use.",
      giftImageSrc: 'lib/assets/images/gift_images/mug.png',
    ),
    GiftModel(
      giftTitle: 'Watch',
      giftDescription:
          "Adorn your wrist with elegance and functionality. This watch is more than a timekeeper; it's a statement piece. Precision meets style in a dance of gears and hands, reminding you that every second is an opportunity, and each moment is worth treasuring.",
      giftImageSrc: 'lib/assets/images/gift_images/watch.png',
    ),
  ];

  GiftModel giveRandomGift() {
    GiftModel gift = allGifts[random.nextInt(allGifts.length)];

    addReceivedGifts(gift);

    notifyListeners();

    return gift;
  }

  void addReceivedGifts(GiftModel gift) {
    receivedGifts.add(gift);
  }

  List<GiftModel> getReceivedGifts() => receivedGifts;

  void setSelectedGift(GiftModel gift) {
    selectedGift = gift;
    // notifyListeners();
  }

  void resetReceivedGifts() {
    receivedGifts.clear();
    notifyListeners();
  }
}

import 'dart:math';

import 'package:christmas_2024/src/utils/resources/GiftModel.dart';
import 'package:flutter/material.dart';

class GiftsViewmodel extends ChangeNotifier {
  final List<GiftModel> receivedGifts = [];
  Random random = Random();

  final List<GiftModel> allGifts = [
    GiftModel(
      giftTitle: 'A Box Of Chocolate',
      giftDescription: "Box Of Chocolate",
      giftImageSrc: 'lib/assets/images/gift_images/box_of_chocolate.jpg',
    ),
    GiftModel(
      giftTitle: 'Earphone',
      giftDescription: "An Earphone",
      giftImageSrc: 'lib/assets/images/gift_images/earphone.png',
    ),
    GiftModel(
      giftTitle: 'Iphone',
      giftDescription: 'An Iphone',
      giftImageSrc: 'lib/assets/images/gift_images/iphone.png',
    ),
    GiftModel(
      giftTitle: 'A Mug',
      giftDescription: 'A Mug',
      giftImageSrc: 'lib/assets/images/gift_images/mug.png',
    ),
    GiftModel(
      giftTitle: 'A Watch',
      giftDescription: 'Watch',
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
}

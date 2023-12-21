import 'dart:math';

import 'package:christmas_2024/src/utils/resources/GiftModel.dart';
import 'package:flutter/material.dart';

class GiftsViewmodel extends ChangeNotifier {
  final List<GiftModel> receivedGifts = [];
  Random random = Random();

  final List<GiftModel> allGifts = [
    GiftModel(
      giftTitle: 'Iphone 14',
      giftDescription: "1",
      giftImageSrc: '1',
    ),
    GiftModel(
      giftTitle: '100\$ Gift Card',
      giftDescription: "2",
      giftImageSrc: '2',
    ),
    GiftModel(
      giftTitle: 'Harry Potter Books',
      giftDescription: '3',
      giftImageSrc: '3',
    ),
    GiftModel(
      giftTitle: 'A Box Of Chocolate',
      giftDescription: '4',
      giftImageSrc: '4',
    ),
    GiftModel(
      giftTitle: 'A Christmas T-shirt',
      giftDescription: '5',
      giftImageSrc: '5',
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

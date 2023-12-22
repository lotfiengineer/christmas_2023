import 'package:flutter/material.dart';

class GiftsDescriptionScreen extends StatefulWidget {
  const GiftsDescriptionScreen({super.key, required this.movePreviousPage});

  final void Function() movePreviousPage;

  @override
  State<GiftsDescriptionScreen> createState() => _GiftsDescriptionScreenState();
}

class _GiftsDescriptionScreenState extends State<GiftsDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.movePreviousPage();
      },
      child: Text('asdfkasdf'),
    );
  }
}

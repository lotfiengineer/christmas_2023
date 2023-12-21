import 'package:flutter/material.dart';


class ReceivedGiftContainer extends StatefulWidget {
  const ReceivedGiftContainer({super.key});

  @override
  State<ReceivedGiftContainer> createState() => _ReceivedGiftContainerState();
}

class _ReceivedGiftContainerState extends State<ReceivedGiftContainer> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;

  @override
  void initState() {
    super.initState();

    // Create two AnimationControllers with a duration of 2 seconds
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crossing Lines Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([_controller1, _controller2]),
          builder: (context, child) {
            return Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 50,
                  child: Container(
                    width: 100,
                    height: 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.transparent],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 50,
                  child: Container(
                    height: 100,
                    width: 2,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.transparent],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
}

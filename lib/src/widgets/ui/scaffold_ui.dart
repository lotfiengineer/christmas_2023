import 'package:christmas_2024/src/config/themes/app_theme.dart';
import 'package:christmas_2024/src/screens/gifts_screen.dart';
import 'package:christmas_2024/src/screens/home_screen.dart';
import 'package:christmas_2024/src/utils/methods/is_home_visible.dart';
import 'package:christmas_2024/src/widgets/gifts_screen_widgets/confirm_reset_dialog.dart';
import 'package:christmas_2024/src/widgets/home_screen_widgets/christmas_music_player.dart';
import 'package:christmas_2024/src/widgets/ui/bottom_navigation_bar_ui.dart';
import 'package:flutter/material.dart';

class ScaffoldUi extends StatefulWidget {
  const ScaffoldUi({super.key});

  @override
  State<ScaffoldUi> createState() => _ScaffoldUiState();
}

class _ScaffoldUiState extends State<ScaffoldUi> {
  // TODO: change this index
  int currentIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const GiftsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget _buildAppBarText() {
    return isHomeVisible(currentIndex)
        ? const Text('Home')
        : const Text('Received Gifts');
  }

  Widget _buildContainerWithBackground({required Widget child}) {
    String image = isHomeVisible(currentIndex)
        ? 'christmas_background.png'
        : 'aurora_sky.jpg';

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/assets/images/$image'),
            fit: BoxFit.fill,
            opacity: 0.6),
      ),
      child: child,
    );
  }

  Color getAppbarBackgroundColor() =>
      isHomeVisible(currentIndex) ? AppTheme.greenColor : AppTheme.blueColor;

  @override
  Widget build(BuildContext context) {
    return _buildContainerWithBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: getAppbarBackgroundColor(),
          title: _buildAppBarText(),
          leading: const Center(
            child: ChristmasMusicPlayer(),
          ),
          actions: [
            isHomeVisible(currentIndex)
                ? const SizedBox()
                : Center(
                    child: ConfirmResetDialog(
                      goBackHome: () {
                        setState(() {
                          currentIndex = 0;
                        });
                      },
                    ),
                  )
          ],
        ),
        body: widgetOptions[currentIndex],
        bottomNavigationBar: BottomNavigationBarUi(
          currentIndex: currentIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

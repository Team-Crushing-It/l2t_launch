import 'package:flutter/material.dart';
import '../../extensions.dart';

class HomePageTopSection extends StatelessWidget {
  const HomePageTopSection({Key? key}) : super(key: key);
  static const String HomePageText = '''
Learn Flutter
Collaborate on projects
Connect & Share Knowledge''';

  double _imageLeft(BuildContext context) {
    if (context.width > 1500) {
      return -50;
    }
    return -250;
  }

  double _leftText(BuildContext context) {
    if (context.width > 1500) {
      return 500;
    }
    return 360;
  }

  double _textFontSize(BuildContext context) {
    if (context.width > 1500) {
      return 100;
    }
    return 70;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .5,
      width: context.width,
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: 500.milliseconds,
            curve: Curves.easeInOut,
            bottom: 0,
            top: 0,
            left: _imageLeft(context),
            child: Center(
              child: Image.asset('assets/humming_bird.png'),
            ),
          ),
          AnimatedPositioned(
            duration: 500.milliseconds,
            curve: Curves.easeInOut,
            bottom: 0,
            top: 80,
            left: _leftText(context),
            child: Align(
              alignment: Alignment.centerRight,
              child: AnimatedDefaultTextStyle(
                duration: 500.milliseconds,
                curve: Curves.easeInOut,
                style: TextStyle(
                  fontSize: _textFontSize(context),
                ),
                child: const Text(HomePageText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

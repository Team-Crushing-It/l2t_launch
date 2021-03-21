import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../global_widgets/linkable_span.dart';

class HomePageStartProjectSection extends StatelessWidget {
  const HomePageStartProjectSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RichText(
              text: TextSpan(
                text: 'Use ',
                style: const TextStyle(
                  fontSize: 50,
                ),
                children: [
                  LinkableSpan(
                    inlineSpan: TextSpan(
                      text: 'Tokens',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Color(0xFF263156),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          debugPrint('Link clicked');
                        },
                    ),
                  ),
                  const TextSpan(text: ' to start projects'),
                ],
              ),
            ),
            Image.asset('assets/token1.png'),
          ],
        ),
      ),
    );
  }
}

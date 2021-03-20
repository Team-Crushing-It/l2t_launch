import 'dart:math' as math;

import 'package:flutter/material.dart';

class CoinFlip extends StatefulWidget {
  const CoinFlip({Key? key}) : super(key: key);
  @override
  _CoinFlipState createState() => _CoinFlipState();
}

class _CoinFlipState extends State<CoinFlip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  bool flip = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    )
      // ..reverse()
      ..repeat();

    _rotateAnimation = Tween<double>(begin: 0.0, end: 2.0 * math.pi)
        // .chain(CurveTween(curve: Curves.easeOutQuart))
        .animate(_controller); // 回転×３
    // _scaleAnimation = Tween<double>(begin: 0.0, end: 2.0)
    //     .chain(CurveTween(curve: Curves.easeOutQuart))
    //     .animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(_controller.value);
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Widget 3D化指定
              ..rotateY(_rotateAnimation.value), // Widget 拡大
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Image.asset('token1.png')
                // : Image.asset('token2.png'),
                ),
          );
        });
  }
}

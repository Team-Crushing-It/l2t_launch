import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HoverLogo extends StatefulWidget {
  const HoverLogo({
    Key? key,
    required this.onTap,
    required this.visible,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool visible;

  @override
  _HoverLogoState createState() => _HoverLogoState();
}

class _HoverLogoState extends State<HoverLogo> {
  Timer? tick;
  bool isHovering = false;
  Image? imageBlk;
  int position = 0;
  Random finalPosition = Random();

  void startAnimate() {
    tick = Timer.periodic(
      const Duration(milliseconds: 3000),
      (timer) {
        // print(position);
        setState(() {
          position = finalPosition.nextInt(6);
        });
      },
    );
  }

  void stopAnimate() {
    tick?.cancel();
  }

  @override
  void initState() {
    super.initState();
    startAnimate();

    imageBlk = Image.asset('assets/hoverLogo/black.png');
  }

  @override
  void dispose() {
    tick?.cancel();
    super.dispose();
  }

  // Caching the image
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(imageBlk!.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () => widget.onTap(),
        onHover: (hovering) {
          // If NOT on homepage, run the hover trick. Else, ignore.
          setState(() {
            isHovering = hovering;
          });
          if (!hovering) {
            startAnimate();
          } else {
            stopAnimate();
          }
        },
        child: L2TLogo(position: position));
  }
}

class L2TLogo extends StatefulWidget {
  const L2TLogo({Key? key, required this.position}) : super(key: key);

  final int position;
  @override
  _L2TLogoState createState() => _L2TLogoState();
}

class _L2TLogoState extends State<L2TLogo> {
  late Image image1;
  late Image image2;
  late Image image3;
  late Image image4;
  late Image image5;
  late Image image6;
  late Image image7;
  late List<Image> images;

  @override
  void initState() {
    super.initState();

    image1 = Image.asset('assets/hoverLogo/1.png');
    image2 = Image.asset('assets/hoverLogo/2.png');
    image3 = Image.asset('assets/hoverLogo/3.png');
    image4 = Image.asset('assets/hoverLogo/4.png');
    image5 = Image.asset('assets/hoverLogo/5.png');
    image6 = Image.asset('assets/hoverLogo/6.png');
    image7 = Image.asset('assets/hoverLogo/7.png');

    images = [
      image1,
      image2,
      image3,
      image4,
      image5,
      image6,
      image7,
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    precacheImage(image4.image, context);
    precacheImage(image5.image, context);
    precacheImage(image6.image, context);
    precacheImage(image7.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: images[widget.position],
      ),
    );
  }
}

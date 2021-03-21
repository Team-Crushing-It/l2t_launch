import 'package:flutter/material.dart';
import '../../../extensions.dart';
import 'help_item.dart';
import 'help_model.dart';

class HelpDropdown extends StatefulWidget {
  @override
  _HelpDropdownState createState() => _HelpDropdownState();
}

class _HelpDropdownState extends State<HelpDropdown> {
  HelpItem? selectedItem;
  final List<HelpItem> helpItems = const [
    HelpItem(
      title: 'Tour',
      subtitle: 'Start here for a quick overview of the site',
    ),
    HelpItem(
      title: 'Help Center',
      subtitle: 'Detailed answers to any questions you might have',
    ),
    HelpItem(
      title: 'Meta',
      subtitle: 'Discuss the workings and policies of the site',
    ),
    HelpItem(
      title: 'About Us',
      subtitle: 'Learn more about L2T the company',
    ),
  ];

  Offset _rect(BuildContext context) {
    final box = context.findRenderObject()! as RenderBox;
    return box.localToGlobal(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.help),
      onPressed: () {
        Navigator.of(context).push(
          OverlayRoute(
            (_, animation, secAnimation) {
              final _textPainter = TextPainter(
                text: const TextSpan(
                  text: 'Detailed answers to any questions you might have',
                ),
              )
                ..textDirection = TextDirection.ltr
                ..layout();
              return Stack(
                children: [
                  Positioned(
                    top: _rect(context).dy + 50,
                    left: _rect(context).dx - _textPainter.width,
                    child: SizedBox(
                      width: _textPainter.width + 20,
                      child: Material(
                        color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: helpItems.map((e) {
                            return HelpWidget(e);
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class OverlayRoute extends ModalRoute {
  OverlayRoute(this.page);

  final Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) page;

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Overlay';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      page(context, animation, secondaryAnimation);

  @override
  bool get maintainState => false;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => 500.milliseconds;
}

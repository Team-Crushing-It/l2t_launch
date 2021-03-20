import 'package:flutter/material.dart';
import 'package:l2t_launch/navigation/navbar/help/help_model.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget(this.helpItem);
  final HelpItem helpItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            helpItem.title ?? '',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(helpItem.subtitle ?? ''),
        ],
      ),
    );
  }
}

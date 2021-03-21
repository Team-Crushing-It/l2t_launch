import 'package:flutter/material.dart';

import 'help_model.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget(this.helpItem);
  final HelpItem helpItem;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        helpItem.title ?? '',
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        helpItem.subtitle ?? '',
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

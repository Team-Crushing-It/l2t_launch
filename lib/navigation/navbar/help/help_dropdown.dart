import 'package:flutter/material.dart';
import 'package:l2t_launch/navigation/navbar/help/help_item.dart';
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
  @override
  Widget build(BuildContext context) {
    return DropdownButton<HelpItem>(
      icon: const Icon(Icons.help),
      value: selectedItem,
      underline: Container(),
      onChanged: (HelpItem? helpItem) {
        setState(() {
          selectedItem = helpItem;
        });
      },
      items: helpItems.map<DropdownMenuItem<HelpItem>>((e) {
        return DropdownMenuItem(
          // value: HelpWidget(e),
          child: HelpWidget(e),
        );
      }).toList(),
    );
  }
}

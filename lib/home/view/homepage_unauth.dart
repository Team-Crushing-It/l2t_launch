import 'package:flutter/material.dart';
import 'package:l2t_launch/navigation/navbar/navbar.dart';
import 'package:l2t_launch/counter/view/counter_page.dart';

class HomePageUnAuth extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePageUnAuth());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: NavBar(), body: const Text('Homepage'));
  }
}

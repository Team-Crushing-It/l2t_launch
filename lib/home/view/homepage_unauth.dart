import 'package:flutter/material.dart';
import '../../navigation/navbar/navbar.dart';
import '../home.dart';

class HomePageUnAuth extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePageUnAuth());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: ListView(
        children: const [
          HomePageTopSection(),
          HomePageStartProjectSection(),
          HomePageConnectNowSection(),
        ],
      ),
    );
  }
}

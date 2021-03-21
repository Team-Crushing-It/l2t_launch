import 'package:flutter/material.dart';
import 'user_balance.dart';
import 'user_icon.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: UserIcon(),
        ),
        const Padding(
          padding: EdgeInsets.all(2.0),
          child: UserBalance(3),
        ),
      ],
    );
  }
}

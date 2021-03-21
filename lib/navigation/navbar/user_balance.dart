import 'package:flutter/material.dart';

class UserBalance extends StatelessWidget {
  const UserBalance(this.userBalance);
  final int userBalance;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Text(userBalance.toString()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: SizedBox(width: 20, child: Image.asset('token1.png')),
        ),
      ],
    );
  }
}

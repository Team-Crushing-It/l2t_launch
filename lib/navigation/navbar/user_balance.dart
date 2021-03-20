import 'package:flutter/material.dart';
import 'coinflip.dart';

class UserBalance extends StatelessWidget {
  const UserBalance(this.userBalance);
  final int userBalance;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Text(
            userBalance.toString(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Container(width: 20, child: Image.asset('token1.png')),
        ),
      ],
    );
  }
}

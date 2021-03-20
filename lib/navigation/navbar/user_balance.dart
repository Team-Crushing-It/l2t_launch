import 'package:flutter/material.dart';
import 'coinflip.dart';

class UserBalance extends StatelessWidget {
  const UserBalance(this.userBalance);
  final int userBalance;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(userBalance.toString()),
        SizedBox(height: 20, child: const CoinFlip()),
      ],
    );
  }
}

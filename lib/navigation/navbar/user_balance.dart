import 'package:flutter/material.dart';

class UserBalance extends StatelessWidget {
  const UserBalance(this.userBalance);
  final int userBalance;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(userBalance.toString()),
        const Icon(Icons.wallet_giftcard),
      ],
    );
  }
}

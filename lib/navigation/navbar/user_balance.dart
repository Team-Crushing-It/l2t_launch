import 'package:flutter/material.dart';
import 'package:l2t_launch/user/cubit/user_info_cubit.dart';
import 'coinflip.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBalance extends StatelessWidget {
  // const UserBalance(this.userBalance);
  // final int userBalance;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: BlocBuilder<UserInfoCubit, UserInfoState>(
            builder: (context, state) {
              if (state is UserInfoLoaded) {
                return Text(
                  state.userInfo.balance.toString(),
                  style: const TextStyle(color: Colors.black),
                );
              }
              return const Text('Loading');
            },
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/authentication.dart';
import '../../navigation/navbar/navbar.dart';

class HomePageAuth extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: HomePageAuth());

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthenticationBloc>().state.user;

    return Scaffold(
      appBar: NavBar(),
      body: Center(child: Text(user.email)),
    );
  }
}

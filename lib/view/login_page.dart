import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:authentication_repository/authentication_repository.dart';
import '../authentication/authentication.dart';
import '../login/login.dart';

class LoginPage extends StatelessWidget {
  static Page page() => MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(AuthenticationRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          leading: BackButton(
            onPressed: () {
              context.flow<AuthenticationState>().complete();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

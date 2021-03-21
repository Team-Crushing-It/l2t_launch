import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/authentication.dart';
import '../login.dart';

class LoginPage extends StatelessWidget {
  // static Page page() => MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        // Once authenticated, we want to pop the screen back to the home page
        if (state.status == AuthenticationStatus.authenticated) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          // leading: BackButton(
          //   onPressed: () {
          //     context.flow<AuthenticationState>().complete();
          //   },
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 64.0, vertical: 64.0),
                  color: Colors.grey[200],
                  child: LoginForm()),
            ),
          ),
        ),
      ),
    );
  }
}

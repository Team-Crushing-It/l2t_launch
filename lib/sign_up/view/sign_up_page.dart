import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2t_launch/authentication/bloc/authentication_bloc.dart';

import '../sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  // static Route route() {
  //   return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  // }

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
        appBar: AppBar(title: const Text('Sign Up')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                padding: const EdgeInsets.symmetric(
                    horizontal: 64.0, vertical: 64.0),
                color: Colors.grey[200],
                child: SignUpForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

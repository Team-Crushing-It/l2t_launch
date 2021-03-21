import 'package:flutter/material.dart';

import '../sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  // static Route route() {
  //   return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              padding:
                  const EdgeInsets.symmetric(horizontal: 64.0, vertical: 64.0),
              color: Colors.grey[200],
              child: SignUpForm(),
            ),
          ),
        ),
      ),
    );
  }
}

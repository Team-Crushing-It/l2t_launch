import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:l2t_launch/app/app.dart';
import 'package:l2t_launch/app/app_bloc_observer.dart';
import 'package:authentication_repository/authentication_repository.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(App(authenticationRepository: AuthenticationRepository())),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

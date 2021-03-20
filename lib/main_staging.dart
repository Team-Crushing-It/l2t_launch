import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:l2t_launch/app/app.dart';
import 'package:l2t_launch/app/app_bloc_observer.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

// ignore: avoid_void_async
void main() async {
  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  EquatableConfig.stringify = kDebugMode;

  await Firebase.initializeApp();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(App(authenticationRepository: AuthenticationRepository())),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

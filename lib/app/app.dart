import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../authentication/authentication.dart';
import '../home/home.dart';
import '../l10n/l10n.dart';
import '../login/login.dart';
import '../navigation/cubit/navigation_cubit.dart';
import '../sign_up/sign_up.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (_) => NavigationCubit(),
          )
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: const Color(0xFF13B9FF),
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        '/': (context) => Home(),
        '/login': (context) {
          return BlocProvider(
            create: (context) =>
                LoginCubit(context.read<AuthenticationRepository>()),
            child: LoginPage(),
          );
        },
        '/signup': (context) {
          return BlocProvider(
            create: (context) =>
                SignUpCubit(context.read<AuthenticationRepository>()),
            child: const SignUpPage(),
          );
        },
      },
      initialRoute: '/',
      // builder: (context, child) {
      //   return FlowBuilder<NavigationState>(
      //     state: context.select((NavigationCubit cubit) => cubit.state),
      //     onGeneratePages: (NavigationState state, List<Page> pages) {
      //       switch (state) {
      //         case NavigationState.home:
      //           return [Home.page()];
      //         // case NavigationState.learn:
      //         //   return [Learn.page()];
      //         // case NavigationState.page2:
      //         //   return [Page2.page()];
      //         default:
      //           return [Home.page()];
      //       }
      //     },
      //   );
      // },
    );
  }
}

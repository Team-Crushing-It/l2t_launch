import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2t_launch/authentication/authentication.dart';
import 'package:l2t_launch/login/login.dart';
import 'package:l2t_launch/login_flow/login_flow.dart';

import 'package:l2t_launch/navigation/navbar/help/help_dropdown.dart';
import 'package:l2t_launch/navigation/navbar/user_balance.dart';

import 'user_info.dart';

import './hoverLogo.dart';
import '../cubit/navigation_cubit.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final stateNav = context.watch<NavigationCubit>().state;
    final stateAuth = context.watch<AuthenticationBloc>().state.status;
    return NavBarView(stateNav: stateNav, statusAuth: stateAuth);
  }
}

class NavBarView extends StatefulWidget {
  const NavBarView({
    required this.stateNav,
    required this.statusAuth,
  });

  final NavigationState stateNav;
  final AuthenticationStatus statusAuth;

  @override
  _NavBarViewState createState() => _NavBarViewState();
}

void onPressed() {
  print('pressed');
}

class _NavBarViewState extends State<NavBarView> {
  @override
  Widget build(BuildContext context) {
    return
        // true
        widget.statusAuth == AuthenticationStatus.authenticated
            ? AppBar(
                title: HoverLogo(
                  onTap: () => {},
                  visible: true,
                ),
                actions: <Widget>[
                  //? Can anyone get this working?
                  // HelpDropdown(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: UserInfo(),
                  ),

                  IconButton(
                    icon: const Icon(Icons.inbox),
                    onPressed: () {
                      // Open inbox dropdown
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.star),
                    onPressed: () {
                      // Open help menu
                    },
                  ),

                  IconButton(
                    icon: const Icon(Icons.help),
                    onPressed: () {
                      // Open help menu
                    },
                  ),

                  IconButton(
                    key: const Key('homePage_logout_iconButton'),
                    icon: const Icon(Icons.exit_to_app),
                    onPressed: () => context
                        .read<AuthenticationBloc>()
                        .add(AuthenticationLogoutRequested()),
                  )
                ],
              )

            // UnAuthenticaed NavBar ====================================
            : AppBar(
                title: HoverLogo(
                  onTap: () => {},
                  visible: true,
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                      ),
                      onPressed: () async {
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () async {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: const Text(
                        'Sign-up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
  }
}

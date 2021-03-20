import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l2t_launch/authentication/authentication.dart';
import 'package:l2t_launch/login/login.dart';
import 'package:l2t_launch/login_flow/login_flow.dart';
import 'package:l2t_launch/navigation/navbar/help/help_dropdown.dart';
import 'package:l2t_launch/navigation/navbar/user_balance.dart';

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
                title: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1),
                  child: HoverLogo(
                    onTap: () => context.read<NavigationCubit>().home(),
                    visible:
                        // ignore: avoid_bool_literals_in_conditional_expressions
                        widget.stateNav == NavigationState.home ? false : true,
                  ),
                ),
                actions: <Widget>[
                  //? Can anyone get this working?
                  // HelpDropdown(),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      // Open user profile page
                    },
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const UserBalance(3),
                  const SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    icon: const Icon(Icons.inbox),
                    onPressed: () {
                      // Open inbox dropdown
                    },
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    icon: const Icon(Icons.star),
                    onPressed: () {
                      // Open help menu
                    },
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  IconButton(
                    icon: const Icon(Icons.help),
                    onPressed: () {
                      // Open help menu
                    },
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                ],
              )
            // UnAuthenticaed NavBar ====================================
            : AppBar(
                title: HoverLogo(
                  onTap: () => context.read<NavigationCubit>().home(),
                  visible:
                      // ignore: avoid_bool_literals_in_conditional_expressions
                      widget.stateNav == NavigationState.home ? false : true,
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

    // AppBar(
    //   actions: [
    // IconButton(
    //   color: widget.stateNav == NavigationState.home
    //       ? Colors.red
    //       : Colors.black,
    //   icon: const Icon(Icons.home_outlined),
    //   onPressed: () => {
    //     context.read<NavigationCubit>().home(),
    //   },
    // ),
    // IconButton(
    //   color: widget.stateNav == NavigationState.page1
    //       ? Colors.red
    //       : Colors.black,
    //   icon: const Icon(Icons.access_alarm_outlined),
    //   onPressed: () => {
    //     context.read<NavigationCubit>().page1(),
    //   },
    // ),
    // IconButton(
    //   color: widget.stateNav == NavigationState.page2
    //       ? Colors.red
    //       : Colors.black,
    //   icon: const Icon(Icons.ac_unit_outlined),
    //   onPressed: () => {
    //     context.read<NavigationCubit>().page2(),
    //   },
    // ),
    //     widget.statusAuth == AuthenticationStatus.unauthenticated
    //         ? Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: OutlinedButton(
    //                 child: const Text('Sign-up',
    //                     style: (TextStyle(color: Colors.white))),
    //                 onPressed: () {}),
    //           )
    //         : Container(),
    //     widget.statusAuth == AuthenticationStatus.unauthenticated
    //         ? Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: OutlinedButton(
    //                 child: const Text('login',
    //                     style: (TextStyle(color: Colors.white))),
    //                 onPressed: () {}),
    //           )
    //         : Container()
    //   ],
    // );
  }
}

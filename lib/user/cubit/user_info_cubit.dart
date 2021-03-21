import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:l2t_launch/authentication/authentication.dart';
import 'package:l2t_launch/navigation/navbar/user_info.dart';
import 'package:l2t_launch/user/user_model.dart';
import 'package:meta/meta.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit(
    this.authenticationBloc,
  ) : super(UserInfoInitial()) {
    authenticationSubscription = authenticationBloc.listen((state) {
      if (state.status == AuthenticationStatus.authenticated) {
        print('Adding user to Firestore');
        FirebaseFirestore.instance.collection('users').doc(state.user.id).set({
          'first_name': state.user.email,
          'last_name': state.user.email,
          'balance': 12,
        });
        documentStream = FirebaseFirestore.instance
            .collection('users')
            .doc(state.user.id)
            .snapshots()
              ..listen((event) {
                print(event.data());
                emit(
                  UserInfoLoaded(
                    UserInfoModel(
                      event.data()!['first_name'],
                      event.data()!['last_name'],
                      event.data()!['balance'],
                    ),
                  ),
                );
              });
      }
    });
  }

  final AuthenticationBloc authenticationBloc;
  late StreamSubscription authenticationSubscription;
  late Stream<DocumentSnapshot> documentStream;

  @override
  Future<void> close() {
    authenticationSubscription.cancel();
    return super.close();
  }

  // Listen to authentication bloc for when user has been authenticated

}

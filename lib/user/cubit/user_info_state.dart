part of 'user_info_cubit.dart';

@immutable
abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  UserInfoLoaded(this.userInfo);
  final UserInfoModel userInfo;
}

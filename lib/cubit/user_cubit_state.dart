import 'package:cubit_api/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserCubitState extends Equatable {
  const UserCubitState();
}

class UserCubitInit extends UserCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserCubitLoading extends UserCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserCubitData extends UserCubitState {
  List<UserModel> userList;
  UserCubitData({required this.userList});

  @override
  // TODO: implement props
  List<Object?> get props => [userList];
}

class UserCubitError extends UserCubitState {
  String message;
  UserCubitError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

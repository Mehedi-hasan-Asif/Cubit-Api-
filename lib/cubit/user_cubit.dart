import 'package:cubit_api/cubit/user_cubit_state.dart';
import 'package:cubit_api/service/api_service.dart';
import 'package:cubit_api/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserCubitState> {
  List<UserModel> userList = [];
  ApiService apiService;
  UserCubit({required this.apiService}) : super(UserCubitInit());
  void getAllUserList() async {
    try {
      emit(UserCubitLoading());
      userList = await apiService.getData();
      emit(UserCubitData(userList: userList));
    } catch (e) {
      emit(UserCubitError(message: e.toString()));
    }
  }
}

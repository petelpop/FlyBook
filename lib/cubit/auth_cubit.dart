import 'package:airplane/models/user.dart';
import 'package:airplane/services/auth_service.dart';
import 'package:airplane/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthServices service = AuthServices();

  void signUp({required String email, required String password, required String name, String hobby = ''}) async{
    try {
      emit(AuthLoading());
      UserModel data = await service.signUp(email: email, password: password, name: name, hobby: hobby);
      emit(AuthSuccess(data));
    } catch (e) {
      emit(AuthFailed("error : $e"));
    }
  }

  void signOut() async{
    try {
      emit(AuthLoading());
      await AuthServices().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed("error : $e"));
    }
  }

  void getCurrentUser(String id) async{
    try {
      UserModel data = await UserService().getUserByID(id);
      emit(AuthSuccess(data));
    } catch (e) {
      emit(AuthFailed('error : $e'));
    }
  }
}

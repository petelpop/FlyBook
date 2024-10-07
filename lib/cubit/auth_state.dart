part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserModel data;

  AuthSuccess(this.data);

  @override
  List<Object> get props => [data];
}

final class AuthFailed extends AuthState{
  final String message;

  AuthFailed(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
part of 'auth_cubit.dart';

@Freezed()
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoggedin,
  }) = _AuthState;
}

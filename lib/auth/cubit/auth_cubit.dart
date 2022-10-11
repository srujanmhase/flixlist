import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());

  void checkUserState() {
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        return emit(state.copyWith(isLoggedin: false));
      } else {
        return emit(state.copyWith(isLoggedin: true));
      }
    });
  }
}

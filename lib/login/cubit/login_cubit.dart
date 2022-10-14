import 'package:bloc/bloc.dart';
import 'package:flixlist/auth/auth_repository.dart';
import 'package:flixlist/services/firestore_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepository, this.firestoreRepository)
      : super(LoginState());
  AuthRepository authRepository;
  FirestoreRepository firestoreRepository;
  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isProcessing: true));
    try {
      return await authRepository
          .createUserAccount(email: email, password: password)
          .then(
            (value) => firestoreRepository.createUserRecord(
              authRepository.getUser()?.uid ?? '',
            ),
          );
    } catch (e) {
      return emit(state.copyWith(isProcessing: false, error: e.toString()));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(isProcessing: true));
    try {
      await authRepository.signIn(email: email, password: password);
      return emit(state.copyWith(isProcessing: false));
    } catch (e) {
      return emit(state.copyWith(isProcessing: false, error: e.toString()));
    }
  }
}

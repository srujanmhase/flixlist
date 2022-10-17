import 'package:bloc/bloc.dart';
import 'package:flixlist/auth/auth_repository.dart';
import 'package:flixlist/models/list/list.dart';
import 'package:flixlist/services/firestore_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_to_list_state.dart';
part 'add_to_list_cubit.freezed.dart';

class AddToListCubit extends Cubit<AddToListState> {
  AddToListCubit(this.authRepository, this.firestoreRepository)
      : super(const AddToListState());
  final AuthRepository authRepository;
  final FirestoreRepository firestoreRepository;
  Future<void> fetchYourLists() async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = authRepository.getUser();

      final firestoreData = await firestoreRepository.fetchUserLists(
        user?.uid ?? '',
      );

      List<MovieList> movieLists = [];

      for (final list in firestoreData.privateLists) {
        movieLists.add(
          MovieList(
            uuid: list.uuid,
            title: list.title,
            private: list.private,
            movies: [],
          ),
        );
      }

      for (final list in firestoreData.publicLists) {
        movieLists.add(
          MovieList(
            uuid: list.uuid,
            title: list.title,
            private: list.private,
            movies: [],
          ),
        );
      }

      return emit(
        state.copyWith(
          isLoading: false,
          yourLists: movieLists,
        ),
      );
    } catch (e) {
      return emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> addMovieToExistingList({
    required String listID,
    required String movieID,
    required bool private,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = authRepository.getUser();
      if (private) {
        await firestoreRepository.addMovieToPrivateList(
          user?.uid ?? '',
          listID,
          movieID,
        );
      } else {
        await firestoreRepository.addMovieToPublicList(
          user?.uid ?? '',
          listID,
          movieID,
        );
      }
      return emit(
        state.copyWith(
          isLoading: false,
          movieAdded: true,
        ),
      );
    } catch (e) {
      return emit(
        state.copyWith(
          isLoading: false,
          movieAdded: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> addMovieToNewList({
    required String listName,
    required String movieID,
    required bool private,
  }) async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = authRepository.getUser();
      if (private) {
        final listID = await firestoreRepository.createNewPrivateList(
          user?.uid ?? '',
          listName,
        );
        await firestoreRepository.addMovieToPrivateList(
          user?.uid ?? '',
          listID,
          movieID,
        );
      } else {
        final listID = await firestoreRepository.createNewPublicList(
          user?.uid ?? '',
          listName,
        );
        await firestoreRepository.addMovieToPublicList(
          user?.uid ?? '',
          listID,
          movieID,
        );
      }
      return emit(
        state.copyWith(
          isLoading: false,
          movieAdded: true,
        ),
      );
    } catch (e) {
      return emit(
        state.copyWith(
          isLoading: false,
          movieAdded: false,
          error: e.toString(),
        ),
      );
    }
  }
}

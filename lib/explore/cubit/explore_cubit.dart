import 'package:bloc/bloc.dart';
import 'package:flixlist/models/list/list.dart';
import 'package:flixlist/models/movie/movie.dart';
import 'package:flixlist/movie/movie_repository.dart';
import 'package:flixlist/services/firestore_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_state.dart';
part 'explore_cubit.freezed.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit(this.firestoreRepository, this.movieRepository)
      : super(ExploreState());
  final FirestoreRepository firestoreRepository;
  final MovieRepository movieRepository;
  Future<void> fetchExplorePage() async {
    try {
      emit(state.copyWith(isLoading: true));
      final firestoreData = await firestoreRepository.fetchPublicLists();
      List<MovieList> movieLists = [];

      for (final list in firestoreData) {
        List<Movie> movieList = [];

        for (final movie in list.list) {
          final data = await movieRepository.fetchMovieFromID(movie);
          movieList.add(data);
        }

        MovieList movieListObj = MovieList(
          uuid: list.uuid,
          title: list.title,
          private: list.private,
          movies: movieList,
        );

        movieLists.add(movieListObj);
      }
      return emit(state.copyWith(
        isLoading: false,
        lists: movieLists,
      ));
    } catch (e) {
      return emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}

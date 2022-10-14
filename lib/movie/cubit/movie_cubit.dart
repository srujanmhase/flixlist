import 'package:bloc/bloc.dart';
import 'package:flixlist/models/movie/movie.dart';
import 'package:flixlist/movie/movie_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_state.dart';
part 'movie_cubit.freezed.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.movieRepository) : super(MovieState());
  final MovieRepository movieRepository;

  Future<void> fetchMovieFromName(String name) async {
    emit(state.copyWith(isLoading: true));
    try {
      final movie = await movieRepository.fetchMovieFromName(name);
      return emit(
        state.copyWith(
          isLoading: false,
          movie: movie,
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

  Future<void> fetchMovieFromID(String id) async {
    emit(state.copyWith(isLoading: true));
    try {
      final movie = await movieRepository.fetchMovieFromID(id);
      return emit(
        state.copyWith(
          isLoading: false,
          movie: movie,
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
}

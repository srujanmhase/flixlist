import 'package:bloc/bloc.dart';
import 'package:flixlist/models/movie/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_state.dart';
part 'movie_cubit.freezed.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieState());

  Future<void> fetchMovie(String name) async {}
}

import 'package:bloc/bloc.dart';
import 'package:flixlist/auth/auth_repository.dart';
import 'package:flixlist/models/list/list.dart';
import 'package:flixlist/models/movie/movie.dart';
import 'package:flixlist/movie/movie_repository.dart';
import 'package:flixlist/services/firestore_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.firestoreRepository, this.movieRepository, this.authRepository)
      : super(HomeState());
  FirestoreRepository firestoreRepository;
  final MovieRepository movieRepository;
  final AuthRepository authRepository;

  Future<void> fetchHomeData() async {
    emit(state.copyWith(isLoading: true));
    try {
      final user = authRepository.getUser();

      final firestoreData = await firestoreRepository.fetchUserLists(
        user?.uid ?? '',
      );

      List<MovieList> movieLists = [];

      for (final list in firestoreData.privateLists) {
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

      for (final list in firestoreData.publicLists) {
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
      List<Movie> featuredMovieList = [];
      final featureData = await firestoreRepository.fetchFeaturedMovies();
      for (final id in featureData.list) {
        final movie = await movieRepository.fetchMovieFromID(id);
        featuredMovieList.add(movie);
      }
      return emit(
        state.copyWith(
          isLoading: false,
          featuredList: MovieList(
            uuid: '',
            title: 'Featured Movies',
            private: false,
            movies: featuredMovieList,
          ),
          yourLists: movieLists,
        ),
      );
    } catch (e, s) {
      debugPrint('$e $s');
      return emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }
}

part of 'movie_cubit.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState({
    @Default(false) bool isLoading,
    Movie? movie,
  }) = _MovieState;
}

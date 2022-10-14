part of 'movie_cubit.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState({
    @Default(false) bool isLoading,
    String? error,
    Movie? movie,
  }) = _MovieState;
}

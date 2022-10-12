part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(<MovieList>[]) List<MovieList> yourLists,
    MovieList? featuredList,
    String? error,
  }) = _HomeState;
}

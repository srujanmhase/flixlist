part of 'explore_cubit.dart';

@freezed
class ExploreState with _$ExploreState {
  const factory ExploreState({
    @Default(<MovieList>[]) List<MovieList> lists,
    String? error,
    @Default(false) bool isLoading,
  }) = _ExploreState;
}

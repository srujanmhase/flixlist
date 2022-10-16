part of 'add_to_list_cubit.dart';

@freezed
class AddToListState with _$AddToListState {
  const factory AddToListState({
    @Default(false) bool isLoading,
    @Default(<MovieList>[]) List<MovieList> yourLists,
    @Default(false) bool movieAdded,
    String? error,
  }) = _AddToListState;
}

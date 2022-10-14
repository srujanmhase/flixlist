import 'package:flixlist/models/movie/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list.freezed.dart';
part 'list.g.dart';

@Freezed()
class MovieList with _$MovieList {
  const factory MovieList({
    required String uuid,
    required String title,
    required bool private,
    required List<Movie> movies,
  }) = _MovieList;

  factory MovieList.fromJson(Map<String, dynamic> json) =>
      _$MovieListFromJson(json);
}

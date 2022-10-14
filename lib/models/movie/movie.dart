import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@Freezed()
class Movie with _$Movie {
  const factory Movie({
    required String imdbID,
    required String Title,
    required String Year,
    required String Plot,
    required String Poster,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

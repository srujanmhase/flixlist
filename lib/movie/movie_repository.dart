import 'package:dio/dio.dart';
import 'package:flixlist/models/movie/movie.dart';

class MovieRepository {
  const MovieRepository(this._client);

  final Dio _client;

  Future<Movie> fetchMovieFromName(String name) async {
    final data = await _client.get('t=$name');
    final movie = Movie.fromJson(data.data as Map<String, dynamic>);
    return movie;
  }

  Future<Movie> fetchMovieFromID(String id) async {
    final data = await _client.get('i=$id');
    final movie = Movie.fromJson(data.data as Map<String, dynamic>);
    return movie;
  }
}

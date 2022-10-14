// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieList _$$_MovieListFromJson(Map<String, dynamic> json) => _$_MovieList(
      uuid: json['uuid'] as String,
      title: json['title'] as String,
      private: json['private'] as bool,
      movies: (json['movies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MovieListToJson(_$_MovieList instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'title': instance.title,
      'private': instance.private,
      'movies': instance.movies,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      imdbID: json['imdbID'] as String,
      Title: json['Title'] as String,
      Year: json['Year'] as String,
      Plot: json['Plot'] as String,
      Poster: json['Poster'] as String,
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'imdbID': instance.imdbID,
      'Title': instance.Title,
      'Year': instance.Year,
      'Plot': instance.Plot,
      'Poster': instance.Poster,
    };

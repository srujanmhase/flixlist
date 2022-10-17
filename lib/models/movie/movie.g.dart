// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movie _$$_MovieFromJson(Map<String, dynamic> json) => _$_Movie(
      Title: json['Title'] as String,
      Year: json['Year'] as String,
      Plot: json['Plot'] as String,
      Poster: json['Poster'] as String,
      Type: json['Type'] as String,
      imdbID: json['imdbID'] as String,
    );

Map<String, dynamic> _$$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'Title': instance.Title,
      'Year': instance.Year,
      'Plot': instance.Plot,
      'Poster': instance.Poster,
      'Type': instance.Type,
      'imdbID': instance.imdbID,
    };

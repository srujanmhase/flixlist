// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestorelist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirestoreList _$$_FirestoreListFromJson(Map<String, dynamic> json) =>
    _$_FirestoreList(
      title: json['title'] as String,
      private: json['private'] as bool,
      list: (json['list'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_FirestoreListToJson(_$_FirestoreList instance) =>
    <String, dynamic>{
      'title': instance.title,
      'private': instance.private,
      'list': instance.list,
    };

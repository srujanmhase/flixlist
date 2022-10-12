import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestorelist.freezed.dart';
part 'firestorelist.g.dart';

@Freezed()
class FirestoreList with _$FirestoreList {
  const factory FirestoreList({
    required String title,
    required bool private,
    required List<String> list,
  }) = _FirestoreList;

  factory FirestoreList.fromJson(Map<String, dynamic> json) =>
      _$FirestoreListFromJson(json);
}

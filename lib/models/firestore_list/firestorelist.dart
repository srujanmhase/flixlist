import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreList {
  const FirestoreList({
    required this.uuid,
    required this.title,
    required this.private,
    required this.list,
  });

  final String uuid;
  final String title;
  final bool private;
  final List<String> list;

  factory FirestoreList.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return FirestoreList(
      uuid: data?['uuid'],
      title: data?['title'],
      private: data?['private'],
      list: data?['list'] is Iterable ? List.from(data?['list']) : [],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "uuid": uuid,
      "title": title,
      "private": private,
      "list": list,
    };
  }
}

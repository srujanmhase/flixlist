import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flixlist/models/firestore_list/firestorelist.dart';
import 'package:flixlist/models/user/userdata.dart';
import 'package:random_string/random_string.dart';

class FirestoreRepository {
  const FirestoreRepository(this._instance);
  final FirebaseFirestore _instance;

  Future<void> createUserRecord(String uuid) async {
    await _instance.collection('users').doc(uuid).set(
      <String, dynamic>{
        'private': [],
        'public': [],
      },
    );
  }

  Future<String> createNewPrivateList(String uuid, String name) async {
    final listID = randomAlphaNumeric(10);
    await _instance.collection('users').doc(uuid).update({
      'public': FieldValue.arrayUnion([listID]),
    });

    await _instance.collection('private').doc(listID).set({
      "uuid": listID,
      "title": name,
      "private": true,
      "list": [],
    });
    return listID;
  }

  Future<String> createNewPublicList(String uuid, String name) async {
    final listID = randomAlphaNumeric(10);
    await _instance.collection('users').doc(uuid).update({
      'public': FieldValue.arrayUnion([listID]),
    });

    await _instance.collection('public').doc(listID).set({
      "uuid": listID,
      "title": name,
      "private": false,
      "list": [],
    });
    return listID;
  }

  Future<void> addMovieToPrivateList(
    String uuid,
    String listID,
    String tmovieID,
  ) async {
    await _instance.collection('private').doc(listID).update({
      'list': FieldValue.arrayUnion([tmovieID]),
    });
  }

  Future<void> addMovieToPublicList(
    String uuid,
    String listID,
    String tmovieID,
  ) async {
    await _instance.collection('public').doc(listID).update({
      'list': FieldValue.arrayUnion([tmovieID]),
    });
  }

  Future<FirestoreList> fetchFeaturedMovies() async {
    final data = await _instance.collection('public').doc('featured').get();
    final list = FirestoreList.fromFirestore(data, null);
    return list;
  }

  Future<RawUserData> fetchUserLists(String uuid) async {
    final data = await _instance.collection('users').doc(uuid).get();

    final userPrivateListIDs = data.data()?['private'] is Iterable
        ? List.from(data.data()?['private'])
        : [];
    final userPublicListIDs = data.data()?['public'] is Iterable
        ? List.from(data.data()?['public'])
        : [];

    final userPrivateLists = <FirestoreList>[];

    final userPublicLists = <FirestoreList>[];

    for (int i = 0; i < userPublicListIDs.length; i++) {
      final data = await _instance
          .collection('public')
          .doc(userPublicListIDs[i] as String)
          .get();
      final list = FirestoreList.fromFirestore(data, null);
      userPublicLists.add(list);
    }

    for (var k = 0; k < userPrivateListIDs.length; k++) {
      final data = await _instance
          .collection('private')
          .doc(userPrivateListIDs[k])
          .get();
      final list = FirestoreList.fromFirestore(data, null);
      userPrivateLists.add(list);
    }

    return RawUserData(
      privateLists: userPrivateLists,
      publicLists: userPublicLists,
    );
  }

  Future<List<FirestoreList>> fetchPublicLists() async {
    final data = await _instance
        .collection('public')
        .where('private', isEqualTo: false)
        .limit(20)
        .get();

    final parsed = data.docs.map((element) {
      return FirestoreList.fromFirestore(element, null);
    }).toList();

    return parsed;
  }
}

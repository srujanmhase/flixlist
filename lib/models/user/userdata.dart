import 'package:flixlist/models/firestore_list/firestorelist.dart';
import 'package:flixlist/models/list/list.dart';

class UserData {
  const UserData({
    required this.privateLists,
    required this.publicLists,
  });

  final List<MovieList> privateLists;
  final List<MovieList> publicLists;
}

class RawUserData {
  const RawUserData({
    required this.privateLists,
    required this.publicLists,
  });

  final List<FirestoreList> privateLists;
  final List<FirestoreList> publicLists;
}

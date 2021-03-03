import 'package:brain_trainer_app/models/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  // 1
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('players');

  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  // 3
  Future<void> addPlayer(Player player) {
    return collection.doc(player.uid).set(player.toJson());
  }

  // 4
  updatePlayer(Player player) async {
    await collection.doc(player.uid).update(player.toJson());
  }

  Future<Player> getPlayer(String uid) async {
    var doc = await collection.doc(uid).get();
    if (doc.data() == null) {
      return null;
    }
    return Player.fromJson(doc.data());
  }
}

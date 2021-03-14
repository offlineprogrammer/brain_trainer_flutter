import 'package:brain_trainer_app/models/player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('players');

  Future<void> addPlayer(Player player) {
    return collection.doc(player.uid).set(player.toJson());
  }

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

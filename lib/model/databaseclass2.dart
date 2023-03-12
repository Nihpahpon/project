import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web/model/chart2.dart';

class DatabaseService2 {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<Data2>> getData() {
    return _firebaseFirestore
        .collection('species')
        .orderBy('species')
        .get()
        .then((querySnapshot) => querySnapshot.docs
            .asMap()
            .entries
            .map((entry) => Data2.fromSnapshot(entry.value, entry.key))
            .toList());
  }
}

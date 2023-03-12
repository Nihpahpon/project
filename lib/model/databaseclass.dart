import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web/model/chart.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<List<Data>> getData() {
    return _firebaseFirestore
        .collection('disease')
        .orderBy('disease')
        .get()
        .then((querySnapshot) => querySnapshot.docs
            .asMap()
            .entries
            .map((entry) => Data.fromSnapshot(entry.value, entry.key))
            .toList());
  }
}

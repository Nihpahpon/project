import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Data2 {
  final int area;
  final String species;
  charts.Color? barColor;

  Data2({
    required this.area,
    required this.species,
    this.barColor,
  }) {
    barColor =
        charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 238, 168, 4));
  }
  factory Data2.fromSnapshot(DocumentSnapshot snapshot, int index) {
    return Data2(
        species: snapshot['species'].toString(), area: snapshot['area']);
  }
}

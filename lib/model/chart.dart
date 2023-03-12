import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Data {
  final int area;
  final String disease;
  charts.Color? barColor;

  Data({
    required this.area,
    required this.disease,
    this.barColor,
  }) {
    barColor =
        charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 5, 110, 61));
  }
  factory Data.fromSnapshot(DocumentSnapshot snapshot, int index) {
    return Data(
        disease: snapshot['disease'].toString(), area: snapshot['area']);
  }
}

import 'package:get/get.dart';
import 'package:web/model/chart2.dart';
import 'package:web/model/databaseclass2.dart';

class DataController2 extends GetxController {
  final DatabaseService2 database2 = DatabaseService2();
  var stats2 = Future.value(<Data2>[]).obs;

  @override
  void onInit() {
    stats2.value = database2.getData();
    super.onInit();
  }
}

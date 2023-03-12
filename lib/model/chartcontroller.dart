import 'package:get/get.dart';
import 'package:web/model/chart.dart';
import 'package:web/model/databaseclass.dart';

class DataController extends GetxController {
  final DatabaseService database = DatabaseService();
  var stats = Future.value(<Data>[]).obs;

  @override
  void onInit() {
    stats.value = database.getData();
    super.onInit();
  }
}

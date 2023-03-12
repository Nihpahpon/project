// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:web/home2.dart';
import 'package:web/model/chart.dart';
import 'package:web/model/chartcontroller.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Data> data;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Data, String>> serise = [
      charts.Series(
        domainFn: (Data serise, _) => serise.disease.toString(),
        measureFn: (Data serise, _) => serise.area,
        colorFn: (Data serise, _) => serise.barColor!,
        id: 'area',
        data: data,
        labelAccessorFn: (Data row, _) => row.disease,
      ),
    ];
    return charts.BarChart(
      serise,
      animate: true,
    );
  }
}

class Showchart extends StatelessWidget {
  Showchart({Key? key}) : super(key: key);

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: SizedBox(
                  child: Text('แสดงจำนวนต้นข้าวโพดที่เกิดโรค'),
                ),
              ),
              FutureBuilder(
                future: dataController.stats.value,
                builder:
                    (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Container(
                        width: 450,
                        height: 400,
                        child: Chart(
                          data: snapshot.data!,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: Text('แกน x คือ ชื่อของโรค' +
                    '\n' +
                    'แกน y คือ จำนวนต้นข้าวโพดที่เกิดโรค (ต้น)'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 240, 201, 8),
                    primary: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const MyHome2();
                    }));
                  },
                  child: const Text(
                    'หน้าถัดไป',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

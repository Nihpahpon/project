// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:web/home.dart';
import 'package:web/model/chart2.dart';
import 'package:web/model/chartcontroller2.dart';

class Chart2 extends StatelessWidget {
  const Chart2({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Data2> data;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Data2, String>> serise = [
      charts.Series(
        domainFn: (Data2 serise, _) => serise.species.toString(),
        measureFn: (Data2 serise, _) => serise.area,
        colorFn: (Data2 serise, _) => serise.barColor!,
        id: 'species',
        data: data,
        labelAccessorFn: (Data2 row, _) => row.species,
      ),
    ];
    return charts.BarChart(
      serise,
      animate: true,
    );
  }
}

class Showchart2 extends StatelessWidget {
  Showchart2({Key? key}) : super(key: key);

  final DataController2 dataController2 = Get.put(DataController2());

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
                  child: Text('แสดงจำนวนต้นข้าวโพดที่เกิดโรคในแต่ละสายพันธุ์'),
                ),
              ),
              FutureBuilder(
                future: dataController2.stats2.value,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Data2>> snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Container(
                        width: 1100,
                        height: 400,
                        child: Chart2(
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
                child: Text('แกน x คือ ชื่อสายพันธุ์ของข้าวโพด' +
                    '\n' +
                    'แกน y คือ จำนวนต้นข้าวโพดที่เกิดโรค (ต้น)'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 4, 127, 57),
                    primary: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const MyHome();
                    }));
                  },
                  child: const Text(
                    'กลับหน้าแรก',
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

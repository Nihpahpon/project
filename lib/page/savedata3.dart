import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:loginapp/page/datamap.dart';
import 'package:loginapp/page/diagnose.dart';
import 'package:loginapp/page/history.dart';
import 'package:loginapp/states/dialog.dart';
import 'package:uuid/uuid.dart';

import '../states/constant.dart';
import '../widgets/title.dart';

class Savedata3 extends StatefulWidget {
  const Savedata3({Key? key}) : super(key: key);

  @override
  State<Savedata3> createState() => _Savedata3State();
}

class _Savedata3State extends State<Savedata3> {
  final formKey = GlobalKey<FormState>();
  String? dropValue2, species;
  final TextEditingController _areaController = TextEditingController();

  String disease = 'โรคใบจุด';
  late String date;
  var now = DateTime.now();
  User? user = FirebaseAuth.instance.currentUser;
  double? lat, lng;
  String? id = Uuid().v1();

  @override
  void initState() {
    super.initState();
    findLatlng();
  }

  Future<void> findLatlng() async {
    LocationData? locationData = await findLocationData();
    setState(() {
      lat = locationData!.latitude!;
      lng = locationData.longitude!;
    });
    print('lat = $lat,log = $lng');
    gatdata();
  }

  Future<LocationData?> findLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;

    return (delay == false)
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 10, 132, 106),
              leading: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Screen2(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              title: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Text(
                  'แบบฟอร์มการเก็บข้อมูลเชิงพื้นที่ที่พบโรค',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.mali(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              behavior: HitTestBehavior.opaque,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle('ตำแหน่งที่ที่พบโรค '),
                      lat == null ? Mystyle().showProgress() : shoeMap(),
                      const SizedBox(
                        height: 20,
                      ),
                      buildprovince(size),
                      buildTitle('วันที่พบโรค '),
                      builddate(size),
                      buildTitle('โรคข้าวโพดที่พบ '),
                      builddisease(size),
                      buildTitle('อายุของต้นข้าวโพดที่พบโรค '),
                      buildAge(size),
                      buildTitle('จำนวนความเสียหายที่พบ '),
                      buildArea(size),
                      buildTitle('สายพันธุ์ข้าวโพดที่ปลูก '),
                      buildSpecies(size),
                      const SizedBox(
                        height: 25,
                      ),
                      buildButton(size),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Row buildprovince(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: MyConstant.dart),
          ),
          width: 350,
          height: 60,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'กรุณาเลือกจังหวัดของคุณ',
                  style: MyConstant().h3Style(),
                ),
              ),
              value: province,
              isExpanded: true,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  province = newValue!;
                });
              },
              items: <String>[
                'กรุงเทพมหานคร',
                'กระบี่',
                'กาญจนบุรี',
                'กาฬสินธุ์',
                'กำแพงเพชร',
                'ขอนแก่น',
                'จันทบุรี',
                'ฉะเชิงเทรา',
                'ชลบุรี',
                'ชัยนาท',
                'ชัยภูมิ',
                'ชุมพร',
                'เชียงราย',
                'เชียงใหม่',
                'ตรัง',
                'ตราด',
                'ตาก',
                'นครนายก',
                'นครปฐม',
                'นครพนม',
                'นครราชสีมา',
                'นครศรีธรรมราช',
                'นครสวรรค์',
                'นนทบุรี',
                'นราธิวาส',
                'น่าน',
                'บึงกาฬ',
                'บุรีรัมย์',
                'ปทุมธานี',
                'ประจวบคีรีขันธ์',
                'ปราจีนบุรี',
                'ปัตตานี',
                'พระนครศรีอยุธยา',
                'พังงา',
                'พัทลุง',
                'พิจิตร',
                'พิษณุโลก',
                'เพชรบุรี',
                'เพชรบูรณ์',
                'แพร่',
                'พะเยา',
                'ภูเก็ต',
                'มหาสารคาม',
                'มุกดาหาร',
                'แม่ฮ่องสอน',
                'ยะลา',
                'ยโสธร',
                'ร้อยเอ็ด',
                'ระนอง',
                'ระยอง',
                'ราชบุรี',
                'ลพบุรี',
                'ลำปาง',
                'ลำพูน',
                'เลย',
                'ศรีสะเกษ',
                'สกลนคร',
                'สงขลา',
                'สตูล',
                'สมุทรปราการ',
                'สมุทรสงคราม',
                'สมุทรสาคร',
                'สระแก้ว',
                'สระบุรี',
                'สิงห์บุรี',
                'สุโขทัย',
                'สุพรรณบุรี',
                'สุราษฎร์ธานี',
                'สุรินทร์',
                'หนองคาย',
                'หนองบัวลำภู',
                'อ่างทอง',
                'อุดรธานี',
                'อุทัยธานี',
                'อุตรดิตถ์',
                'อุบลราชธานี',
                'อำนาจเจริญ'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Row builddisease(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 350,
          height: 60,
          child: TextFormField(
            readOnly: true,
            initialValue: disease,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dart),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row builddate(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 350,
          height: 60,
          child: TextFormField(
            readOnly: true,
            initialValue: date =
                'วันที่ ${now.day}  / ${now.month}  / ${now.year}',
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dart),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildAge(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: MyConstant.dart),
          ),
          width: 350,
          height: 60,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'กรุณาเลือกอายุของต้นข้าวโพด',
                  style: MyConstant().h3Style(),
                ),
              ),
              value: dropValue2,
              isExpanded: true,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  dropValue2 = newValue!;
                });
              },
              items: <String>[
                '1 สัปดาห์ ',
                '2 สัปดาห์ ',
                '3 สัปดาห์ ',
                '4 สัปดาห์ ',
                '5 สัปดาห์ ',
                '6 สัปดาห์ ',
                '7 สัปดาห์ ',
                '8 สัปดาห์ ',
                '9 สัปดาห์ ',
                '10 สัปดาห์ ',
                '11 สัปดาห์ ',
                '12 สัปดาห์ ',
                '13 สัปดาห์ ',
                '14 สัปดาห์ ',
                '15 สัปดาห์ '
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildArea(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: 350,
          height: 60,
          child: TextFormField(
            controller: _areaController,
            decoration: InputDecoration(
              hintStyle: MyConstant().h3Style(),
              hintText: 'จำนวนต้นข้าวโพดที่เสียหาย ',
              prefixIcon: Icon(
                Icons.assistant_navigation,
                color: MyConstant.dart,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dart),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildSpecies(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: MyConstant.dart),
          ),
          width: 350,
          height: 60,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'กรุณาเลือกสายพันธุ์ข้าวโพด',
                  style: MyConstant().h3Style(),
                ),
              ),
              value: species,
              isExpanded: true,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  species = newValue!;
                });
              },
              items: <String>[
                'พันธุ์ซีพีดีเค 888 ',
                'พันธุ์ไพโอเนียร์ 3013 ',
                'พันธุ์แปซิฟิค 983 ',
                'พันธุ์เทพีวีนัส 49 ',
                'ลูกผสมพันธุ์นครสวรรค์ 72 ',
                'พันธุ์สุวรรณ 3851 ',
                'พันธุ์สุวรรณ 5 ',
                'พันธุ์นครสวรรค์ 1 ',
                'พันธุ์แท้นครสวรรค์ 1 ',
                'พันธุ์แท้นครสวรรค์ 2 ',
                'พันธุ์ลูกผสมสามทางสุวรรณ 3101 ',
                'พันธุ์สุวรรณ 3 ',
                'พันธุ์อื่นๆ ',
                'ไม่ทราบพันธุ์ '
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Set<Marker> myMarker() {
    // ignore: prefer_collection_literals
    return <Marker>[
      Marker(
        markerId: const MarkerId('Farmar'),
        position: LatLng(lat!, lng!),
      )
    ].toSet();
  }

  Container shoeMap() {
    LatLng latLng = LatLng(lat!, lng!);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16.0,
    );
    return Container(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        onTap: (LatLng) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return const Googlemap();
            }),
          );
        },
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: myMarker(),
      ),
    );
  }

  Row buildButton(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: size * 0.8,
          height: 50,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: MyConstant.dart,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () async {
              if (dropValue2 == null) {
                Mydialog().normalDialog(
                    context,
                    'คุณยังไม่ได้เลือกอายุของต้นข้าวโพด',
                    'กรุณาเลือกอายุของต้นข้าวโพด');
              } else if (species == null) {
                Mydialog().normalDialog(
                    context,
                    'คุณยังไม่ได้เลือกสายพันธุ์ข้าวโพด',
                    'กรุณาเลือกสายพันธุ์ข้าวโพด');
              } else {
                await creadata3();
                await updeteArea(
                    province: province, area: int.parse(_areaController.text));
                await updetedisease(
                    disease: disease, area: int.parse(_areaController.text));
                await updetespecies(
                    species: species!, area: int.parse(_areaController.text));
              }
            },
            icon: const Icon(Icons.check),
            label: const Text(
              'บันทึกข้อมูล  ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  var province;
  var delay = false;

  Future<void> gatdata() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.email)
        .get()
        .then((value) {
      setState(() {
        delay = true;
        province = value.data()!['province'].toString();
        print('$province');
      });
    });
  }

  Future updeteArea({
    required int area,
    required String province,
  }) async {
    print('area =  $area');
    print('prov=  $province');

    final reference = FirebaseFirestore.instance.collection('จังหวัด');
    await reference.doc(province).update({'area': FieldValue.increment(area)});
    print('area =  $area');
  }

  Future<void> creadata3() async {
    final double area = double.parse(_areaController.text);
    await FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc(province)
        .collection('user')
        .doc(user!.email)
        .collection('disease')
        .doc()
        .set({
      'id': (id),
      'location': GeoPoint(lat!, lng!),
      'species': (species!),
      'area': (area),
      'date': (date),
      'age': (dropValue2!),
      'disease': (disease),
      'province': (province),
    }).then((value) {
      print('okkkk');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const History();
        }),
      );
    });
  }

  Future updetedisease({
    required int area,
    required String disease,
  }) async {
    print('area =  $area');
    print('disease =  $disease');

    final reference = FirebaseFirestore.instance.collection('disease');
    await reference.doc(disease).update({'area': FieldValue.increment(area)});
    print('area =  $area');
  }

  Future updetespecies({
    required int area,
    required String species,
  }) async {
    print('area =  $area');
    print('species=  $species');

    final reference = FirebaseFirestore.instance.collection('species');
    await reference.doc(species).update({'area': FieldValue.increment(area)});
    print('area =  $area');
  }
}

Container buildTitle(String title) {
  return Container(
    margin: const EdgeInsets.all(16),
    child: ShowTitle(
      title: title,
      textStyle: MyConstant().h2Style(),
    ),
  );
}

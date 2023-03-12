import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginapp/page/home.dart';
import 'package:loginapp/page/savedata1.dart';
import 'package:loginapp/page/savedata2.dart';
import 'package:loginapp/page/savedata3.dart';
import 'package:loginapp/page/savedata4.dart';
import 'package:loginapp/states/constant.dart';
import 'package:tflite/tflite.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  late File _image;
  late List _results;
  bool imageSelect = false;

  @override
  void initState() {
    super.initState();
    lodeModel();
  }

  Future lodeModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt'))!;
  }

  Future imageClassification(File image) async {
    var diagnose = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 4,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _results = diagnose!;
      _image = image;
      imageSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHome(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Text(
            'กลับ',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 240, 238, 233),
      body: ListView(
        children: [
          (imageSelect)
              ? Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        child: Image.file(_image),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              : Container(
                  width: 300,
                  child: Column(
                    children: <Widget>[
                      Image.asset('images/dd.png'),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
          SingleChildScrollView(
            child: Column(
                children: (imageSelect)
                    ? _results.map(
                        (result) {
                          return Container(
                            width: 300,
                            child: Card(
                              color: const Color.fromARGB(255, 190, 224, 224),
                              child: TextButton.icon(
                                  icon: const Icon(
                                    Icons.error_sharp,
                                    size: 24.0,
                                    color: Colors.red,
                                  ),
                                  label: Text(
                                      "${result['label']}  ${(result['confidence'] * 100.0).toString().substring(0, 4)}%",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 20)),
                                  onPressed: () {
                                    if (result['index'] == 0) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                            'กรมส่งเสริมการเกษตร แนะนำวิธีการป้องกันกำจัด ดังนี้',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 237, 176, 7),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          content: const Text(
                                            '๑. ปลูกข้าวโพดพันธุ์ต้านทาน เช่น นครสวรรค์ ๑ นครสวรรค์ ๗๒'
                                            '\n'
                                            '๒. หลีกเลี่ยงการปลูกข้าวโพดหลายฤดูกาลติดต่อกัน'
                                            '\n'
                                            '๓. หมั่นสำรวจแปลง เมื่อเริ่มพบข้าวโพดเริ่มแสดงอาการพ่นด้วยสารป้องกันกำจัดเชื้อรา เช่น'
                                            '\n'
                                            '- โพรพิโคนาโซล ๒๕% อีซี อัตรา ๑๕ มิลลิลิตร ต่อน้ำ ๒๐ ลิตร '
                                            '\n'
                                            '- อะซอกซี่สะโตรบิน + ไดฟีโนโคนาโซล อัตรา ๑๕ มิลลิลิตร ต่อน้ำ ๒๐ ลิตร'
                                            '\n'
                                            '- คาร์เบนดาซิม + อีพอกซี่โคนาโซล อัตรา ๒๕ มิลลิลิตร ต่อน้ำ ๒๐ ลิตร'
                                            '\n'
                                            'พ่นทุก ๗ วัน จำนวน ๒ ถึง ๔ ครั้ง ตามความรุนแรงของโรค'
                                            '\n'
                                            '๔. ปลูกพืชหมุนเวียน กำจัดวัชพืช ถอนต้นข้าวโพดที่เป็นโรคไปเผาทำลาย',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 159, 198, 135)),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return const Savedata1();
                                                }));
                                              },
                                              child: const Text(
                                                'เก็บข้อมูลเชิงพื้นที่',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                          elevation: 24,
                                        ),
                                      );
                                    } else if (result['index'] == 1) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                            'กรมส่งเสริมการเกษตรแนะนำวิธีป้องกันกำจัด ดังนี้',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 237, 176, 7),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          content: const Text(
                                            '1. หลีกเลี่ยงการปลูกข้าวโพดพันธุ์อ่อนแอ'
                                            '\n'
                                            '2. ควรปลูกพันธุ์ต้านทานโรคหรือปลูกพืชอื่นแทนข้าวโพดในฤดูหนาว'
                                            '\n'
                                            '3. กำจัดวัชพืชและเผาทำลายต้นที่เป็นโรค'
                                            '\n'
                                            '4. หมั่นสำรวจแปลงอยู่เสมอตั้งแต่ระยะกล้า เมื่อเริ่มพบโรคระบาดมีจุดสนิม 3 - 4 จุดต่อใบ ให้พ่นด้วยสารป้องกันกำจัดเชื้อราทุก 7 วัน จำนวน 2 - 4 ครั้ง ตามความรุนแรงของโรค เช่น'
                                            '\n'
                                            '-ไดฟิโนโคนาโซล (สกอร์) 250 อีซี อัตรา 20 มล.ต่อน้ำ 20 ลิตร '
                                            '\n'
                                            '-แมนโคเซบ 80% ดับบลิวพี อัตรา 40 กรัมต่อน้ำ 20 ลิตร',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 159, 198, 135)),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return const Savedata2();
                                                }));
                                              },
                                              child: const Text(
                                                'เก็บข้อมูลเชิงพื้นที่',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                          elevation: 24,
                                        ),
                                      );
                                    } else if (result['index'] == 2) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                            'วิธีการป้องกันและรักษา',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 237, 176, 7),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          content: const Text(
                                            '1.ใช้เมล็ดพันธุ์จากต้นที่ปลอดโรค'
                                            '\n'
                                            '2.ใช้เมล็ดพันธุ์ที่ต้านทานโรค'
                                            '\n'
                                            '3.หลีกเลี่ยงการใช้ปุ๋ยไนโตรเจนปริมาณสูง และการปลูกพืชหนาแน่น'
                                            '\n'
                                            '4. ฉีดพ่นด้วยสาร คลอโรทาโลนิล(ลีนิล) หรือ แมนโคเซป(ฮัมบรูก) ทุกๆ 7 วัน หรือพ่นด้วยสารป้องกันกำจัดโรคพืชไตรโฟรีน (ซาพรอล) อัตรา 20 ซีซี ต่อน้ำ 20 ลิตร และทำลายเศษซากของข้าวโพดหลังเก็บเกี่ยว',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          255, 159, 198, 135)),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return const Savedata3();
                                                }));
                                              },
                                              child: const Text(
                                                'เก็บข้อมูลเชิงพื้นที่',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                          elevation: 24,
                                        ),
                                      );
                                    } else if (result['index'] == 3) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: const Text(
                                            'ไม่มีข้อมูล',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'ปิด',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                          elevation: 24,
                                        ),
                                      );
                                    }
                                  }),
                            ),
                          );
                        },
                      ).toList()
                    : []),
          ),
          //ปุ่มเก็บข้อมูลเชิงพื้นที่
          Container(
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomButton(
                  title: 'รูปภาพ',
                  icon: Icons.image_outlined,
                  onClick: () => pickImage(),
                ),
                CustomButton(
                  title: ' กล้อง',
                  icon: Icons.camera_alt_rounded,
                  onClick: () => pickcamaraImage(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  primary: MyConstant.dart, // background
                  onPrimary: Colors.white, // foreground
                ),
                child: const Text("เก็บข้อมูลเชิงพื้นที่",
                    style: TextStyle(fontSize: 24)),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const Savedata4();
                  }));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  //การเข้าถึงรูปภาพจากกล้องและคลังรูปภาพ

  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }

  Future pickcamaraImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }

//ปุ่มกล้องและคลังภาพ
  // ignore: non_constant_identifier_names
  Widget CustomButton({
    required String title,
    required IconData icon,
    required VoidCallback onClick,
  }) {
    return SizedBox(
      height: 50,
      width: 140,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          primary: const Color.fromARGB(255, 241, 161, 42), // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: onClick,
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(title, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

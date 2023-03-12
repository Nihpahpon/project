// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginapp/page/home.dart';
import 'package:loginapp/states/constant.dart';
import 'package:loginapp/states/dialog.dart';
import 'package:loginapp/widgets/imagge.dart';
import 'package:loginapp/widgets/model.dart';
import 'package:loginapp/widgets/title.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class Craeteaccount extends StatefulWidget {
  const Craeteaccount({Key? key}) : super(key: key);

  @override
  State<Craeteaccount> createState() => _CraeteaccountState();
}

class _CraeteaccountState extends State<Craeteaccount> {
  String? typeSex = "";
  String? dropdownValue;
  File? file;
  final formKey = GlobalKey<FormState>();
  String? name, email, password, typesex, province, phone, urlpictuer;
  bool statusRedEye = true;
  String? id = Uuid().v1();
  User? user = FirebaseAuth.instance.currentUser;

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            onChanged: (value) => name = value.trim(),
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'ชื่อเกษตรกร: ',
              prefixIcon: Icon(
                Icons.people,
                color: MyConstant.dart,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            maxLength: 10,
            onChanged: (value) => phone = value.trim(),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'เบอร์โทรศัพท์ : ',
              prefixIcon: Icon(
                Icons.phone,
                color: MyConstant.dart,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            onChanged: (value) => email = value.trim(),
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'อีเมล : ',
              prefixIcon: Icon(
                Icons.people,
                color: MyConstant.dart,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            onChanged: (value) => password = value.trim(),
            obscureText: statusRedEye,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    statusRedEye = !statusRedEye;
                  });
                },
                icon: statusRedEye
                    ? Icon(
                        Icons.remove_red_eye,
                        color: MyConstant.dart,
                      )
                    : Icon(
                        Icons.remove_red_eye_outlined,
                        color: MyConstant.dart,
                      ),
              ),
              labelStyle: MyConstant().h3Style(),
              labelText: 'รหัสผ่าน : ',
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: MyConstant.dart,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 132, 106),
        title: Text(
          'สร้างบัญชีผู้ใช้ของเกษตรกร  ',
          style: GoogleFonts.mali(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitle('รูปภาพโปรไฟล์ '),
                buildAvatar(size),
                buildName(size),
                buildUser(size),
                buildPassword(size),
                buildTitle('เพศ'),
                buildRadioman(size),
                buildRadiofemale(size),
                buildDropdown(size),
                buildPhone(size),
                buildcreate(size),
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

  Row buildcreate(double size) {
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
            onPressed: () {
              if ((name?.isEmpty ?? true) ||
                  (email?.isEmpty ?? true) ||
                  (password?.isEmpty ?? true) ||
                  (phone?.isEmpty ?? true)) {
                Mydialog().normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ',
                    'Please complete the information.');
              } else if (file == null) {
                showAlert('คุณยังไม่ได้เลือกรูปภาพ', 'กรุณาเลือกรูปภาพของคุณ');
              } else if (typeSex == null) {
                Mydialog().normalDialog(
                    context, 'คุณยังไม่ได้เลือกเพศ', 'กรุณาเลือกเพศของคุณ.');
              } else if (dropdownValue == null) {
                Mydialog().normalDialog(context, 'คุณยังไม่ได้เลือกจังหวัด',
                    'กรุณาเลือกจังหวัดของคุณ.');
              } else {
                uploadPictureToStorage();
                //creaAndInsertdata();
              }
            },
            icon: const Icon(Icons.check),
            label: const Text(
              'สร้างบัญชีผู้ใช้ของเกษตรกร  ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> showAlert(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        });
  }

  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(1000000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference ref = firebaseStorage.ref().child("user/user$i.jpg");
    UploadTask uploadTask = ref.putFile(file!);
    var imageUrl = await (await uploadTask).ref.getDownloadURL();
    urlpictuer = imageUrl.toString();
    creaAndInsertdata();
    creadata1();
  }

  Future<void> creadata1() async {
    await FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc(dropdownValue!)
        .collection('user')
        .doc(email)
        .set({}).then((value) {
      print('ok');
    });
  }

  Future<void> creaAndInsertdata() async {
    await Firebase.initializeApp().then((value) async {
      //print('Firebase');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        //print('สร้างบัญชีผู้ใช้สำเร็จ');
        await value.user?.updateDisplayName(name).then((value2) async {
          String uid = value.user!.uid;
          // print('อัพเดตโปรไฟล์สำเร็จ uid = $uid');
          // print('email= $email');
          // print('name= $name');
          // print('password= $password');
          // print('phone= $phone');
          // print('province= $dropdownValue');
          // print('typesex= $typeSex');

          UserModel model = UserModel(
              email: email!,
              name: name!,
              password: password!,
              phone: phone!,
              province: dropdownValue!,
              typesex: typeSex!,
              urlpictuer: urlpictuer!);
          Map<String, dynamic> data = model.toMap();

          await FirebaseFirestore.instance
              .collection('user')
              .doc(email)
              .set(data)
              .then((value) {
            print('ok');

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return const MyHome();
              }),
            );
          });
        });
      }).catchError((onError) =>
              // ignore: invalid_return_type_for_catch_error
              Mydialog().normalDialog(context, onError.code, onError.message));
    });
  }

  Future chooseImage(ImageSource source) async {
    try {
      final result = await ImagePicker().pickImage(
        source: source,
        maxWidth: 600,
        maxHeight: 600,
      );
      setState(() {
        file = File(result!.path);
      });
    } catch (e) {
      print(e);
    }
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => chooseImage(ImageSource.camera),
          icon: const Icon(
            Icons.add_a_photo,
            size: 38,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          width: size * 0.6,
          child: file == null
              ? ShowImage(path: MyConstant.avatar)
              : Image.file(file!),
        ),
        IconButton(
          onPressed: () => chooseImage(ImageSource.gallery),
          icon: const Icon(
            Icons.add_photo_alternate,
            size: 40,
          ),
        ),
      ],
    );
  }

  Row buildDropdown(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: MyConstant.dart),
          ),
          width: size * 0.8,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'จังหวัดที่ทำเกษตรกรรม',
                  style: MyConstant().h3Style(),
                ),
              ),
              value: dropdownValue,
              isExpanded: true,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
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

  Row buildRadioman(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size * 0.8,
          child: RadioListTile(
            value: 'ชาย',
            groupValue: typeSex,
            onChanged: (value) {
              setState(() {
                typeSex = value as String?;
              });
            },
            title: Text(
              'ผู้ชาย',
              style: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Row buildRadiofemale(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size * 0.8,
          child: RadioListTile(
            value: 'หญิง',
            groupValue: typeSex,
            onChanged: (value) {
              setState(() {
                typeSex = value as String?;
              });
            },
            title: Text(
              'ผู้หญิง',
              style: MyConstant().h3Style(),
            ),
          ),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: GoogleFonts.mali(
            color: MyConstant.dart, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

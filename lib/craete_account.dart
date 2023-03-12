// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';
import 'main.dart';
import 'model/modelcraet.dart';
import 'widgets/constant.dart';
import 'widgets/dialog.dart';
import 'widgets/imagge.dart';
import 'widgets/title.dart';

class Craeteaccount extends StatefulWidget {
  const Craeteaccount({Key? key}) : super(key: key);

  @override
  State<Craeteaccount> createState() => _CraeteaccountState();
}

class _CraeteaccountState extends State<Craeteaccount> {
  final formKey = GlobalKey<FormState>();
  String? name, name2, email, password;

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: size * 0.3,
          child: TextFormField(
            onChanged: (value) => name = value.trim(),
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'ชื่อสำนักงาน: ',
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

  Row buildNameUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: size * 0.3,
          child: TextFormField(
            onChanged: (value) => name2 = value.trim(),
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'ชื่อ - นามสกุลเจ้าหน้าที่: ',
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

  Row buildUser(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: size * 0.3,
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
          width: size * 0.3,
          child: TextFormField(
            onChanged: (value) => password = value.trim(),
            decoration: InputDecoration(
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
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/appmaize.appspot.com/o/image%2Fv.png?alt=media&token=8784deee-c831-44e2-a846-86d2108e3870'),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: 900,
            height: 590,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    buildAvatar(size),
                    const SizedBox(
                      height: 15,
                    ),
                    buildAppName(),
                    const SizedBox(
                      height: 15,
                    ),
                    buildNameUser(size),
                    buildName(size),
                    buildUser(size),
                    buildPassword(size),
                    buildcreate(size),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'สร้างบัญชีผู้ใช้ของสำนักงานเกษตร',
          textStyle: GoogleFonts.mali(
            fontSize: 28,
            color: const Color(0xff00766c),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Row buildcreate(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            width: 150,
            height: 50,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 205, 218, 218),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const MyApp();
                }));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              label: const Text(
                'ก่อนหน้า ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            width: size * 0.1,
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
                    (name2?.isEmpty ?? true) ||
                    (email?.isEmpty ?? true) ||
                    (password?.isEmpty ?? true)) {
                  Mydialog().normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ',
                      'Please complete the information.');
                } else {
                  creaAndInsertdata();
                }
              },
              icon: const Icon(Icons.check),
              label: const Text(
                'ถัดไป  ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
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
            password: password!,
            name: name!,
            name2: name2!,
          );
          Map<String, dynamic> data = model.toMap();

          await FirebaseFirestore.instance
              .collection('AgricultureOffice')
              .doc(uid)
              .set(data)
              .then((value) {
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

  Row buildAvatar(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size * 0.2,
          child: ShowImage(path: MyConstant.avatar2),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: MyConstant().h2Style(),
      ),
    );
  }
}

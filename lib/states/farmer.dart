import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:loginapp/states/dialog.dart';
import 'package:loginapp/states/forgetpassword.dart';
import 'package:loginapp/widgets/imagge.dart';
import 'package:loginapp/widgets/title.dart';

import 'constant.dart';

class Farmer extends StatefulWidget {
  const Farmer({Key? key}) : super(key: key);

  @override
  State<Farmer> createState() => _FarmerState();
}

class _FarmerState extends State<Farmer> {
  bool statusRedEye = true;
  final formKey = GlobalKey<FormState>();
  String? user, password;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                buildImage(size),
                buildAppName(),
                buildUser(size),
                buildPassword(size),
                buildLogin(size),
                buildforgetPassword(),
                buildCreateAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildforgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const Forgetpass();
            }));
          },
          child: const Text(
            'ลืมรหัสผ่าน ?',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 18,
                color: Colors.black),
          ),
        ),
      ],
    );
  }

  Row buildCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: 'มีบัญชีใช้งานหรือไม่ ? ',
          textStyle: MyConstant().h3Style(),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, MyConstant.routeCraeteaccount),
          child: const Text(
            'สร้างบัญชี',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  Row buildLogin(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            width: size * 0.8,
            height: 50,
            child: ElevatedButton(
              style: MyConstant().myButtonSyle(),
              onPressed: () {
                if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
                  Mydialog().normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ',
                      'Please complete the information.');
                } else {
                  checkFarmer();
                }
              },
              child: const Text(
                'เข้าสู่ระบบ',
                style: TextStyle(
                  fontSize: 24,
                ),
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
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => user = value.trim(),
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'อีเมล : ',
              prefixIcon: Icon(
                Icons.account_circle_outlined,
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

  Row buildAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowTitle(
          title: MyConstant.appName,
          textStyle: GoogleFonts.pacifico(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: MyConstant.dart),
        ),
      ],
    );
  }

  Row buildImage(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size * 0.7,
          child: ShowImage(path: MyConstant.image1),
        ),
      ],
    );
  }

  Future<void> checkFarmer() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: user!, password: password!)
          .then((value) => Navigator.pushNamedAndRemoveUntil(
              context, '/MyHome', (route) => false))
          .catchError((onError) =>
              // ignore: invalid_return_type_for_catch_error
              Mydialog().normalDialog(context, onError.code, onError.message));
    });
  }
}

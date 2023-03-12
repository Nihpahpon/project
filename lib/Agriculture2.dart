import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/AgricultureOffice.dart';
import 'package:web/widgets/constant.dart';
import 'package:web/widgets/imagge.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({Key? key}) : super(key: key);

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    print(_emailController.text.trim());
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('ส่งข้อความสำเร็จ  โปรคเช็คอีเมลของคุณ'),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ลืมรหัสผ่าน',
          style: GoogleFonts.mali(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 132, 106),
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AgricultureOffice(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 25,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                  width: 230,
                  child: ShowImage(path: MyConstant.image1),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                child: Text(
                  'กรอกอีเมลเพื่อเปลี่ยนรหัสผ่านของคุณ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22, color: Color.fromARGB(255, 44, 135, 145)),
                ),
              ),
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                child: Text(
                  'ทางเราจะส่งลิงค์รีเซ็ตรหัสผ่านจะถูกส่งไปยังอีเมลของคุณ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(250, 40, 250, 0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'กรอกอีเมลที่ลงทะเบียน',
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      primary: MyConstant.dart, // background
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ), // foreground
                    ),
                    onPressed: passwordReset,
                    child: Text(
                      "ส่งข้อความ",
                      style: GoogleFonts.mali(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

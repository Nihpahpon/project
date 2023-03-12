import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/states/constant.dart';
import 'package:loginapp/states/farmer.dart';
import 'package:loginapp/widgets/imagge.dart';

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
                builder: (context) => const Farmer(),
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
                padding: const EdgeInsetsDirectional.fromSTEB(10, 40, 10, 0),
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

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Forgetpass extends StatefulWidget {
//   const Forgetpass({Key? key}) : super(key: key);

//   @override
//   State<Forgetpass> createState() => _ForgetpassState();
// }

// class _ForgetpassState extends State<Forgetpass> {
//   final _formKey = GlobalKey<FormState>();

//   var email = "";

//   final emailController = TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     emailController.dispose();
//     super.dispose();
//   }

//   resetPassword() async {
//     try {
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           backgroundColor: Colors.orangeAccent,
//           content: Text(
//             'ส่งอีเมลรีเซ็ตรหัสผ่านแล้ว',
//             style: TextStyle(fontSize: 18.0),
//           ),
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//         ScaffoldMessenger.of(context).showSnackBar(
//           // ignore: prefer_const_constructors
//           SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: const Text(
//               'ไม่พบผู้ใช้สำหรับอีเมลนั้น',
//               style: TextStyle(fontSize: 18.0),
//             ),
//           ),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("รีเซ็ตรหัสผ่าน"),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 20.0),
//             child: Text(
//               'ลิงค์รีเซ็ตรหัสผ่านจะถูกส่งไปยังอีเมลของคุณ',
//               style: TextStyle(fontSize: 20.0),
//             ),
//           ),
//           Expanded(
//             child: Form(
//               key: _formKey,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//                 child: ListView(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: 10.0),
//                       child: TextFormField(
//                         autofocus: false,
//                         decoration: InputDecoration(
//                           labelText: 'อีเมลที่ลงทะเบียน ',
//                           labelStyle: TextStyle(fontSize: 20.0),
//                           border: OutlineInputBorder(),
//                           errorStyle:
//                               TextStyle(color: Colors.redAccent, fontSize: 15),
//                         ),
//                         controller: emailController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'กรุณากรอกอีเมล';
//                           } else if (!value.contains('@')) {
//                             return 'กรุณากรอกอีเมลที่ถูกต้อง';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(left: 60.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               // Validate returns true if the form is valid, otherwise false.
//                               if (_formKey.currentState!.validate()) {
//                                 setState(() {
//                                   email = emailController.text;
//                                 });
//                                 resetPassword();
//                               }
//                             },
//                             child: const Text(
//                               'ส่งอีเมล',
//                               style: TextStyle(fontSize: 18.0),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

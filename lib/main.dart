import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:web/page3.dart';
import 'AgricultureOffice.dart';
import 'craete_account.dart';
import 'home.dart';
import 'widgets/constant.dart';

final Map<String, WidgetBuilder> map = {
  '/AgricultureOffice': (BuildContext context) => const AgricultureOffice(),
  '/Craeteaccount': (BuildContext context) => const Craeteaccount(),
  '/MyHome': (BuildContext context) => const MyHome(),
  '/ShoweMap': (BuildContext context) => const Screen1(),
};
String? initlalRoute;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyCZJm3W4K7_KhVO7ksZdW7cwivWW-CEuq0",
              authDomain: "maize-disease-diagnosis.firebaseapp.com",
              databaseURL:
                  "https://maize-disease-diagnosis-default-rtdb.asia-southeast1.firebasedatabase.app",
              projectId: "maize-disease-diagnosis",
              storageBucket: "maize-disease-diagnosis.appspot.com",
              messagingSenderId: "458433031665",
              appId: "1:458433031665:web:6480969d9ec99fe7e4a850",
              measurementId: "G-3YENFN94CF"))
      .then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      if (event != null) {
        String uid = event.uid;
        await FirebaseFirestore.instance
            .collection('AgricultureOffice')
            .doc(uid)
            .snapshots()
            .listen((event) {
          initlalRoute = MyConstant.routeMyHome;
          runApp(const MyApp());
        });
      } else {
        initlalRoute = MyConstant.routeAgricultureOffice;
        runApp(const MyApp());
      }
    });
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: MyConstant.appName,
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/page/diagnose.dart';
import 'package:loginapp/page/disease.dart';
import 'package:loginapp/page/history.dart';
import 'package:loginapp/page/map.dart';
import 'package:loginapp/page/map2.dart';
import 'package:loginapp/page/profile.dart';
import 'package:loginapp/states/constant.dart';
import 'package:loginapp/widgets/singout.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  User? user = FirebaseAuth.instance.currentUser;
  late String title;
  String? name, email;

  @override
  void initState() {
    super.initState();
    findName();
    getUserData(user!.email);
  }

  var province;
  Future getUserData(user_email) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.email)
        .snapshots()
        .listen((event) {
      setState(() {
        province = event.get('province');
      });
      nnnn();
    });
  }

  var nnn;

  Future nnnn() async {
    await FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc(province)
        .collection('notification')
        .get()
        .then((value) {
      setState(() {
        nnn = value.size;
      });
      print('ค่าnnn  = $nnn');
    });
  }

  Future<void> findName() async {
    await Firebase.initializeApp().then((value) async {
      FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event?.displayName;
          email = event?.email;
        });
      });
    });
  }

//การแจ้งเตือน
  // Future<void> _showNotification() async {
  //   const AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails('10000', 'Maize disease diagnosis',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           ticker: 'ticker');

  //   const NotificationDetails platformChannelDetails = NotificationDetails(
  //     android: androidNotificationDetails,
  //   );

  //   await flutterLocalNotificationsPlugin.show(
  //     0,
  //     'Maize disease diagnosis',
  //     'พบการระบาดของโรคข้าวโพดให้เกษตรกรเตรียมการป้องกัน',
  //     platformChannelDetails,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        automaticallyImplyLeading: true,
        title: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 10),
          child: Text(
            'Maize  disease diagnosis',
            textAlign: TextAlign.start,
            style: GoogleFonts.pacifico(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF07796B),
            ),
          ),
        ),
        actions: [
          if (nnn == 0)
            const Text(
              "",
              style: TextStyle(color: Colors.black12),
            )
          else
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const show3(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.notifications,
                              color: Color.fromARGB(255, 210, 5, 5),
                              size: 40,
                            ),
                          ),
                          TextSpan(
                            text: "มีการแจ้งเตือน ",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
        ],
        centerTitle: false,
        elevation: 2,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            const Signout(),
            Column(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    '',
                    style: MyConstant().h1Style(),
                  ),
                  accountEmail: Text(
                    '$email',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/e.jpg'), fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
                  child: ListTile(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profile(),
                        ),
                      );
                    },
                    title: Text(
                      'ข้อมูลส่วนตัว',
                      style:
                          GoogleFonts.mali(color: Colors.black, fontSize: 20),
                    ),
                    leading: const Icon(
                      Icons.account_box,
                      color: Colors.black,
                      size: 30,
                    ),
                    trailing: const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                      size: 30,
                    ),
                    tileColor: const Color.fromARGB(255, 222, 232, 207),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ListTile(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const History(),
                        ),
                      );
                    },
                    title: Text(
                      'ประวัติการพบโรค',
                      style:
                          GoogleFonts.mali(color: Colors.black, fontSize: 20),
                    ),
                    leading: const Icon(
                      Icons.assessment,
                      color: Colors.black,
                      size: 30,
                    ),
                    trailing: const Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                      size: 30,
                    ),
                    tileColor: const Color.fromARGB(255, 222, 232, 207),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 60, 20, 0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: 340,
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'images/logoo.png',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                    ),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Screen2(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                80, 30, 0, 0),
                            child: Text(
                              'วินิจฉัย\nโรคข้าวโพด',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mali(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Disease(),
                      ),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: 340,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'images/oo.png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(110, 40, 0, 0),
                        child: Text(
                          'ข้อมูลโรคข้าวโพด',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mali(
                            color: Colors.black,
                            fontSize: 29,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 100),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Screen1(),
                      ),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: 340,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'images/logo.png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(110, 40, 0, 0),
                        child: Text(
                          'พื้นที่การ \n เกิดโรคข้าวโพด',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mali(
                            color: Colors.black,
                            fontSize: 29,
                          ),
                        ),
                      ),
                    ),
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

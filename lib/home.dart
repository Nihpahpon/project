import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/craete_account2.dart';
import 'package:web/disease.dart';
import 'package:web/model/datachart.dart';
import 'package:web/page2.dart';
import 'package:web/page3.dart';
import 'package:web/widgets/singout.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String? name, email;

  @override
  void initState() {
    super.initState();
    findName();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 1150, 0),
          child: Image(
            image: AssetImage('images/a.png'),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
          child: Text(
            'Maize  disease diagnosis',
            textAlign: TextAlign.start,
            style: GoogleFonts.pacifico(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 10, 132, 106),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 189, 222, 164),
              child: Stack(
                children: [
                  const Signout(),
                  Column(
                    children: [
                      UserAccountsDrawerHeader(
                        accountName: Text(
                          '$name',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                        accountEmail: Text(
                          '$email',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        currentAccountPicture: GestureDetector(
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: ExactAssetImage('images/aa.png'),
                          ),
                        ),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/e.jpg'),
                              fit: BoxFit.cover),
                        ),
                        onDetailsPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Profile(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(5, 200, 5, 0),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //     child: ListTile(
                      //       onTap: () async {
                      //         await Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //             builder: (context) => const Profile(),
                      //           ),
                      //         );
                      //       },
                      //       title: Text(
                      //         'ข้อมูลส่วนตัว',
                      //         style: GoogleFonts.mali(
                      //             color: Colors.black, fontSize: 14),
                      //       ),
                      //       leading: const Icon(
                      //         Icons.account_box,
                      //         color: Colors.black,
                      //         size: 26,
                      //       ),
                      //       trailing: const Icon(
                      //         Icons.arrow_right,
                      //         color: Colors.black,
                      //         size: 26,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 200, 5, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Showedata(),
                                ),
                              );
                            },
                            title: Text(
                              'รายชื่อเกษตรกร ',
                              style: GoogleFonts.mali(
                                  color: Colors.black, fontSize: 14),
                            ),
                            leading: const Icon(
                              Icons.assessment,
                              color: Colors.black,
                              size: 26,
                            ),
                            trailing: const Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Datadisease(),
                                ),
                              );
                            },
                            title: Text(
                              'ข้อมูลโรค ',
                              style: GoogleFonts.mali(
                                  color: Colors.black, fontSize: 14),
                            ),
                            leading: const Icon(
                              Icons.account_box,
                              color: Colors.black,
                              size: 26,
                            ),
                            trailing: const Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Screen1(),
                                ),
                              );
                            },
                            title: Text(
                              'แผนที่การเกิดโรค ',
                              style: GoogleFonts.mali(
                                  color: Colors.black, fontSize: 14),
                            ),
                            leading: const Icon(
                              Icons.location_history,
                              color: Colors.black,
                              size: 26,
                            ),
                            trailing: const Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: const Color.fromARGB(255, 232, 232, 232),
              child: Showchart(),

              // Container(
              //   color: const Color.fromARGB(255, 232, 232, 232),
              //   child: Showchart(),
              // ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

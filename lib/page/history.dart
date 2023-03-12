// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/page/home.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  User? user = FirebaseAuth.instance.currentUser;
  // ignore: prefer_typing_uninitialized_variables
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
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData(user!.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: const Color.fromARGB(255, 209, 227, 182),
        title: Text(
          'ประวัติการพบโรค',
          style: GoogleFonts.mali(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('จังหวัด')
              .doc(province)
              .collection('user')
              .doc(user!.email)
              .collection('disease')
              .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 5, 20),
                            child: Card(
                              color: const Color.fromARGB(255, 248, 223, 151),
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 10),
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Text(
                                            data["disease"],
                                            style: GoogleFonts.mali(
                                              fontSize: 20.0,
                                              color: const Color.fromARGB(
                                                  221, 44, 137, 86),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                35, 0, 5, 0),
                                            child: IconButton(
                                              onPressed: () {
                                                createdata(
                                                    age: data["age"],
                                                    disease: data["disease"],
                                                    species: data["species"],
                                                    area: data["area"],
                                                    date: data["date"],
                                                    province: data["province"],
                                                    dataid: data.id);
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'ส่งการแจ้งเตือนแล้ว',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.notifications,
                                                color: Color.fromARGB(
                                                    255, 228, 3, 3),
                                                size: 40,
                                              ),
                                            ),
                                          ),
                                          const Text(
                                            "เตือน ",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                      subtitle: Text(
                                        '\n' +
                                            'วันที่พบโรค : ' +
                                            ' ' +
                                            data["date"] +
                                            '\n' +
                                            'พันธุ์ : ' +
                                            ' ' +
                                            data["species"] +
                                            '\n' +
                                            'อายุของต้นข้าวโพด : ' +
                                            ' ' +
                                            data["age"],
                                        style: GoogleFonts.mali(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 5, 10),
                                        child: SizedBox(
                                          width: 200,
                                          height: 45,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 10,
                                                primary: const Color.fromARGB(
                                                    255,
                                                    239,
                                                    127,
                                                    121), // background
                                                onPrimary: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ), // foreground
                                              ),
                                              child: Text(
                                                "ควบคุมโรคได้แล้ว",
                                                style: GoogleFonts.mali(
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onPressed: () async {
                                                await await updeteArea(
                                                  area: data['area'],
                                                  province: data["province"],
                                                );
                                                await updetespecies(
                                                  area: data['area'],
                                                  species: data["species"],
                                                );
                                                await updetedisease(
                                                  area: data['area'],
                                                  disease: data["disease"],
                                                ).then((value) {
                                                  print('id = ${data.id}');
                                                  delete(dataid: data.id);
                                                  delete1(dataid: data.id);
                                                }).catchError(
                                                    // ignore: invalid_return_type_for_catch_error
                                                    (e) => print("error: $e"));

                                                // ignore: use_build_context_synchronously
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'สามารถควบคุมโรคได้แล้ว',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 0, 10),
                                        child: SizedBox(
                                          width: 150,
                                          height: 45,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                elevation: 10,
                                                primary: const Color.fromARGB(
                                                    255,
                                                    239,
                                                    127,
                                                    121), // background
                                                onPrimary: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ), // foreground
                                              ),
                                              child: Text(
                                                "ลบข้อมูล",
                                                style: GoogleFonts.mali(
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onPressed: () async {
                                                await updeteArea(
                                                  area: data['area'],
                                                  province: data["province"],
                                                );
                                                await updetespecies(
                                                  area: data['area'],
                                                  species: data["species"],
                                                );
                                                await updetedisease(
                                                  area: data['area'],
                                                  disease: data["disease"],
                                                ).then((value) {
                                                  print('id = ${data.id}');
                                                  delete(dataid: data.id);
                                                  delete1(dataid: data.id);
                                                }).catchError(
                                                    (e) => print("error: $e"));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'ลบข้อมูลแล้ว',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    });
          },
        ),
      ),
    );
  }

  Future<void> creadata3() async {
    await FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc(province)
        .collection('noti')
        .doc()
        .set({}).then((value) {
      print('ok');
    });
  }

  Future createdata({
    required dataid,
    // required lat,
    // required lng,
    required age,
    required species,
    required area,
    required date,
    required disease,
    required province,
  }) async {
    return FirebaseFirestore.instance
        .collection("จังหวัด")
        .doc(province)
        .collection('notification')
        .doc(dataid)
        .set({
      'age': (age),
      //'location': GeoPoint(lat!, lng!),
      'species': (species!),
      'area': (area),
      'date': (date),
      'disease': (disease),
      'province': (province),
      'emailuser': user!.email
    });
  }

  Future delete({required dataid}) async {
    return FirebaseFirestore.instance
        .collection("จังหวัด")
        .doc(province)
        .collection("user")
        .doc(user!.email)
        .collection("disease")
        .doc(dataid)
        .delete();
  }

  Future delete1({required dataid}) async {
    return FirebaseFirestore.instance
        .collection("จังหวัด")
        .doc(province)
        .collection("notification")
        .doc(dataid)
        .delete();
  }

  Future updeteArea({
    required double area,
    required String province,
  }) async {
    print('area =  $area');
    print('prov=  $province');

    final reference = FirebaseFirestore.instance.collection('จังหวัด');
    await reference.doc(province).update({'area': FieldValue.increment(-area)});
    print('area =  $area');
  }

  Future updetespecies({
    required double area,
    required String species,
  }) async {
    print('area =  $area');
    print('species =  $species');

    final reference = FirebaseFirestore.instance.collection('species');
    await reference.doc(species).update({'area': FieldValue.increment(-area)});
    print('area =  $area');
  }

  Future updetedisease({
    required double area,
    required String disease,
  }) async {
    print('area =  $area');
    print('prov=  $disease');

    final reference = FirebaseFirestore.instance.collection('disease');
    await reference.doc(disease).update({'area': FieldValue.increment(-area)});
    print('area =  $area');
  }
}

// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
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

  final CollectionReference _user =
      FirebaseFirestore.instance.collection('user');

  Future<void> _update([DocumentSnapshot? data]) async {
    if (data != null) {
      _nameController.text = data['name'];
      _provinceController.text = data['province'];
      _phoneController.text = data['phone'];
      _sexController.text = data['typesex'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'ชื่อ - นามสกุลเกษตรกร',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _provinceController,
                  decoration: const InputDecoration(
                    labelText: 'จังหวัด',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'เบอร์โทรศัพท์',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _sexController,
                  decoration: const InputDecoration(
                    labelText: 'เพศ',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String name = _nameController.text;
                    final String province = _provinceController.text;
                    final String phone = _phoneController.text;
                    final String typesex = _sexController.text;

                    await _user.doc(data!.id).update({
                      "name": name,
                      "province": province,
                      "phone": phone,
                      "typesex": typesex
                    });
                    _nameController.text = '';
                    _provinceController.text = '';
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 10, 132, 106),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  child: const Text('แก้ไขข้อมูล'),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 132, 106),
        title: Text(
          'ข้อมูลส่วนตัว',
          style: GoogleFonts.mali(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('user')
              .where('email', isEqualTo: user!.email)
              .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Container(
                                width: 180,
                                height: 180,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  data["urlpictuer"],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(300, 0, 10, 0),
                              child: Container(
                                child: SizedBox(
                                  width: 70,
                                  height: 50,
                                  child: Row(
                                    children: [
// Press this button to edit a single product
                                      IconButton(
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.black,
                                            size: 35,
                                          ),
                                          onPressed: () => _update(data)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 10),
                              child: Container(
                                width: 350,
                                height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  child: ListTile(
                                    title: Text(
                                      'ชื่อ : ' + ' ' + data["name"],
                                      style: GoogleFonts.mali(
                                        fontSize: 20.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      '\n' +
                                          'email : ' +
                                          ' ' +
                                          data["email"] +
                                          '\n' +
                                          '\n' +
                                          'province : ' +
                                          ' ' +
                                          data["province"] +
                                          '\n' +
                                          '\n' +
                                          'sex : ' +
                                          ' ' +
                                          data["typesex"] +
                                          '\n' +
                                          '\n' +
                                          'phone : ' +
                                          ' ' +
                                          data["phone"],
                                      style: GoogleFonts.mali(
                                        fontSize: 20.0,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
          },
        ),
      ),
    );
  }
}

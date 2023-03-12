// ignore_for_file: deprecated_member_use, prefer_interpolation_to_compose_strings

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
  final formKey = GlobalKey<FormState>();
  String? name, name2, email, password;

  User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _name2Controller = TextEditingController();

  final CollectionReference _user =
      FirebaseFirestore.instance.collection('AgricultureOffice');

  Future<void> _update([DocumentSnapshot? data]) async {
    if (data != null) {
      _nameController.text = data['name'];
      _name2Controller.text = data['name2'].toString();
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
                    labelText: 'ชื่อสำนักงาน',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _name2Controller,
                  decoration: const InputDecoration(
                    labelText: 'ชื่อ - นามสกุลเจ้าหน้าที่',
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
                    final String name2 = _name2Controller.text;

                    await _user.doc(data!.id).update({
                      "name": name,
                      "name2": name2,
                    });
                    _nameController.text = '';
                    _name2Controller.text = '';
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ),
                    );
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
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('AgricultureOffice')
                .where('email', isEqualTo: user!.email)
                .snapshots(),
            builder: (context, snapshot) {
              return (snapshot.connectionState == ConnectionState.waiting)
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot data = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(250, 40, 250, 0),
                          child: Container(
                            height: 480,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: Container(
                                      width: 300,
                                      height: 180,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset('images/aa.png')),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(380, 0, 10, 0),
                                  child: Container(
                                    child: SizedBox(
                                      width: 100,
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
                                    width: 750,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          200, 20, 20, 0),
                                      child: ListTile(
                                        title: Text(
                                          'ชื่อสำนักงาน : ' +
                                              ' ' +
                                              data["name"],
                                          style: GoogleFonts.mali(
                                            fontSize: 20.0,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '\n' +
                                              'ชื่อ - นามสกุลเจ้าหน้าที่ : ' +
                                              ' ' +
                                              data["name2"] +
                                              '\n' +
                                              '\n' +
                                              'email : ' +
                                              ' ' +
                                              data["email"],
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
                          ),
                        );
                      });
            },
          ),
        ),
      ),
    );
  }
}

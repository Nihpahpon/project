// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/home.dart';
import 'package:web/page1.dart';

class Datadisease extends StatefulWidget {
  const Datadisease({Key? key}) : super(key: key);

  @override
  State<Datadisease> createState() => _DatadiseaseState();
}

class _DatadiseaseState extends State<Datadisease> {
  final formKey = GlobalKey<FormState>();
  String? name, name2;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _name2Controller = TextEditingController();

  final CollectionReference _user =
      FirebaseFirestore.instance.collection('datadisease');

  Future<void> _update([DocumentSnapshot? data]) async {
    if (data != null) {
      _nameController.text = data['name'];
      _name2Controller.text = data['data'].toString();
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
                    labelText: 'ชื่อโรคข้าวโพด',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _name2Controller,
                  decoration: const InputDecoration(
                    labelText: 'ข้อมูลโรคข้าวโพด',
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
                      "data": name2,
                    });
                    _nameController.text = '';
                    _name2Controller.text = '';
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Datadisease(),
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
            color: Color.fromARGB(255, 255, 255, 255),
            size: 25,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 132, 106),
        title: Text(
          'ข้อมูลโรคข้าวโพด  ',
          style: GoogleFonts.mali(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 20, 10),
            child: Container(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 247, 181, 41),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const ShoweFarmer();
                    }),
                  );
                },
                icon: const Icon(Icons.add_circle_rounded),
                label: const Text(
                  'เพิ่มข้อมูล',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('datadisease').snapshots(),
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
                            padding: const EdgeInsets.fromLTRB(900, 30, 10, 5),
                            child: Container(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 247, 181, 41),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () => _update(data),
                                icon: const Icon(Icons.edit),
                                label: const Text(
                                  'เเก้ไขข้อมูล',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(900, 30, 10, 5),
                            child: Container(
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromARGB(255, 247, 181, 41),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  icon: const Icon(Icons.delete),
                                  label: const Text(
                                    'ลบข้อมูล',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  onPressed: () {
                                    final _user = FirebaseFirestore.instance
                                        .collection("datadisease")
                                        .doc(data.id);
                                    _user.delete();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'ลบข้อมูลแล้ว',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(100, 20, 100, 0),
                            child: Container(
                              height: 360,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 163, 202, 234),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 0),
                                    child: Container(
                                        width: 320,
                                        height: 200,
                                        child: Image.network(data["url"])),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: Container(
                                      width: 650,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 20, 0),
                                        child: ListTile(
                                          title: Text(
                                            'ชื่อโรคข้าวโพด : ' +
                                                ' ' +
                                                data["name"],
                                            style: GoogleFonts.mali(
                                              fontSize: 20.0,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: Text(
                                              '\n' +
                                                  'ข้อมูลโรค : ' +
                                                  ' ' +
                                                  data["data"],
                                              style: GoogleFonts.mali(
                                                fontSize: 14.0,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                 child: Container(
//                                   child: SizedBox(
//                                     width: 100,
//                                     height: 50,
//                                     child: Row(
//                                       children: [
// // Press this button to edit a single product
//                                         IconButton(
//                                             icon: const Icon(
//                                               Icons.edit,
//                                               color: Colors.black,
//                                               size: 35,
//                                             ),
//                                             onPressed: () => _update(data)),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
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
}

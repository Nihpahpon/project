import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/states/constant.dart';

class ShoweMap extends StatefulWidget {
  const ShoweMap({Key? key}) : super(key: key);

  @override
  State<ShoweMap> createState() => _ShoweMapState();
}

class _ShoweMapState extends State<ShoweMap> {
  var now = DateTime.now();
  bool searchState = false;
  String province = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color.fromARGB(255, 13, 100, 66),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: !searchState
              ? Text(
                  'รายละเอียด',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.mali(
                      color: MyConstant.dart,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              : TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 110, 220, 152),
                    icon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    hintText: 'ค้นหาจังหวัด',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                  onChanged: (val) {
                    setState(() {
                      province = val;
                    });
                  },
                ),
          actions: [
            !searchState
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          searchState = !searchState;
                        });
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          searchState = !searchState;
                        });
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
          ]),
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: StreamBuilder<QuerySnapshot>(
          stream: (province != '' && province != null)
              ? FirebaseFirestore.instance
                  .collection('dataarea')
                  .where('key', arrayContains: province)
                  .snapshots()
              : FirebaseFirestore.instance.collection('dataarea').snapshots(),
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
                            Container(
                              height: 200,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: const Color.fromARGB(255, 235, 222, 174),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 30,
                                      child: FittedBox(
                                        child: Image.asset('images/a.png'),
                                      ),
                                    ),
                                    title: Text(
                                      data["drop"] +
                                          '\n' +
                                          'Province : ' +
                                          ' ' +
                                          data["province"],
                                      style: GoogleFonts.mali(
                                        fontSize: 18.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'Address : ' +
                                          ' ' +
                                          data["add"] +
                                          '\n' +
                                          'Corn Species : ' +
                                          ' ' +
                                          data["species"] +
                                          '\n' +
                                          'Damage Area : ' +
                                          ' ' +
                                          data["area"] +
                                          '\n' +
                                          'Aate of Disease :' +
                                          ' ' +
                                          data["day"] +
                                          ' ' +
                                          data["mont"] +
                                          ' ' +
                                          data["year"],
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

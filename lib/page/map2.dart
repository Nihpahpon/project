// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class show3 extends StatefulWidget {
  const show3({super.key});

  @override
  State<show3> createState() => _show3State();
}

class _show3State extends State<show3> {
  User? _user = FirebaseAuth.instance.currentUser;
  var province;
  var name = "un";

  Future getUserData() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(_user!.email)
        .snapshots()
        .listen((event) {
      setState(() {
        province = event.get('province');
      });
    });
  }

  Future getProfile(user_email) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user_email)
        .snapshots()
        .listen((event) {
      name = event.get('name');
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 132, 106),
        title: Text(
          'ข้อมูลข่าวสาร',
          style: GoogleFonts.mali(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('จังหวัด')
              .doc(province)
              .collection("notification")
              .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      getProfile(data['emailuser']);
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
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 0, 10, 10),
                                    child: ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                        ],
                                      ),
                                      subtitle: Text(
                                        '\n' +
                                            'ชื่อผู้แจ้ง : ' +
                                            ' ' +
                                            name +
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
                                            data["age"] +
                                            '\n' +
                                            'จำนวนความเสียหาย : ' +
                                            ' ' +
                                            data["area"].toString() +
                                            ' ' +
                                            'ต้น',
                                        style: GoogleFonts.mali(
                                          fontSize: 18.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Show3 extends StatefulWidget {
//   const Show3({Key? key}) : super(key: key);

//   @override
//   State<Show3> createState() => _Show3State();
// }

// class _Show3State extends State<Show3> {
//   late GoogleMapController myController;
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
//   User? user = FirebaseAuth.instance.currentUser;

//   void initMarker(specify, specifyID) async {
//     var markerIdVal = specifyID;
//     final MarkerId markerId = MarkerId(markerIdVal);
//     final Marker marker = Marker(
//       markerId: markerId,
//       position:
//           LatLng(specify['location'].latitude, specify['location'].longitude),
//     );
//     setState(() {
//       markers[markerId] = marker;
//     });
//   }

//   getMarkerData() async {
//     FirebaseFirestore.instance
//         .collection('user')
//         .doc(user!.uid)
//         .collection('disease')
//         .get()
//         .then((myMockData) {
//       if (myMockData.docs.isNotEmpty) {
//         for (int i = 0; i < myMockData.docs.length; i++) {
//           initMarker(myMockData.docs[i].data(), myMockData.docs[i].id);
//         }
//       }
//     });
//   }

//   @override
//   void initState() {
//     getMarkerData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Color.fromARGB(255, 255, 255, 255),
//         ),
//         backgroundColor: const Color.fromARGB(255, 10, 132, 106),
//         automaticallyImplyLeading: true,
//         title: Text(
//           'แผนที่การเกิดโรค',
//           textAlign: TextAlign.start,
//           style: GoogleFonts.mali(
//               color: const Color.fromARGB(255, 254, 255, 255),
//               fontSize: 24,
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: const CameraPosition(
//             target: LatLng(15.417705418629433, 100.68411204842045), zoom: 10.0),
//         onMapCreated: (GoogleMapController controller) {
//           controller = controller;
//         },
//         markers: Set<Marker>.of(markers.values),
//       ),
//     );
//   }
// }

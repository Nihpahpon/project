// import 'package:cloud_firestore/cloud_firestore.dart';
// //import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// //import 'package:geocoder/geocoder.dart' as geoCo;
// import 'package:geocoding/geocoding.dart' as geoCo;
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Googlemap extends StatefulWidget {
//   const Googlemap({Key? key}) : super(key: key);

//   @override
//   State<Googlemap> createState() => _GooglemapState();
// }

// class _GooglemapState extends State<Googlemap> {
//   late GoogleMapController googleMapController;
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
//   late Position position;
//   late String addressLocation;
//   late String country;
//   late String postalCode;

//   void getMarkers(double lat, double long) {
//     MarkerId markerId = MarkerId(lat.toString() + long.toString());
//     Marker _marker = Marker(
//         markerId: markerId,
//         position: LatLng(lat, long),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
//         infoWindow: InfoWindow(snippet: addressLocation));
//     setState(() {
//       markers[markerId] = _marker;
//     });
//   }

//   void getCurrentLocation() async {
//     Position currentPosition =
//         await GeolocatorPlatform.instance.getCurrentPosition();
//     setState(() {
//       position = currentPosition;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 600.0,
//               child: GoogleMap(
//                   onTap: (tapped) async {
//                     final coordinated =
//                         geoCo.Coordinates(tapped.latitude, tapped.longitude);
//                     var address = await geoCo.Geocoder.local
//                         .findAddressesFromCoordinates(coordinated);
//                     var firstAddress = address.first;
//                     getMarkers(tapped.latitude, tapped.longitude);
//                     await FirebaseFirestore.instance
//                         .collection('location')
//                         .add({
//                       'latitude': tapped.latitude,
//                       'longitude': tapped.longitude,
//                       'Address': firstAddress.addressLine,
//                       'Country': firstAddress.countryName,
//                       'PostalCode': firstAddress.postalCode
//                     });
//                     setState(() {
//                       country = firstAddress.countryName;
//                       postalCode = firstAddress.postalCode;
//                       addressLocation = firstAddress.addressLine;
//                     });
//                   },
//                   mapType: MapType.hybrid,
//                   compassEnabled: true,
//                   trafficEnabled: true,
//                   onMapCreated: (GoogleMapController controller) {
//                     setState(() {
//                       googleMapController = controller;
//                     });
//                   },
//                   initialCameraPosition: const CameraPosition(
//                       target: LatLng(21.1428, 79.08820), zoom: 15.0),
//                   markers: Set<Marker>.of(markers.values)),
//             ),
//             Text('Address : $addressLocation'),
//             Text('PostalCode : $postalCode'),
//             Text('Country : $country')
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:loginapp/page/savedata1.dart';
import 'package:loginapp/states/constant.dart';

class Googlemap extends StatefulWidget {
  const Googlemap({Key? key}) : super(key: key);

  @override
  State<Googlemap> createState() => _GooglemapState();
}

class _GooglemapState extends State<Googlemap> {
  final formKey = GlobalKey<FormState>();
  double? lat, lng;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    findLatlng();
  }

  Future<void> findLatlng() async {
    LocationData? locationData = await findLocationData();
    setState(() {
      lat = locationData!.latitude!;
      lng = locationData.longitude!;
    });
    print('lat = $lat,log = $lng');
  }

  Future<LocationData?> findLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 132, 106),
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Savedata1(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Text(
            'พื้นที่การเกิดโรค',
            textAlign: TextAlign.start,
            style: GoogleFonts.mali(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                lat == null ? Mystyle().showProgress() : shoeMap(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Set<Marker> myMarker() {
    // ignore: prefer_collection_literals
    return <Marker>[
      Marker(
        markerId: const MarkerId('Farmar'),
        position: LatLng(lat!, lng!),
      )
    ].toSet();
  }

  Container shoeMap() {
    LatLng latLng = LatLng(lat!, lng!);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16.0,
    );
    return Container(
      height: 690,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: myMarker(),
      ),
    );
  }
}

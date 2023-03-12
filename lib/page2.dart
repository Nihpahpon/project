import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Showedata extends StatefulWidget {
  const Showedata({Key? key}) : super(key: key);

  @override
  State<Showedata> createState() => _ShowedataState();
}

class _ShowedataState extends State<Showedata> {
  var now = DateTime.now();
  bool searchState = false;
  String? dropdownValue;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 132, 106),
        title: !searchState
            ? Text(
                'รายละเอียด',
                textAlign: TextAlign.start,
                style: GoogleFonts.mali(
                    color: const Color.fromARGB(255, 254, 255, 255),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: buildDropdown(size),
              ),
        actions: [
          !searchState
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                              5.0) //                 <--- border radius here
                          ),
                      color: Color.fromARGB(255, 234, 195, 67),
                    ),
                    child: TextButton(
                      child: const Text('เลือกจังหวัด'),
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          searchState = !searchState;
                        });
                      },
                    ),
                  ),

                  // child: IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       searchState = !searchState;
                  //     });
                  //   },
                  //   icon: const Icon(
                  //     Icons.search,
                  //     color: Color.fromARGB(255, 255, 255, 255),
                  //   ),
                  // ),
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        searchState = !searchState;
                      });
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: StreamBuilder<QuerySnapshot>(
          stream: (dropdownValue != '' && dropdownValue != null)
              ? FirebaseFirestore.instance
                  .collection('user')
                  .where('province', isEqualTo: '$dropdownValue')
                  .snapshots()
              : FirebaseFirestore.instance.collection('user').snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return Container(
                        padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                        child: Column(
                          children: [
                            Container(
                              height: 170,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: const Color.fromARGB(255, 163, 202, 234),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ListTile(
                                    leading: Image.network(
                                      data["urlpictuer"],
                                      fit: BoxFit.contain,
                                    ),
                                    title: Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'ชื่อเกษตรกร : ' +
                                          ' ' +
                                          data["name"] +
                                          '\n' +
                                          'จังหวัด : ' +
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
                                      'เบอร์โทรศัพท์ : ' +
                                          ' ' +
                                          data["phone"] +
                                          '\n' +
                                          'เพศ : ' +
                                          ' ' +
                                          data["typesex"],
                                      style: GoogleFonts.mali(
                                        fontSize: 18.0,
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

  Row buildDropdown(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white),
          ),
          width: 700,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  'กรุณาเลือกจังหวัดของคุณ',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              value: dropdownValue,
              isExpanded: true,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                'กรุงเทพมหานคร',
                'กระบี่',
                'กาญจนบุรี',
                'กาฬสินธุ์',
                'กำแพงเพชร',
                'ขอนแก่น',
                'จันทบุรี',
                'ฉะเชิงเทรา',
                'ชลบุรี',
                'ชัยนาท',
                'ชัยภูมิ',
                'ชุมพร',
                'เชียงราย',
                'เชียงใหม่',
                'ตรัง',
                'ตราด',
                'ตาก',
                'นครนายก',
                'นครปฐม',
                'นครพนม',
                'นครราชสีมา',
                'นครศรีธรรมราช',
                'นครสวรรค์',
                'นนทบุรี',
                'นราธิวาส',
                'น่าน',
                'บึงกาฬ',
                'บุรีรัมย์',
                'ปทุมธานี',
                'ประจวบคีรีขันธ์',
                'ปราจีนบุรี',
                'ปัตตานี',
                'พระนครศรีอยุธยา',
                'พังงา',
                'พัทลุง',
                'พิจิตร',
                'พิษณุโลก',
                'เพชรบุรี',
                'เพชรบูรณ์',
                'แพร่',
                'พะเยา',
                'ภูเก็ต',
                'มหาสารคาม',
                'มุกดาหาร',
                'แม่ฮ่องสอน',
                'ยะลา',
                'ยโสธร',
                'ร้อยเอ็ด',
                'ระนอง',
                'ระยอง',
                'ราชบุรี',
                'ลพบุรี',
                'ลำปาง',
                'ลำพูน',
                'เลย',
                'ศรีสะเกษ',
                'สกลนคร',
                'สงขลา',
                'สตูล',
                'สมุทรปราการ',
                'สมุทรสงคราม',
                'สมุทรสาคร',
                'สระแก้ว',
                'สระบุรี',
                'สิงห์บุรี',
                'สุโขทัย',
                'สุพรรณบุรี',
                'สุราษฎร์ธานี',
                'สุรินทร์',
                'หนองคาย',
                'หนองบัวลำภู',
                'อ่างทอง',
                'อุดรธานี',
                'อุทัยธานี',
                'อุตรดิตถ์',
                'อุบลราชธานี',
                'อำนาจเจริญ'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:loginapp/page/diagnose.dart';
// import 'package:loginapp/states/constant.dart';

// import 'savedata.dart';

// class Cornleaf extends StatefulWidget {
//   const Cornleaf({Key? key}) : super(key: key);

//   @override
//   State<Cornleaf> createState() => _CornleafState();
// }

// class _CornleafState extends State<Cornleaf> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.black,
//         ),
//         backgroundColor: MyConstant.primary,
//         leading: InkWell(
//           onTap: () async {
//             await Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const Screen2(),
//               ),
//             );
//           },
//           child: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             size: 25,
//           ),
//         ),
//         title: Padding(
//           padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//           child: Text(
//             'ข้อมูลโรค',
//             textAlign: TextAlign.start,
//             style: GoogleFonts.mali(
//                 color: const Color.fromARGB(255, 255, 255, 255),
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.grey[50],
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: const BoxDecoration(
//               color: Color(0xFFEEEEEE),
//             ),
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                     child: Container(
//                       width: double.infinity,
//                       height: 250,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFEEEEEE),
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: Image.asset(
//                             'images/y.png',
//                           ).image,
//                         ),
//                         borderRadius: BorderRadius.circular(20),
//                         shape: BoxShape.rectangle,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         const EdgeInsetsDirectional.fromSTEB(50, 40, 30, 0),
//                     child: Text(
//                       'โรคใบไหม้แผลใหญ่',
//                       style: GoogleFonts.mali(
//                           color: const Color.fromARGB(255, 53, 143, 53),
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 45,
//                   ),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Image.asset(
//                           'images/r.png',
//                           width: 35,
//                           height: 35,
//                           fit: BoxFit.cover,
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                           child: Text(
//                             'เชื้อสาเหตุ',
//                             style: GoogleFonts.mali(
//                                 color: const Color.fromARGB(255, 0, 0, 0),
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   const Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
//                     child: Text(
//                       'เชื้อรา Exserohilum turcicum',
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 0, 0, 0),
//                           fontSize: 20,
//                           fontStyle: FontStyle.italic),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Image.asset(
//                           'images/i.png',
//                           width: 30,
//                           height: 30,
//                           fit: BoxFit.cover,
//                         ),
//                         Padding(
//                           padding:
//                               const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                           child: Text(
//                             'ลักษณะอาการ',
//                             style: GoogleFonts.mali(
//                                 color: const Color.fromARGB(255, 0, 0, 0),
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
//                     child: Text(
//                       'จะเกิดได้ทุกส่วนของลำต้นข้าวโพดโดยเฉพาะบนใบ นอกจากนั้นจะพบที่กาบใบ ลำต้น และฝัก โดยเกิดเป็นแผลมีขนาดใหญ่สีเทาหรือสีน้ำตาลแผลมีลักษณะยาวตามใบ หัวท้ายเรียวคล้ายรูปกระสวย แผลมีขนาดระหว่าง 2.5-20 เซนติเมตร แผลที่เกิดบนใบอาจเกิดเดี่ยวๆ หรือหลายแผลซ้อนร่วมกันขยายเป็นขนาดใหญ่ ถ้าแผลขยายรวมกันมากๆจะทำให้ใบแห้งตายได้',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontSize: 20,
//                       ),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
//                     child: Text(
//                       'ในสภาพไร่พบที่ส่วนล่างของข้าวโพดก่อนแล้วอาการของโรคจะพัฒนาไปส่วนบนของต้นข้าวโพด เมื่อมีความชื้นสูงเชื้อราสร้างสปอร์สีดำบนแผลและขยายออกเห็นเป็นวงชั้น โรคนี้พบได้ตลอดฤดูเพาะปลูก พันธุ์อ่อนแออาการรุนแรงทำให้ผลผลิตลดลงได้ ถ้าเข้าทำลายพืชก่อนออกดอกทำให้ผลผลิตสูญเสียมาก แต่ถ้าเข้าทำลาย 6-8 สัปดาห์หลังจากข้าวโพดออกดอกแล้วไม่มีผลกระทบต่อผลผลิตการศึกษาความเสียหายจากโรคนี้ในข้าวโพดพันธุ์ลูกผสมควรทำการประเมินภายใน 3-6 สัปดาห์หลังการออกดอก',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontSize: 20,
//                       ),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         Image.asset(
//                           'images/i.png',
//                           width: 30,
//                           height: 30,
//                           fit: BoxFit.cover,
//                         ),
//                         Padding(
//                           padding: const EdgeInsetsDirectional.fromSTEB(
//                               10, 0, 10, 0),
//                           child: Text(
//                             'การป้องกัน',
//                             style: GoogleFonts.mali(
//                                 color: const Color.fromARGB(255, 0, 0, 0),
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
//                     child: Text(
//                       '1. การปลูกพืชหมุนเวียน เผาทำลายเศษซากพืชเป็นโรค  ',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontSize: 20,
//                       ),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
//                     child: Text(
//                       '2. การเขตกรรมที่เหมาะสม ไม่ปลูกพืชหนาแน่นและใส่ปุ๋ยไนโตรเจนปริมาณสูง หลีกเลี่ยงการปลูกข้าวโพดแซมไม้ยืนต้น เช่นมะม่วง ยางพารา มะละกอ เพราะมีร่มเงาทำให้โรคระบาดได้',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontSize: 20,
//                       ),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
//                     child: Text(
//                       '3. ใช้พันธุ์ต้านทานต่อโรค เช่น นครสวรรค์ 1 นครสวรรค์ 72',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 0, 0, 0),
//                         fontSize: 20,
//                       ),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: const EdgeInsetsDirectional.fromSTEB(140, 0, 0, 0),
//                     child: SizedBox(
//                       width: 200,
//                       height: 50,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           elevation: 10,
//                           primary: MyConstant.dart, // background
//                           onPrimary: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ), // foreground
//                         ),
//                         child: Text(
//                           "เก็บข้อมูลเชิงพื้นที่",
//                           style: GoogleFonts.mali(
//                             color: const Color.fromARGB(255, 255, 255, 255),
//                             fontSize: 20,
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pushReplacement(context,
//                               MaterialPageRoute(builder: (context) {
//                             return const Savedata();
//                           }));
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

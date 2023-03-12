import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Disease extends StatefulWidget {
  const Disease({Key? key}) : super(key: key);

  @override
  State<Disease> createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: true,
        title: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Text(
            'ข้อมูลโรค',
            textAlign: TextAlign.start,
            style: GoogleFonts.mali(
                color: const Color(0xff00766c),
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFEEEEEE),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(50, 40, 50, 0),
                    child: Text(
                      'โรคใบจุด',
                      style: GoogleFonts.mali(
                          color: const Color.fromARGB(255, 53, 143, 53),
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'images/l.png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'images/r.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'เชื้อสาเหตุ',
                            style: GoogleFonts.mali(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                    child: Text(
                      'เชื้อรา Bipolaris zeicola (Stout). Shoemaker  ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'images/i.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'ลักษณะอาการ',
                            style: GoogleFonts.mali(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                    child: Text(
                      'พบอาการตั้งแต่ใบแรกจนถึงใบธง แผลเป็นจุดค่อนข้างกลมสีเหลืองหรือน้ำตาลขนาดเล็ก มีวงแหวนสีเหลืองล้อมรอบ (halo) ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'images/i.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 0),
                          child: Text(
                            'การป้องกัน',
                            style: GoogleFonts.mali(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                    child: Text(
                      '1.ใช้เมล็ดพันธุ์จากต้นที่ปลอดโรค'
                      '\n'
                      '2.ใช้เมล็ดพันธุ์ที่ต้านทานโรค'
                      '\n'
                      '3.หลีกเลี่ยงการใช้ปุ๋ยไนโตรเจนปริมาณสูง และการปลูกพืชหนาแน่น'
                      '\n'
                      '4. ฉีดพ่นด้วยสาร คลอโรทาโลนิล(ลีนิล) หรือ แมนโคเซป(ฮัมบรูก) ทุกๆ 7 วัน หรือพ่นด้วยสารป้องกันกำจัดโรคพืชไตรโฟรีน (ซาพรอล) อัตรา 20 ซีซี ต่อน้ำ 20 ลิตร และทำลายเศษซากของข้าวโพดหลังเก็บเกี่ยว',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(50, 40, 50, 0),
                    child: Text(
                      'โรคราสนิม',
                      style: GoogleFonts.mali(
                          color: const Color.fromARGB(255, 53, 143, 53),
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'images/p.png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'images/r.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'เชื้อสาเหตุ',
                            style: GoogleFonts.mali(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                    child: Text(
                      'เชื้อรา Puccinia polysora Underw.',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'images/i.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'ลักษณะอาการ',
                            style: GoogleFonts.mali(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                    child: Text(
                      'อาการของโรคจะเกิดได้แทบทุกส่วนของต้นข้าวโพด คือ ใบ ลำต้น กาบใบ ฝัก ช่อดอกตัวผู้โดยแสดงอาการเป็นจุดนูนเล็กๆ สีน้ำตาลแดง ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'images/i.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 0),
                          child: Text(
                            'การป้องกัน',
                            style: GoogleFonts.mali(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                    child: Text(
                      '1. หลีกเลี่ยงการปลูกข้าวโพดพันธุ์อ่อนแอ'
                      '\n'
                      '2. ควรปลูกพันธุ์ต้านทานโรคหรือปลูกพืชอื่นแทนข้าวโพดในฤดูหนาว'
                      '\n'
                      '3. กำจัดวัชพืชและเผาทำลายต้นที่เป็นโรค'
                      '\n'
                      '4. หมั่นสำรวจแปลงอยู่เสมอตั้งแต่ระยะกล้า เมื่อเริ่มพบโรคระบาดมีจุดสนิม 3 - 4 จุดต่อใบ ให้พ่นด้วยสารป้องกันกำจัดเชื้อราทุก 7 วัน จำนวน 2 - 4 ครั้ง ตามความรุนแรงของโรค เช่น'
                      '\n'
                      '-ไดฟิโนโคนาโซล (สกอร์) 250 อีซี อัตรา 20 มล.ต่อน้ำ 20 ลิตร '
                      '\n'
                      '-แมนโคเซบ 80% ดับบลิวพี อัตรา 40 กรัมต่อน้ำ 20 ลิตร',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(50, 40, 30, 0),
                    child: Text(
                      'โรคใบไหม้แผลใหญ่',
                      style: GoogleFonts.mali(
                          color: const Color.fromARGB(255, 53, 143, 53),
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEEEEE),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'images/y.png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'images/r.png',
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'เชื้อสาเหตุ',
                            style: GoogleFonts.mali(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                    child: Text(
                      'เชื้อรา Exserohilum turcicum',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'images/i.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            'ลักษณะอาการ',
                            style: GoogleFonts.mali(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                    child: Text(
                      'จะเกิดได้ทุกส่วนของลำต้นข้าวโพดโดยเฉพาะบนใบ นอกจากนั้นจะพบที่กาบใบ ลำต้น และฝัก โดยเกิดเป็นแผลมีขนาดใหญ่สีเทาหรือสีน้ำตาลแผลมีลักษณะยาวตามใบ หัวท้ายเรียวคล้ายรูปกระสวย ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          'images/i.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 0),
                          child: Text(
                            'การป้องกัน',
                            style: GoogleFonts.mali(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                    child: Text(
                      '๑. ปลูกข้าวโพดพันธุ์ต้านทาน เช่น นครสวรรค์ ๑ นครสวรรค์ ๗๒'
                      '\n'
                      '๒. หลีกเลี่ยงการปลูกข้าวโพดหลายฤดูกาลติดต่อกัน'
                      '\n'
                      '๓. หมั่นสำรวจแปลง เมื่อเริ่มพบข้าวโพดเริ่มแสดงอาการพ่นด้วยสารป้องกันกำจัดเชื้อรา เช่น'
                      '\n'
                      '- โพรพิโคนาโซล ๒๕% อีซี อัตรา ๑๕ มิลลิลิตร ต่อน้ำ ๒๐ ลิตร '
                      '\n'
                      '- อะซอกซี่สะโตรบิน + ไดฟีโนโคนาโซล อัตรา ๑๕ มิลลิลิตร ต่อน้ำ ๒๐ ลิตร'
                      '\n'
                      '- คาร์เบนดาซิม + อีพอกซี่โคนาโซล อัตรา ๒๕ มิลลิลิตร ต่อน้ำ ๒๐ ลิตร'
                      '\n'
                      'พ่นทุก ๗ วัน จำนวน ๒ ถึง ๔ ครั้ง ตามความรุนแรงของโรค'
                      '\n'
                      '๔. ปลูกพืชหมุนเวียน กำจัดวัชพืช ถอนต้นข้าวโพดที่เป็นโรคไปเผาทำลาย',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:web/home.dart';
import 'package:web/widgets/constant.dart';

class Screen1 extends StatefulWidget {
  const Screen1({
    Key? key,
  }) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 13, 100, 66),
        ),
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
        backgroundColor: MyConstant.dart,
        title: Text(
          'พื้นที่การเกิดโรค',
          textAlign: TextAlign.start,
          style: GoogleFonts.mali(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ChoroplethMap(),
          ],
        ),
      ),
    );
  }
}

class _ChoroplethMap extends StatefulWidget {
  @override
  __ChoroplethMapState createState() => __ChoroplethMapState();
}

class __ChoroplethMapState extends State<_ChoroplethMap> {
  late List<_CountryDensityModel> _worldPopulationDensityDetails;
  late MapShapeSource _mapShapeSource;

  var Bangkok;
  var Bangkok1;

  Timer? _timer;
  Future<void> get1() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('กรุงเทพมหานคร')
        .get()
        .then((value) {
      setState(() {
        Bangkok = value.data()!['area'];
        Bangkok1 = value.data()!['province'];
      });
    });
  }

  var Krabi;
  var Krabi1;

  Future<void> get2() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('กระบี่')
        .get()
        .then((value) {
      setState(() {
        Krabi = value.data()!['area'];
        Krabi1 = value.data()!['province'];
      });
    });
  }

  var Kanchanaburi;
  var Kanchanaburi1;

  Future<void> get3() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('กาญจนบุรี')
        .get()
        .then((value) {
      setState(() {
        Kanchanaburi = value.data()!['area'];
        Kanchanaburi1 = value.data()!['province'];
      });
    });
  }

  var Kalasin;
  var Kalasin1;

  Future<void> get4() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('กาฬสินธุ์')
        .get()
        .then((value) {
      setState(() {
        Kalasin = value.data()!['area'];
        Kalasin1 = value.data()!['province'];
      });
    });
  }

  var KamphaengPhet;
  var KamphaengPhet1;

  Future<void> get5() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('กำแพงเพชร')
        .get()
        .then((value) {
      setState(() {
        KamphaengPhet = value.data()!['area'];
        KamphaengPhet1 = value.data()!['province'];
      });
    });
  }

  var KhonKaen;
  var KhonKaen1;

  Future<void> get6() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ขอนแก่น')
        .get()
        .then((value) {
      setState(() {
        KhonKaen = value.data()!['area'];
        KhonKaen1 = value.data()!['province'];
      });
    });
  }

  var Chanthaburi;
  var Chanthaburi1;

  Future<void> get7() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('จันทบุรี')
        .get()
        .then((value) {
      setState(() {
        Chanthaburi = value.data()!['area'];
        Chanthaburi1 = value.data()!['province'];
      });
    });
  }

  var Chachoengsao;
  var Chachoengsao1;

  Future<void> get8() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ฉะเชิงเทรา')
        .get()
        .then((value) {
      setState(() {
        Chachoengsao = value.data()!['area'];
        Chachoengsao1 = value.data()!['province'];
      });
    });
  }

  var Chonburi;
  var Chonburi1;

  Future<void> get9() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ชลบุรี')
        .get()
        .then((value) {
      setState(() {
        Chonburi = value.data()!['area'];
        Chonburi1 = value.data()!['province'];
      });
    });
  }

  var Chainat;
  var Chainat1;

  Future<void> get10() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ชัยนาท')
        .get()
        .then((value) {
      setState(() {
        Chainat = value.data()!['area'];
        Chainat1 = value.data()!['province'];
      });
    });
  }

  var Chaiyaphum;
  var Chaiyaphum1;

  Future<void> get11() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ชัยภูมิ')
        .get()
        .then((value) {
      setState(() {
        Chaiyaphum = value.data()!['area'];
        Chaiyaphum1 = value.data()!['province'];
      });
    });
  }

  var Chumphon;
  var Chumphon1;

  Future<void> get12() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ชุมพร')
        .get()
        .then((value) {
      setState(() {
        Chumphon = value.data()!['area'];
        Chumphon1 = value.data()!['province'];
      });
    });
  }

  var ChiangRai;
  var ChiangRai1;

  Future<void> get13() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('เชียงราย')
        .get()
        .then((value) {
      setState(() {
        ChiangRai = value.data()!['area'];
        ChiangRai1 = value.data()!['province'];
      });
    });
  }

  var ChiangMai;
  var ChiangMai1;

  Future<void> get14() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('เชียงใหม่')
        .get()
        .then((value) {
      setState(() {
        ChiangMai = value.data()!['area'];
        ChiangMai1 = value.data()!['province'];
      });
    });
  }

  var Trang;
  var Trang1;

  Future<void> get15() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ตรัง')
        .get()
        .then((value) {
      setState(() {
        Trang = value.data()!['area'];
        Trang1 = value.data()!['province'];
      });
    });
  }

  var Trat;
  var Trat1;

  Future<void> get16() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ตราด')
        .get()
        .then((value) {
      setState(() {
        Trat = value.data()!['area'];
        Trat1 = value.data()!['province'];
      });
    });
  }

  var Tak;
  var Tak1;

  Future<void> get17() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ตาก')
        .get()
        .then((value) {
      setState(() {
        Tak = value.data()!['area'];
        Tak1 = value.data()!['province'];
      });
    });
  }

  var NakhonNayok;
  var NakhonNayok1;

  Future<void> get18() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('นครนายก')
        .get()
        .then((value) {
      setState(() {
        NakhonNayok = value.data()!['area'];
        NakhonNayok1 = value.data()!['province'];
      });
    });
  }

  var NakhonPathom;
  var NakhonPathom1;

  Future<void> get19() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('นครปฐม')
        .get()
        .then((value) {
      setState(() {
        NakhonPathom = value.data()!['area'];
        NakhonPathom1 = value.data()!['province'];
      });
    });
  }

  var NakhonPhanom;
  var NakhonPhanom1;

  Future<void> get20() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('นครพนม')
        .get()
        .then((value) {
      setState(() {
        NakhonPhanom = value.data()!['area'];
        NakhonPhanom1 = value.data()!['province'];
      });
    });
  }

  var NakhonRatchasima;
  var NakhonRatchasima1;

  Future<void> get21() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('นครราชสีมา')
        .get()
        .then((value) {
      setState(() {
        NakhonRatchasima = value.data()!['area'];
        NakhonRatchasima1 = value.data()!['province'];
      });
    });
  }

  var NakhonSiThammarat;
  var NakhonSiThammarat1;

  Future<void> get22() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('นครศรีธรรมราช')
        .get()
        .then((value) {
      setState(() {
        NakhonSiThammarat = value.data()!['area'];
        NakhonSiThammarat1 = value.data()!['province'];
      });
    });
  }

  var NakhonSawan;
  var NakhonSawan1;

  Future<void> get23() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('นครสวรรค์')
        .get()
        .then((value) {
      setState(() {
        NakhonSawan = value.data()!['area'];
        NakhonSawan1 = value.data()!['province'];
      });
    });
  }

  var Nonthaburi;
  var Nonthaburi1;

  Future<void> get24() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('นนทบุรี')
        .get()
        .then((value) {
      setState(() {
        Nonthaburi = value.data()!['area'];
        Nonthaburi1 = value.data()!['province'];
      });
    });
  }

  var Narathiwat;
  var Narathiwat1;

  Future<void> get25() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('นราธิวาส')
        .get()
        .then((value) {
      setState(() {
        Narathiwat = value.data()!['area'];
        Narathiwat1 = value.data()!['province'];
      });
    });
  }

  var Nan;
  var Nan1;

  Future<void> get26() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('น่าน')
        .get()
        .then((value) {
      setState(() {
        Nan = value.data()!['area'];
        Nan1 = value.data()!['province'];
        ;
      });
    });
  }

  var BuengKan;
  var BuengKan1;

  Future<void> get27() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('บึงกาฬ')
        .get()
        .then((value) {
      setState(() {
        BuengKan = value.data()!['area'];
        BuengKan1 = value.data()!['province'];
      });
    });
  }

  var Buriram;
  var Buriram1;

  Future<void> get28() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('บุรีรัมย์')
        .get()
        .then((value) {
      setState(() {
        Buriram = value.data()!['area'];
        Buriram1 = value.data()!['province'];
      });
    });
  }

  var PathumThani;
  var PathumThani1;

  Future<void> get29() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ปทุมธานี')
        .get()
        .then((value) {
      setState(() {
        PathumThani = value.data()!['area'];
        PathumThani1 = value.data()!['province'];
      });
    });
  }

  var PrachuapKhiriKhan;
  var PrachuapKhiriKhan1;

  Future<void> get30() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ประจวบคีรีขันธ์')
        .get()
        .then((value) {
      setState(() {
        PrachuapKhiriKhan = value.data()!['area'];
        PrachuapKhiriKhan1 = value.data()!['province'];
      });
    });
  }

  var Prachinburi;
  var Prachinburi1;

  Future<void> get31() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ปราจีนบุรี')
        .get()
        .then((value) {
      setState(() {
        Prachinburi = value.data()!['area'];
        Prachinburi1 = value.data()!['province'];
      });
    });
  }

  var Pattani;
  var Pattani1;

  Future<void> get32() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ปัตตานี')
        .get()
        .then((value) {
      setState(() {
        Pattani = value.data()!['area'];
        Pattani1 = value.data()!['province'];
      });
    });
  }

  var PhraNakhonSiAyutthaya;
  var PhraNakhonSiAyutthaya1;

  Future<void> get33() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('พระนครศรีอยุธยา')
        .get()
        .then((value) {
      setState(() {
        PhraNakhonSiAyutthaya = value.data()!['area'];
        PhraNakhonSiAyutthaya1 = value.data()!['province'];
      });
    });
  }

  var Phayao;
  var Phayao1;

  Future<void> get34() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('พะเยา')
        .get()
        .then((value) {
      setState(() {
        Phayao = value.data()!['area'];
        Phayao1 = value.data()!['province'];
      });
    });
  }

  var PhangNga;
  var PhangNga1;

  Future<void> get35() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('พังงา')
        .get()
        .then((value) {
      setState(() {
        PhangNga = value.data()!['area'];
        PhangNga1 = value.data()!['province'];
      });
    });
  }

  var Phatthalung;
  var Phatthalung1;

  Future<void> get36() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('พัทลุง')
        .get()
        .then((value) {
      setState(() {
        Phatthalung = value.data()!['area'];
        Phatthalung1 = value.data()!['province'];
      });
    });
  }

  var Phichit;
  var Phichit1;

  Future<void> get37() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('พิจิตร')
        .get()
        .then((value) {
      setState(() {
        Phichit = value.data()!['area'];
        Phichit1 = value.data()!['province'];
      });
    });
  }

  var Phitsanulok;
  var Phitsanulok1;

  Future<void> get38() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('พิษณุโลก')
        .get()
        .then((value) {
      setState(() {
        Phitsanulok = value.data()!['area'];
        Phitsanulok1 = value.data()!['province'];
      });
    });
  }

  var Phetchaburi;
  var Phetchaburi1;

  Future<void> get39() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('เพชรบุรี')
        .get()
        .then((value) {
      setState(() {
        Phetchaburi = value.data()!['area'];
        Phetchaburi1 = value.data()!['province'];
      });
    });
  }

  var Phetchabun;
  var Phetchabun1;

  Future<void> get40() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('เพชรบูรณ์')
        .get()
        .then((value) {
      setState(() {
        Phetchabun = value.data()!['area'];
        Phetchabun1 = value.data()!['province'];
      });
    });
  }

  var Phrae;
  var Phrae1;

  Future<void> get41() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('แพร่')
        .get()
        .then((value) {
      setState(() {
        Phrae = value.data()!['area'];
        Phrae1 = value.data()!['province'];
      });
    });
  }

  var Phuket;
  var Phuket1;

  Future<void> get42() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ภูเก็ต')
        .get()
        .then((value) {
      setState(() {
        Phuket = value.data()!['area'];
        Phuket1 = value.data()!['province'];
      });
    });
  }

  var MahaSarakham;
  var MahaSarakham1;

  Future<void> get43() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('มหาสารคาม')
        .get()
        .then((value) {
      setState(() {
        MahaSarakham = value.data()!['area'];
        MahaSarakham1 = value.data()!['province'];
      });
    });
  }

  var Mukdahan;
  var Mukdahan1;

  Future<void> get44() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('มุกดาหาร')
        .get()
        .then((value) {
      setState(() {
        Mukdahan = value.data()!['area'];
        Mukdahan1 = value.data()!['province'];
      });
    });
  }

  var MaeHongSon;
  var MaeHongSon1;

  Future<void> get45() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('แม่ฮ่องสอน')
        .get()
        .then((value) {
      setState(() {
        MaeHongSon = value.data()!['area'];
        MaeHongSon1 = value.data()!['province'];
      });
    });
  }

  var Yasothon;
  var Yasothon1;

  Future<void> get46() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ยโสธร')
        .get()
        .then((value) {
      setState(() {
        Yasothon = value.data()!['area'];
        Yasothon1 = value.data()!['province'];
      });
    });
  }

  var Yala;
  var Yala1;

  Future<void> get47() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ยะลา')
        .get()
        .then((value) {
      setState(() {
        Yala = value.data()!['area'];
        Yala1 = value.data()!['province'];
      });
    });
  }

  var RoiEt;
  var RoiEt1;

  Future<void> get48() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ร้อยเอ็ด')
        .get()
        .then((value) {
      setState(() {
        RoiEt = value.data()!['area'];
        RoiEt1 = value.data()!['province'];
      });
    });
  }

  var Ranong;
  var Ranong1;

  Future<void> get49() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ระนอง')
        .get()
        .then((value) {
      setState(() {
        Ranong = value.data()!['area'];
        Ranong1 = value.data()!['province'];
      });
    });
  }

  var Rayong;
  var Rayong1;

  Future<void> get50() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ระยอง')
        .get()
        .then((value) {
      setState(() {
        Rayong = value.data()!['area'];
        Rayong1 = value.data()!['province'];
      });
    });
  }

  var Ratchaburi;
  var Ratchaburi1;

  Future<void> get51() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ราชบุรี')
        .get()
        .then((value) {
      setState(() {
        Ratchaburi = value.data()!['area'];
        Ratchaburi1 = value.data()!['province'];
      });
    });
  }

  var Lopburi;
  var Lopburi1;

  Future<void> get52() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ลพบุรี')
        .get()
        .then((value) {
      setState(() {
        Lopburi = value.data()!['area'];
        Lopburi1 = value.data()!['province'];
      });
    });
  }

  var Lampang;
  var Lampang1;

  Future<void> get53() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ลำปาง')
        .get()
        .then((value) {
      setState(() {
        Lampang = value.data()!['area'];
        Lampang1 = value.data()!['province'];
      });
    });
  }

  var Lamphun;
  var Lamphun1;

  Future<void> get54() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ลำพูน')
        .get()
        .then((value) {
      setState(() {
        Lamphun = value.data()!['area'];
        Lamphun1 = value.data()!['province'];
      });
    });
  }

  var Loei;
  var Loei1;

  Future<void> get55() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('เลย')
        .get()
        .then((value) {
      setState(() {
        Loei = value.data()!['area'];
        Loei1 = value.data()!['province'];
      });
    });
  }

  var Sisaket;
  var Sisaket1;

  Future<void> get56() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('ศรีสะเกษ')
        .get()
        .then((value) {
      setState(() {
        Sisaket = value.data()!['area'];
        Sisaket1 = value.data()!['province'];
      });
    });
  }

  var SakonNakhon;
  var SakonNakhon1;

  Future<void> get57() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สกลนคร')
        .get()
        .then((value) {
      setState(() {
        SakonNakhon = value.data()!['area'];
        SakonNakhon1 = value.data()!['province'];
      });
    });
  }

  var Songkhla;
  var Songkhla1;

  Future<void> get58() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สงขลา')
        .get()
        .then((value) {
      setState(() {
        Songkhla = value.data()!['area'];
        Songkhla1 = value.data()!['province'];
      });
    });
  }

  var Satun;
  var Satun1;

  Future<void> get59() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สตูล')
        .get()
        .then((value) {
      setState(() {
        Satun = value.data()!['area'];
        Satun1 = value.data()!['province'];
      });
    });
  }

  var SamutPrakan;
  var SamutPrakan1;

  Future<void> get60() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สมุทรปราการ')
        .get()
        .then((value) {
      setState(() {
        SamutPrakan = value.data()!['area'];
        SamutPrakan1 = value.data()!['province'];
      });
    });
  }

  var SamutSongkhram;
  var SamutSongkhram1;

  Future<void> get61() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สมุทรสงคราม')
        .get()
        .then((value) {
      setState(() {
        SamutSongkhram = value.data()!['area'];
        SamutSongkhram1 = value.data()!['province'];
      });
    });
  }

  var SamutSakhon;
  var SamutSakhon1;

  Future<void> get62() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สมุทรสาคร')
        .get()
        .then((value) {
      setState(() {
        SamutSakhon = value.data()!['area'];
        SamutSakhon1 = value.data()!['province'];
      });
    });
  }

  var SaKaeo;
  var SaKaeo1;

  Future<void> get63() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สระแก้ว')
        .get()
        .then((value) {
      setState(() {
        SaKaeo = value.data()!['area'];
        SaKaeo1 = value.data()!['province'];
      });
    });
  }

  var Saraburi;
  var Saraburi1;

  Future<void> get64() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สระบุรี')
        .get()
        .then((value) {
      setState(() {
        Saraburi = value.data()!['area'];
        Saraburi1 = value.data()!['province'];
      });
    });
  }

  var SingBuri;
  var SingBuri1;

  Future<void> get65() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สิงห์บุรี')
        .get()
        .then((value) {
      setState(() {
        SingBuri = value.data()!['area'];
        SingBuri1 = value.data()!['province'];
      });
    });
  }

  var Sukhothai;
  var Sukhothai1;

  Future<void> get66() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สุโขทัย')
        .get()
        .then((value) {
      setState(() {
        Sukhothai = value.data()!['area'];
        Sukhothai1 = value.data()!['province'];
      });
    });
  }

  var SuphanBuri;
  var SuphanBuri1;

  Future<void> get67() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สุพรรณบุรี')
        .get()
        .then((value) {
      setState(() {
        SuphanBuri = value.data()!['area'];
        SuphanBuri1 = value.data()!['province'];
      });
    });
  }

  var SuratThani;
  var SuratThani1;

  Future<void> get68() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สุราษฎร์ธานี')
        .get()
        .then((value) {
      setState(() {
        SuratThani = value.data()!['area'];
        SuratThani1 = value.data()!['province'];
      });
    });
  }

  var Surin;
  var Surin1;

  Future<void> get69() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('สุรินทร์')
        .get()
        .then((value) {
      setState(() {
        Surin = value.data()!['area'];
        Surin1 = value.data()!['province'];
      });
    });
  }

  var NongKhai;
  var NongKhai1;

  Future<void> get70() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('หนองคาย')
        .get()
        .then((value) {
      setState(() {
        NongKhai = value.data()!['area'];
        NongKhai1 = value.data()!['province'];
      });
    });
  }

  var NongBuaLamphu;
  var NongBuaLamphu1;

  Future<void> get71() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('หนองบัวลำภู')
        .get()
        .then((value) {
      setState(() {
        NongBuaLamphu = value.data()!['area'];
        NongBuaLamphu1 = value.data()!['province'];
      });
    });
  }

  var AngThong;
  var AngThong1;

  Future<void> get72() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('อ่างทอง')
        .get()
        .then((value) {
      setState(() {
        AngThong = value.data()!['area'];
        AngThong1 = value.data()!['province'];
      });
    });
  }

  var AmnatCharoen;
  var AmnatCharoen1;

  Future<void> get73() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('อำนาจเจริญ')
        .get()
        .then((value) {
      setState(() {
        AmnatCharoen = value.data()!['area'];
        AmnatCharoen1 = value.data()!['province'];
      });
    });
  }

  var UdonThani;
  var UdonThani1;

  Future<void> get74() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('อุดรธานี')
        .get()
        .then((value) {
      setState(() {
        UdonThani = value.data()!['area'];
        UdonThani1 = value.data()!['province'];
      });
    });
  }

  var Uttaradit;
  var Uttaradit1;

  Future<void> get75() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('อุตรดิตถ์')
        .get()
        .then((value) {
      setState(() {
        Uttaradit = value.data()!['area'];
        Uttaradit1 = value.data()!['province'];
      });
    });
  }

  var UthaiThani;
  var UthaiThani1;

  Future<void> get76() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('อุทัยธานี')
        .get()
        .then((value) {
      setState(() {
        UthaiThani = value.data()!['area'];
        UthaiThani1 = value.data()!['province'];
      });
    });
  }

  var UbonRatchathani;
  var UbonRatchathani1;

  Future<void> get77() async {
    return FirebaseFirestore.instance
        .collection('จังหวัด')
        .doc('อุบลราชธานี')
        .get()
        .then((value) {
      setState(() {
        UbonRatchathani = value.data()!['area'];
        UbonRatchathani1 = value.data()!['province'];
      });
    });
  }

  var dd = false;

  @override
  void initState() {
    super.initState();
    get1();
    get2();
    get3();
    get4();
    get5();
    get6();
    get7();
    get8();
    get9();
    get10();
    get11();
    get12();
    get13();
    get14();
    get15();
    get16();
    get17();
    get18();
    get19();
    get20();
    get21();
    get22();
    get23();
    get24();
    get25();
    get26();
    get27();
    get28();
    get29();
    get30();
    get31();
    get32();
    get33();
    get34();
    get35();
    get36();
    get37();
    get38();
    get39();
    get40();
    get41();
    get42();
    get43();
    get44();
    get45();
    get46();
    get47();
    get48();
    get49();
    get50();
    get51();
    get52();
    get53();
    get54();
    get55();
    get56();
    get57();
    get58();
    get59();
    get60();
    get61();
    get62();
    get63();
    get64();
    get65();
    get66();
    get67();
    get68();
    get69();
    get70();
    get71();
    get72();
    get73();
    get74();
    get75();
    get76();
    get77();

    _timer = Timer(const Duration(seconds: 1), (() {
      _worldPopulationDensityDetails = <_CountryDensityModel>[
        _CountryDensityModel(Bangkok1, Bangkok),
        _CountryDensityModel(Krabi1, Krabi),
        _CountryDensityModel(Kanchanaburi1, Kanchanaburi),
        _CountryDensityModel(Kalasin1, Kalasin),
        _CountryDensityModel(KamphaengPhet1, KamphaengPhet),
        _CountryDensityModel(KhonKaen1, KhonKaen),
        _CountryDensityModel(Chanthaburi1, Chanthaburi),
        _CountryDensityModel(Chachoengsao1, Chachoengsao),
        _CountryDensityModel(Chonburi1, Chonburi),
        _CountryDensityModel(Chainat1, Chainat),
        _CountryDensityModel(Chaiyaphum1, Chaiyaphum),
        _CountryDensityModel(Chumphon1, Chumphon),
        _CountryDensityModel(ChiangRai1, ChiangRai),
        _CountryDensityModel(ChiangMai1, ChiangMai),
        _CountryDensityModel(Trang1, Trang),
        _CountryDensityModel(Trat1, Trat),
        _CountryDensityModel(Tak1, Tak),
        _CountryDensityModel(NakhonNayok1, NakhonNayok),
        _CountryDensityModel(NakhonPathom1, NakhonPathom),
        _CountryDensityModel(NakhonPhanom1, NakhonPhanom),
        _CountryDensityModel(NakhonRatchasima1, NakhonRatchasima),
        _CountryDensityModel(NakhonSiThammarat1, NakhonSiThammarat),
        _CountryDensityModel(NakhonSawan1, NakhonSawan),
        _CountryDensityModel(Nonthaburi1, Nonthaburi),
        _CountryDensityModel(Narathiwat1, Narathiwat),
        _CountryDensityModel(Nan1, Nan),
        _CountryDensityModel(BuengKan1, BuengKan),
        _CountryDensityModel(Buriram1, Buriram),
        _CountryDensityModel(PathumThani1, PathumThani),
        _CountryDensityModel(PrachuapKhiriKhan1, PrachuapKhiriKhan),
        _CountryDensityModel(Prachinburi1, Prachinburi),
        _CountryDensityModel(Pattani1, Pattani),
        _CountryDensityModel(PhraNakhonSiAyutthaya1, PhraNakhonSiAyutthaya),
        _CountryDensityModel(Phayao1, Phayao),
        _CountryDensityModel(PhangNga1, PhangNga),
        _CountryDensityModel(Phatthalung1, Phatthalung),
        _CountryDensityModel(Phichit1, Phichit),
        _CountryDensityModel(Phitsanulok1, Phitsanulok),
        _CountryDensityModel(Phetchaburi1, Phetchaburi),
        _CountryDensityModel(Phetchabun1, Phetchabun),
        _CountryDensityModel(Phrae1, Phrae),
        _CountryDensityModel(Phuket1, Phuket),
        _CountryDensityModel(MahaSarakham1, MahaSarakham),
        _CountryDensityModel(Mukdahan1, Mukdahan),
        _CountryDensityModel(MaeHongSon1, MaeHongSon),
        _CountryDensityModel(Yasothon1, Yasothon),
        _CountryDensityModel(Yala1, Yala),
        _CountryDensityModel(RoiEt1, RoiEt),
        _CountryDensityModel(Ranong1, Ranong),
        _CountryDensityModel(Rayong1, Rayong),
        _CountryDensityModel(Ratchaburi1, Ratchaburi),
        _CountryDensityModel(Lopburi1, Lopburi),
        _CountryDensityModel(Lampang1, Lampang),
        _CountryDensityModel(Lamphun1, Lamphun),
        _CountryDensityModel(Loei1, Loei),
        _CountryDensityModel(Sisaket1, Sisaket),
        _CountryDensityModel(SakonNakhon1, SakonNakhon),
        _CountryDensityModel(Songkhla1, Songkhla),
        _CountryDensityModel(Satun1, Satun),
        _CountryDensityModel(SamutPrakan1, SamutPrakan),
        _CountryDensityModel(SamutSongkhram1, SamutSongkhram),
        _CountryDensityModel(SamutSakhon1, SamutSakhon),
        _CountryDensityModel(SaKaeo1, SaKaeo),
        _CountryDensityModel(Saraburi1, Saraburi),
        _CountryDensityModel(SingBuri1, SingBuri),
        _CountryDensityModel(Sukhothai1, Sukhothai),
        _CountryDensityModel(SuphanBuri1, SuphanBuri),
        _CountryDensityModel(SuratThani1, SuratThani),
        _CountryDensityModel(Surin1, Surin),
        _CountryDensityModel(NongKhai1, NongKhai),
        _CountryDensityModel(NongBuaLamphu1, NongBuaLamphu),
        _CountryDensityModel(AngThong1, AngThong),
        _CountryDensityModel(AmnatCharoen1, AmnatCharoen),
        _CountryDensityModel(UdonThani1, UdonThani),
        _CountryDensityModel(Uttaradit1, Uttaradit),
        _CountryDensityModel(UthaiThani1, UthaiThani),
        _CountryDensityModel(UbonRatchathani1, UbonRatchathani),
      ];
      _mapShapeSource = MapShapeSource.asset(
        'assets/world_map.json',
        shapeDataField: 'name',
        dataCount: _worldPopulationDensityDetails.length,
        primaryValueMapper: (int index) =>
            _worldPopulationDensityDetails[index].countryName,
        shapeColorValueMapper: (int index) =>
            _worldPopulationDensityDetails[index].doc,
        shapeColorMappers: const [
          MapColorMapper(
              from: 0,
              to: 1,
              color: Color.fromARGB(255, 223, 222, 222),
              text: '{0},{1}'),
          MapColorMapper(
              from: 1,
              to: 20,
              color: Color.fromRGBO(223, 169, 254, 1),
              text: '20 ต้น '),
          MapColorMapper(
              from: 20,
              to: 40,
              color: Color.fromRGBO(190, 78, 253, 1),
              text: '40 ต้น'),
          MapColorMapper(
              from: 40,
              to: 60,
              color: Color.fromRGBO(167, 17, 252, 1),
              text: '60 ต้น'),
          MapColorMapper(
              from: 60,
              to: 80,
              color: Color.fromRGBO(152, 3, 236, 1),
              text: '80 ต้น '),
          MapColorMapper(
              from: 80,
              to: 1000,
              color: Color.fromRGBO(113, 2, 176, 1),
              text: '> 100'),
        ],
      );
      setState(() {
        dd = true;
        print("hhhhhhhhh");
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return (dd == false)
        ? const CircularProgressIndicator()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 30),
                child: Text(
                  'พื้นที่การเกิดโรคข้าวโพด (ต้น)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 960,
                  height: 960,
                  child: SfMaps(
                    layers: [
                      MapShapeLayer(
                        source: _mapShapeSource,
                        strokeColor: const Color.fromARGB(77, 100, 99, 99),
                        legend: const MapLegend.bar(MapElement.shape,
                            position: MapLegendPosition.bottom,
                            segmentSize: Size(60.0, 9.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}

class _CountryDensityModel {
  _CountryDensityModel(this.countryName, this.doc);

  final String countryName;
  final double doc;
}







// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:web/widgets/constant.dart';

// class Showemap extends StatefulWidget {
//   const Showemap({Key? key}) : super(key: key);

//   @override
//   State<Showemap> createState() => _ShowemapState();
// }

// class _ShowemapState extends State<Showemap> {
//   late GoogleMapController myController;
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

//   void initMarker(specify, specifyID) async {
//     var markerIdVal = specifyID;
//     final MarkerId markerId = MarkerId(markerIdVal);
//     final Marker marker = Marker(
//       markerId: markerId,
//       position:
//           LatLng(specify['location'].latitude, specify['location'].longitude),
//       infoWindow: InfoWindow(
//           title: specify['drop'],
//           // ignore: prefer_interpolation_to_compose_strings
//           snippet: 'พื้นที่ความเสียหาย : ' +
//               specify['area'] +
//               '  ' +
//               'วันที่เกิดโรค : ' +
//               specify['day'] +
//               specify['mont'] +
//               specify['year']),
//     );
//     setState(() {
//       markers[markerId] = marker;
//     });
//   }

//   getMarkerData() async {
//     FirebaseFirestore.instance.collection('dataarea').get().then((myMockData) {
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

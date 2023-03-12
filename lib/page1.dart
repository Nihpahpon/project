import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/disease.dart';
import 'package:web/home.dart';
import 'package:web/widgets/constant.dart';
import 'package:web/widgets/dialog.dart';
import 'package:web/widgets/imagge.dart';
import 'package:web/widgets/title.dart';

class ShoweFarmer extends StatefulWidget {
  const ShoweFarmer({Key? key}) : super(key: key);

  @override
  State<ShoweFarmer> createState() => _ShoweFarmerState();
}

class _ShoweFarmerState extends State<ShoweFarmer> {
  final formKey = GlobalKey<FormState>();
  String? name, data, urlpictuer;
  File? _pickerImage;
  Uint8List webImage = Uint8List(8);

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: size * 0.8,
          child: TextFormField(
            onChanged: (value) => name = value.trim(),
            decoration: InputDecoration(
              labelStyle: MyConstant().h3Style(),
              labelText: 'ชื่อโรค: ',
              prefixIcon: Icon(
                Icons.people,
                color: MyConstant.dart,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dart),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildData(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          width: size * 0.8,
          child: TextFormField(
            onChanged: (value) => data = value.trim(),
            maxLines: 10,
            decoration: InputDecoration(
              hintText: 'ลักษณะอาการ  การป้องกัน :',
              hintStyle: MyConstant().h3Style(),
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 190),
                child: Icon(
                  Icons.assignment_rounded,
                  color: MyConstant.dart,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.dart),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyConstant.light),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Datadisease(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 132, 106),
        title: Text(
          'เพิ่มข้อมูลโรคข้าวโพด  ',
          style: GoogleFonts.mali(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTitle('รูปภาพโรคข้าวโพด '),
                buildAvatar(size),
                buildTitle('ชื่อของโรคข้าวโพด '),
                buildName(size),
                buildTitle('รายละเอียดของโรคข้าวโพด '),
                buildData(size),
                const SizedBox(
                  height: 25,
                ),
                buildcreate(size),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildcreate(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: size * 0.8,
          height: 50,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: MyConstant.dart,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              if ((name?.isEmpty ?? true) || (data?.isEmpty ?? true)) {
                Mydialog().normalDialog(context, 'กรุณากรอกข้อมูลให้ครบ',
                    'Please complete the information.');
              } else {
                creaAndInsertdata();
                //uploadPictureToStorage();
              }
            },
            icon: const Icon(Icons.check),
            label: const Text(
              'เพิ่มข้อมูล',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> showAlert(String title, String message) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        });
  }

  Future<void> uploadPictureToStorage() async {
    Random random = Random();
    int i = random.nextInt(1000000);

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference ref = firebaseStorage.ref().child("disease/user$i.jpg");
    UploadTask uploadTask = ref.putFile(_pickerImage!);
    var imageUrl = await (await uploadTask).ref.getDownloadURL();
    urlpictuer = imageUrl.toString();
    creaAndInsertdata();
  }

  Future<void> creaAndInsertdata() async {
    await FirebaseFirestore.instance.collection('datadisease').doc().set({
      //'urlpictuer': (urlpictuer!),
      'name': (name!),
      'data': (data!)
    }).then((value) {
      print('okkkk');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const MyHome();
        }),
      );
    });
  }

  Future<void> chooseImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickerImage = selected;
        });
      } else {
        print('web');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickerImage = File('a');
        });
      } else {
        print('web');
      }
    } else {
      print('aommmmm');
    }
  }

  Row buildAvatar(double size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          width: 400,
          child: _pickerImage == null
              ? ShowImage(path: MyConstant.avatar3)
              : kIsWeb
                  ? Image.memory(webImage)
                  : Image.file(_pickerImage!),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 30, 20),
          child: IconButton(
            onPressed: () {
              chooseImage();
            },
            icon: const Icon(
              Icons.add_photo_alternate,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }

  Container buildTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ShowTitle(
        title: title,
        textStyle: GoogleFonts.mali(
            color: MyConstant.dart, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginapp/states/farmer.dart';

class Signout extends StatelessWidget {
  const Signout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            await Firebase.initializeApp().then((value) async {
              await FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Farmer()),
                      ModalRoute.withName('/Farmer'),
                    ),
                  );
            });
          },
          leading: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 36,
          ),
          title: Text(
            'ออกจากระบบ',
            style: GoogleFonts.mali(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          tileColor: const Color.fromARGB(255, 232, 14, 14),
        ),
      ],
    );
  }
}

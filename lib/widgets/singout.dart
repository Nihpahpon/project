import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/main.dart';

class Signout extends StatelessWidget {
  const Signout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: const Color.fromARGB(255, 216, 175, 175),
          child: ListTile(
            onTap: () async {
              await Firebase.initializeApp().then((value) async {
                await FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => const MyApp()),
                        ModalRoute.withName('/Farmer'),
                      ),
                    );
              });
            },
            leading: const Icon(
              Icons.exit_to_app,
              color: Color.fromARGB(255, 215, 8, 8),
              size: 36,
            ),
            title: Text(
              'ออกจากระบบ',
              style: GoogleFonts.mali(
                  color: const Color.fromARGB(255, 215, 8, 8),
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            tileColor: const Color.fromARGB(255, 205, 218, 218),
          ),
        ),
      ],
    );
  }
}

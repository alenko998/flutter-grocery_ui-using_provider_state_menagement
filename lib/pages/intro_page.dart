// ignore_for_file: implementation_imports, unused_import, unnecessary_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // logo
        Padding(
          padding: const EdgeInsets.only(
            left: 80.0,
            right: 80.0,
            top: 160.0,
            bottom: 40.0,
          ),
          child: Image.asset('lib/images/avocado.png'),
        ),
        // text
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text("We deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                  fontSize: 36, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 24,
        ),
        // text
        Text(
          "Fresh items everyday!",
          style: TextStyle(color: Colors.grey[600]),
        ),
        Spacer(),
        // get started button
        GestureDetector(
          onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          )),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Get started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Spacer()
      ]),
    );
  }
}

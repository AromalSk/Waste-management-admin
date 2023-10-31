import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/presentation/screen/authenticationadmin/login_signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    log("1");

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginSignup()),
      );
    });

    checkPhoneNumberField();
  }

  Future<void> checkPhoneNumberField() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      if (data["phonenumber"] == null) {
        print("3");
        await FirebaseAuth.instance.currentUser!.delete();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Future<bool> details = FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .get()
    //     .then((value) => value.data()!.containsKey("phonenumber"));
    // if (details == false) {
    //   print("3");
    //   FirebaseAuth.instance.currentUser!.delete();
    // }

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff44ADA8), Color(0xffC3EFB7)],
                stops: [0.1, 0.9],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset('asset/images/waste_logo_preview.png')),
              Text(
                "Waste Management",
                style: GoogleFonts.codystar(
                    fontSize: 40, color: white, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Text(
                "Admin",
                style: primaryfont(fontSize: 24, color: white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

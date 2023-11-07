import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waste_management_admin/presentation/screen/authentication/login_signup_screen.dart';
import 'package:waste_management_admin/presentation/screen/authentication/splash_screen.dart';

part 'splashscreen_event.dart';
part 'splashscreen_state.dart';
part 'splashscreen_bloc.freezed.dart';

class SplashscreenBloc extends Bloc<SplashscreenEvent, SplashscreenState> {
  SplashscreenBloc() : super(_Initial()) {
    on<SplashscreenEvent>((event, emit) async {
      
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          event.context,
          MaterialPageRoute(builder: (context) => const LoginSignup()),
        );
      });
      
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
    });
  }
}

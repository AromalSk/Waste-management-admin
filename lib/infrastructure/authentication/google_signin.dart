import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waste_management_admin/domain/entities/user.dart';

final googleSignIn = GoogleSignIn();

GoogleSignInAccount? _user;

GoogleSignInAccount get user => _user!;

Future googleLogin() async {
  log("login 1");
  final googleUser = await googleSignIn.signIn();
  if (googleUser == null) return;
  _user = googleUser;

  final googleAuth = await googleUser.authentication;
  log("login 2");
  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  log("login 3");
  try {
    await FirebaseAuth.instance.signInWithCredential(credential);
    final details = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    final user =
        UserDetails(email: FirebaseAuth.instance.currentUser!.email.toString());
    await details.set(user.toMap());

    log("Authentication successful");
  } catch (e) {
    log("Authentication error: $e");
  }
  log("login 4");
}

Future logout() async {
  try {
    FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
  } catch (e) {
    log(e.toString());
  }
}

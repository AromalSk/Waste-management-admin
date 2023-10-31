import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/infrastructure/authentication/google_signin.dart';
import 'package:waste_management_admin/presentation/screen/authenticationadmin/login_screen.dart';
import 'package:waste_management_admin/presentation/screen/authenticationadmin/signup_screen.dart';
import 'package:waste_management_admin/presentation/screen/home/homepage.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something Went Wrong"),
            );
          }
          return Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/images/login-signin.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width * .6,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ));
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(primaryColor)),
                        child: Text(
                          "Login",
                          style:
                              GoogleFonts.poppins(color: white, fontSize: 24),
                        ),
                      )),
                  sizedBox10,
                  SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width * .6,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return DummySignup();
                            },
                          ));
                        },
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(white)),
                        child: Text(
                          "Sign Up",
                          style: primaryfont(color: primaryColor, fontSize: 24),
                        ),
                      )),
                  sizedBox10,
                  SizedBox(
                      height: size.height * .06,
                      width: size.width * .6,
                      child: ElevatedButton(
                        onPressed: () {
                          // AuthService().signInWithGoogle();
                          googleLogin();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const LoginSignup();
                            },
                          ));
                        },
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(white)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign in with",
                              style: primaryfont(
                                  color: primaryColor, fontSize: 22),
                            ),
                            sizedBoxW10,
                            SizedBox(
                                height: size.height * 0.035,
                                child:
                                    Image.asset('asset/images/google logo.png'))
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

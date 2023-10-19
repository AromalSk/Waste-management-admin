import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/infrastructure/authentication/login.dart';
import 'package:waste_management_admin/presentation/authentication/widgets/textformfield.dart';
import 'package:waste_management_admin/presentation/home/homepage.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/images/login-signin.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(thirdColor)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: grey,
                  ),
                ),
                sizedBox10,
                Text(
                  "Welcome \nBack !",
                  style: primaryfont(color: thirdColor, fontSize: 20),
                ),
                SizedBox(
                  height: size.height * 0.2,
                ),
                Column(
                  children: [
                    TextFormFieldCustomMade(
                      password: false,
                      controller: emailController,
                      hintText: "Email",
                      prefixIcon: Icons.email,
                      customValidator: validateEmail,
                    ),
                    sizedBox10,
                    TextFormFieldCustomMade(
                      password: true,
                      controller: passwordController,
                      prefixIcon: Icons.password_rounded,
                      hintText: "Password",
                      customValidator: validatePassword,
                    ),
                    sizedBox10,
                    SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                        width: MediaQuery.of(context).size.width * .6,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Validation passed, proceed with signing in
                              signIn(emailController.text.trim(),
                                  passwordController.text.trim());
                            }
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return Dummy();
                              },
                            ));
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(primaryColor)),
                          child: Text(
                            "Login",
                            style: primaryfont(color: white, fontSize: 24),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}

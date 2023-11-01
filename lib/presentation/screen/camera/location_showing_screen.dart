import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/presentation/widget/backbutton.dart';

// ignore: must_be_immutable
class LocationShowingScreen extends StatefulWidget {
  LocationShowingScreen(
      {super.key,
      required this.address,
      required this.gender,
      required this.image,
      required this.status,
      required this.id,
      required this.userId});
  String address;
  String image;
  String gender;
  bool status;
  String userId;
  String id;

  @override
  State<LocationShowingScreen> createState() => _LocationShowingScreenState();
}

class _LocationShowingScreenState extends State<LocationShowingScreen> {
  // bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff44ADA8), Color(0xffC3EFB7)],
                stops: [0.1, 0.9],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackButtonCustomMade(),
                    ],
                  ),
                ),
                sizedBox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xffFFFFFF),
                      radius: 30,
                      child: widget.gender == "Female"
                          ? Image.asset(
                              width: 70,
                              'asset/images/women.png',
                              fit: BoxFit.contain,
                            )
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Image.asset(
                                width: 100,
                                'asset/images/man-main.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                    ),
                    Text(
                      widget.address,
                      style: primaryfont(color: white),
                    )
                  ],
                ),
                sizedBox30,
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: size.height * 0.35,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40)),
                    child: Image.network(widget.image, fit: BoxFit.cover),
                  ),
                ),
                sizedBox30,
                Text(
                  "If the problem is resolved\nplease change the status\nto successful.",
                  textAlign: TextAlign.center,
                  style: primaryfont(color: white),
                ),
                Switch(
                  trackOutlineColor: widget.status
                      ? const MaterialStatePropertyAll(
                          Color.fromARGB(255, 121, 192, 123))
                      : const MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 152, 145)),
                  inactiveTrackColor: const Color.fromARGB(255, 255, 152, 145),
                  inactiveThumbColor: Colors.red,
                  activeColor: Colors.green,
                  value: widget.status,
                  onChanged: (value) {
                    setState(() {
                      widget.status = value;

                      // print(widget.status);
                    });
                    FirebaseFirestore.instance
                        .collection('full-bin-images')
                        .doc(widget.userId)
                        .collection('image-list')
                        .doc(widget.id)
                        .update({"status": widget.status});
                    // print("success");
                  },
                ),
                Text(
                  "Date Submitted  : 8-9-2023",
                  style: primaryfont(color: white),
                ),
                // Expanded(child: Container()),
                sizedBox30,
                Container(
                  height: size.height * .08,
                  decoration: const BoxDecoration(color: Color(0xff44ADA8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.send,
                        color: white,
                        size: 30,
                      ),
                      sizedBoxW10,
                      Text(
                        "Location in Maps",
                        style: primaryfont(color: white, fontSize: 24),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

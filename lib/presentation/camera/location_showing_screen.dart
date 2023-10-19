import 'package:flutter/material.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/presentation/home/widgets/backbutton.dart';

class ImageTakenScreen extends StatefulWidget {
  const ImageTakenScreen({super.key});

  @override
  State<ImageTakenScreen> createState() => _ImageTakenScreenState();
}

class _ImageTakenScreenState extends State<ImageTakenScreen> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff44ADA8), Color(0xffC3EFB7)],
                stops: [0.1, 0.9],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
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
                    radius: 30,
                    child: Image.asset("asset/images/women.png"),
                  ),
                  Text(
                    "789 Coconut Avenue \nKochi, Kerala \n682001",
                    style: primaryfont(color: white),
                  )
                ],
              ),
              sizedBox30,
              Container(
                height: size.height * 0.35,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(40)),
              ),
              sizedBox30,
              Text(
                "If the problem is resolved\nplease change the status\nto successful.",
                textAlign: TextAlign.center,
                style: primaryfont(color: white),
              ),
              Switch(
                trackOutlineColor: isSelected
                    ? MaterialStatePropertyAll(
                        Color.fromARGB(255, 121, 192, 123))
                    : MaterialStatePropertyAll(
                        const Color.fromARGB(255, 255, 152, 145)),
                inactiveTrackColor: const Color.fromARGB(255, 255, 152, 145),
                inactiveThumbColor: Colors.red,
                activeColor: Colors.green,
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    isSelected = value;
                  });
                },
              ),
              Text(
                "Date Submitted  : 8-9-2023",
                style: primaryfont(color: white),
              ),
              Expanded(child: Container()),
              Container(
                height: size.height * .08,
                decoration: BoxDecoration(color: Color(0xff44ADA8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
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
    );
  }
}

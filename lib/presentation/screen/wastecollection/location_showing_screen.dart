import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/presentation/widget/backbutton.dart';

class LocationShowingScreen extends StatefulWidget {
  LocationShowingScreen({super.key, required this.location});
  String location;

  @override
  State<LocationShowingScreen> createState() => _LocationShowingScreenState();
}

class _LocationShowingScreenState extends State<LocationShowingScreen> {
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
          child: ListView(
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 15, top: 10),
                    child: Row(
                      children: [BackButtonCustomMade()],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Image.asset("asset/images/women.png"),
                      ),
                      Text(
                        widget.location,
                        style: primaryfont(color: white),
                      )
                    ],
                  ),
                  sizedBox30,
                  Container(
                    height: size.height * 0.4,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GoogleMap(initialCameraPosition: _kGooglePlex)),
                  ),
                  sizedBox30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(primaryColor)),
                        child: Text(
                          "Start Direction",
                          style: primaryfont(color: white, fontSize: 24),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(primaryColor)),
                          child: const Icon(
                            Icons.share,
                            color: white,
                          )),
                    ],
                  ),
                  sizedBox10,
                  Text(
                    "If the waste is collected\nplease change the status\nto successful.",
                    textAlign: TextAlign.center,
                    style: primaryfont(color: white),
                  ),
                  sizedBox10,
                  Switch(
                    trackOutlineColor: isSelected
                        ? const MaterialStatePropertyAll(
                            Color.fromARGB(255, 103, 208, 107))
                        : const MaterialStatePropertyAll(
                            Color.fromARGB(255, 255, 152, 145)),
                    inactiveTrackColor:
                        const Color.fromARGB(255, 255, 152, 145),
                    inactiveThumbColor: Colors.red,
                    activeColor: Colors.green,
                    value: isSelected,
                    onChanged: (value) {
                      setState(() {
                        isSelected = value;
                      });
                    },
                  ),
                  sizedBox50
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.93854004152453, 76.32178450376257),
    zoom: 14.4746,
  );
}

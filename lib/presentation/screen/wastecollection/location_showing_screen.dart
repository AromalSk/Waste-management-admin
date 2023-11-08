import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/domain/entities/weekly_collection.dart';
import 'package:waste_management_admin/presentation/bloc/collection_marker/collection_marker_bloc.dart';
import 'package:waste_management_admin/presentation/widget/backbutton.dart';

class LocationShowingScreen extends StatefulWidget {
  LocationShowingScreen(
      {super.key,
      required this.location,
      required this.latitude,
      required this.longitude,
      required this.collection,
      required this.index});
  String location;
  String latitude;
  String longitude;
  WeeklyCollection collection;
  int index;

  @override
  State<LocationShowingScreen> createState() => _LocationShowingScreenState();
}

class _LocationShowingScreenState extends State<LocationShowingScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<CollectionMarkerBloc>().add(MarkerProvider(
        double.parse(widget.latitude), double.parse(widget.longitude)));
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
                        child: BlocBuilder<CollectionMarkerBloc,
                            CollectionMarkerState>(
                          builder: (context, state) {
                            return GoogleMap(
                                markers: state.marker,
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(double.parse(widget.latitude),
                                      double.parse(widget.longitude)),
                                  zoom: 14.4746,
                                ));
                          },
                        )),
                  ),
                  sizedBox30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            if (await canLaunchUrl(Uri.parse(
                                'https://www.google.com/maps/dir/?api=1&destination=${widget.latitude},${widget.longitude}'))) {
                              await launchUrl(Uri.parse(
                                  'https://www.google.com/maps/dir/?api=1&destination=${widget.latitude},${widget.longitude}'));
                            } else {
                              throw 'Could not launch';
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        },
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
                    trackOutlineColor: widget.collection.status
                        ? const MaterialStatePropertyAll(
                            Color.fromARGB(255, 103, 208, 107))
                        : const MaterialStatePropertyAll(
                            Color.fromARGB(255, 255, 152, 145)),
                    inactiveTrackColor:
                        const Color.fromARGB(255, 255, 152, 145),
                    inactiveThumbColor: Colors.red,
                    activeColor: Colors.green,
                    value: widget.collection.status,
                    onChanged: (value) async {
                      setState(() {
                        widget.collection.status = value;
                      });
                      FirebaseFirestore.instance
                          .collection('weekly-collection-schedule')
                          .doc('day${widget.index}')
                          .collection('usersList')
                          .doc(widget.collection.userId)
                          .update({"status": widget.collection.status});

                      // FirebaseFirestore.instance
                      //     .collection('completed-bin-images')
                      //     .doc(widget.collection.userId)
                      //     .update({"status": widget.collection.status});

                      // if (widget.collection.status) {
                      //   DocumentSnapshot document = await FirebaseFirestore
                      //       .instance
                      //       .collection('weekly-collection-schedule')
                      //       .doc('day${widget.index}')
                      //       .collection('usersList')
                      //       .doc(widget.collection.userId)
                      //       .get();
                      //   Map<String, dynamic> data =
                      //       document.data() as Map<String, dynamic>;

                      // Add the document to the completed collection
                      // await FirebaseFirestore.instance
                      //     .collection('completed-bin-images')
                      //     .doc(widget.collection.userId)
                      //     .set(data);

                      // FirebaseFirestore.instance
                      //     .collection('weekly-collection-schedule')
                      //     .doc('day${widget.index}')
                      //     .collection('usersList')
                      //     .doc(widget.collection.userId)
                      //     .delete();
                      // }

                      // print("success");
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

  // static CameraPosition _kGooglePlex = CameraPosition(
  //   target:
  //       LatLng(double.parse(widget.latitude), double.parse(widget.longitude)),
  //   zoom: 14.4746,
  // );
}


// addCompletedCollectionToFirebase(){
//      if (widget.collection.status) {
//                        DocumentSnapshot document = await FirebaseFirestore
//                             .instance
//                             .collection('weekly-collection-schedule')
//                             .doc('day${widget.index}')
//                             .collection('usersList')
//                             .doc(widget.collection.userId)
//                             .get();
//                         Map<String, dynamic> data =
//                             document.data() as Map<String, dynamic>;

//                         // Add the document to the completed collection
//                         await FirebaseFirestore.instance
//                             .collection('completed-bin-images')
//                             .doc(widget.collection.userId)
//                             .set(data);
//                       }

//                       }

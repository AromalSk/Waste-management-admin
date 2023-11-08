import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/domain/entities/bin_location.dart';
import 'package:waste_management_admin/presentation/screen/bin/bin_location_admin.dart';

class BinAddDelete extends StatefulWidget {
  const BinAddDelete({super.key});

  @override
  State<BinAddDelete> createState() => BinAddDeleteState();
}

class BinAddDeleteState extends State<BinAddDelete> {
  String? streetAddress = '';

  LatLng? userLocation;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final Map<String, Marker> marker = {};
  List<bool> markerVisibility = [];

  getAddress() async {
    if (userLocation != null) {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          userLocation!.latitude, userLocation!.longitude);
      setState(() {
        streetAddress =
            "${placemarks.reversed.last.name}\n${placemarks.reversed.last.thoroughfare}\n${placemarks.reversed.last.subLocality}\n${placemarks.reversed.last.locality}\n${placemarks.reversed.last.administrativeArea}\n${placemarks.reversed.last.country}\n${placemarks.reversed.last.postalCode}";
        print(streetAddress.toString() + "hoi");
      });
    } else {
      return;
    }
  }

  loadData() {
    getUserCurrentLocation().then((value) async {
      print("my current location");
      print(value.latitude.toString() + " " + value.longitude.toString());

      CameraPosition cameraPosition = CameraPosition(
        zoom: 14,
        target: LatLng(value.latitude, value.longitude),
      );

      final GoogleMapController controller = await _controller.future;

      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.93854004152453, 76.32178450376257),
    zoom: 14.4746,
  );

  Set<Marker> markers = {};

  void _onMapTapped(LatLng tappedPosition) async {
    markers.clear();
    List<Placemark> place = await placemarkFromCoordinates(
        tappedPosition.latitude, tappedPosition.longitude);
    print(place);
    streetAddress = place.reversed.last.name.toString() +
        "\n" +
        place.reversed.last.thoroughfare.toString() +
        "\n" +
        place.reversed.last.subLocality.toString() +
        "\n" +
        place.reversed.last.locality.toString() +
        "\n" +
        place.reversed.last.administrativeArea.toString() +
        "\n" +
        place.reversed.last.country.toString() +
        "\n" +
        place.reversed.last.postalCode.toString();

    setState(() {
      markers.add(Marker(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: primaryColor,
            context: context,
            builder: (context) {
              return Center(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Bin Location",
                          style: primaryfont(color: white, fontSize: 24),
                        ),
                      ),
                      Text(
                        streetAddress.toString(),
                        style: primaryfont(color: white),
                        textAlign: TextAlign.center,
                      ),
                      sizedBox30,
                      Text(
                        "Latitude and Longitude",
                        style: primaryfont(fontSize: 17, color: white),
                      ),
                      sizedBox10,
                      Text(
                        tappedPosition.latitude.toString(),
                        style: primaryfont(color: white),
                      ),
                      Text(
                        tappedPosition.longitude.toString(),
                        style: primaryfont(color: white),
                      ),
                      sizedBox30,
                      ElevatedButton(
                          onPressed: () {
                            print('hello');
                            addLatLngtoFirebase(
                                streetAddress!,
                                tappedPosition.latitude,
                                tappedPosition.longitude);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Location Added')));
                          },
                          child: const Text("Add location"))
                    ],
                  ),
                ),
              );
            },
          );
        },
        markerId: MarkerId(tappedPosition.toString()),
        position: tappedPosition,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Bin Location",
          style: primaryfont(color: primaryColor),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
              onTap: _onMapTapped,
              mapType: MapType.normal,
              markers: markers,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return BinLocationAdmin();
                      },
                    ));
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Image.asset(
                        'asset/images/bin-image-medium.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton.extended(
            backgroundColor: primaryColor,
            label: Text(
              "current location",
              style: primaryfont(color: white),
            ),
            onPressed: () async {
              loadData();
            },
          ),
        ],
      ),
    );
  }
}

void addLatLngtoFirebase(
    String streetLocation, double latitude, double longitude) async {
  final snapshot = FirebaseFirestore.instance.collection('bin-location').doc();
  snapshot.set(BinLocationModel(
          streetLocation: streetLocation,
          latitude: latitude,
          longitude: longitude)
      .toMap());
}

Future<Position> getUserCurrentLocation() async {
  await Geolocator.requestPermission()
      .then((value) {})
      .onError((error, stackTrace) {
    // print("error" + error.toString());
  });

  return await Geolocator.getCurrentPosition();
}

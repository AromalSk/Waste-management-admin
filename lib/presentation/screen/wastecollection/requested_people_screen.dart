import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/domain/entities/weekly_collection.dart';
import 'package:waste_management_admin/domain/repositories/stream_weekly.dart';
import 'package:waste_management_admin/domain/repositories/weekly_collection.dart';
import 'package:waste_management_admin/presentation/screen/wastecollection/completed_collection.dart';
import 'package:waste_management_admin/presentation/widget/backbutton.dart';
import 'package:waste_management_admin/presentation/screen/wastecollection/location_showing_screen.dart';

class RequestedPeopleScreen extends StatelessWidget {
  int index;

  RequestedPeopleScreen({super.key, required this.index});

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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<List<WeeklyCollection>>(
                  stream: streamAllCollection(index),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error Occured"),
                      );
                    } else if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BackButtonCustomMade(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStatePropertyAll(forthColor)),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return CompletedCollection(index:index);
                                      },
                                    ));
                                  },
                                  child: Text(
                                    "Completed Collections",
                                    style: primaryfont(color: white),
                                  ))
                            ],
                          ),
                          sizedBox10,
                          Expanded(
                              child: GroupedListView<WeeklyCollection,
                                      DateTime>(
                                  elements: snapshot.data!,
                                  groupBy: (element) {
                                    return DateTime(
                                        element.dateTime.year,
                                        element.dateTime.month,
                                        element.dateTime.day);
                                  },
                                  groupHeaderBuilder:
                                      (WeeklyCollection element) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        DateFormat.yMMMEd()
                                            .format(element.dateTime),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black54),
                                      ),
                                    );
                                  },
                                  itemBuilder: (context, element) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: null,
                                        width: null,
                                        decoration: BoxDecoration(
                                            color: const Color(0xffEDFBE2),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) {
                                                  return LocationShowingScreen(
                                                    index: index,
                                                    collection:
                                                        WeeklyCollection(
                                                            amount:
                                                                element.amount,
                                                            dateTime: element
                                                                .dateTime,
                                                            latitude: element
                                                                .latitude,
                                                            longitude: element
                                                                .longitude,
                                                            location: element
                                                                .location,
                                                            status:
                                                                element.status,
                                                            type: element.type,
                                                            userId:
                                                                element.userId),
                                                    latitude: element.latitude,
                                                    longitude:
                                                        element.longitude,
                                                    location: element.location,
                                                  );
                                                },
                                              ));
                                            },
                                            child: ListTile(
                                                leading: CircleAvatar(
                                                  radius: 30,
                                                  child: Image.asset(
                                                      "asset/images/women.png"),
                                                ),
                                                title: Center(
                                                    child: Text(
                                                  element.location,
                                                  style:
                                                      primaryfont(fontSize: 13),
                                                )),
                                                trailing: element.status ==
                                                        false
                                                    ? const CircleAvatar(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        child: Icon(
                                                          Icons
                                                              .highlight_remove_rounded,
                                                          color: Colors.red,
                                                          size: 30,
                                                        ),
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 10),
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          child: Icon(
                                                            Iconsax
                                                                .tick_circle5,
                                                            color: Colors.green,
                                                            size: 30,
                                                          ),
                                                        ),
                                                      ))),
                                      ),
                                    );
                                  }))
                        ],
                      );
                    } else {
                      return Center(
                        child: Text("Some Error Occured"),
                      );
                    }
                  }),
            ),
          )),
    );
  }
}

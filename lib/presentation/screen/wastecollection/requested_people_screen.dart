import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/domain/entities/weekly_collection.dart';
import 'package:waste_management_admin/domain/repositories/weekly_collection.dart';
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff44ADA8), Color(0xffC3EFB7)],
                  stops: [0.1, 0.9],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<WeeklyCollection>>(
                  future: getallCollection(index),
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
                                              style: primaryfont(fontSize: 13),
                                            )),
                                            trailing: const CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: Icon(
                                                Icons.highlight_remove_rounded,
                                                color: Colors.red,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/domain/entities/collection_schedule.dart';
import 'package:waste_management_admin/domain/entities/weekly_collection.dart';
import 'package:waste_management_admin/domain/repositories/weekly_collection.dart';
import 'package:waste_management_admin/infrastructure/waste_collection/collection_update.dart';
import 'package:waste_management_admin/presentation/bloc/collection_schedule/collection_schedule_bloc.dart';
import 'package:waste_management_admin/presentation/screen/wastecollection/amount_collected.dart';
import 'package:waste_management_admin/presentation/widget/backbutton.dart';
import 'package:waste_management_admin/presentation/screen/wastecollection/requested_people_screen.dart';
import 'package:waste_management_admin/presentation/widget/list_view.dart';

class CollectionListView extends StatelessWidget {
  CollectionListView({super.key});

  final collectionType = TextEditingController();
  final collectionDays = TextEditingController();

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
            child: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [BackButtonCustomMade()],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(forthColor)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return AmountCollected();
                            },
                          ));
                        },
                        child: Text(
                          "Total Amount collected",
                          style: primaryfont(color: white),
                        ))
                  ],
                ),
                sizedBox10,
                BlocBuilder<CollectionScheduleBloc, CollectionScheduleState>(
                  builder: (context, state) {
                    return FutureBuilder<List<CollectionSchedule>>(
                        future: state.collectionList,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (!snapshot.hasData) {
                            return Text("Empty");
                          }
                          if (snapshot.hasData) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return RequestedPeopleScreen(
                                          index: index,
                                        );
                                      },
                                    ));
                                  },
                                  child: FutureBuilder<List<WeeklyCollection>>(
                                      future: getallCollection(index),
                                      builder: (context, notification) {
                                        if (notification.hasData) {
                                          return ListViewCustomMade(
                                            heading:
                                                snapshot.data![index].days!,
                                            subtitle:
                                                snapshot.data![index].type!,
                                            circle: notification.data!.length !=
                                                    0
                                                ? CircleAvatar(
                                                    radius: 12,
                                                    backgroundColor:
                                                        const Color(0xffF26161),
                                                    child: Text(
                                                      notification.data!.length
                                                          .toString(),
                                                      style: primaryfont(
                                                          color: white,
                                                          fontSize: 12),
                                                    ),
                                                  )
                                                : CircleAvatar(
                                                    radius: 12,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                  ),
                                            onTap: () {
                                              collectionType.text =
                                                  snapshot.data![index].type!;
                                              collectionDays.text =
                                                  snapshot.data![index].days!;

                                              showModalBottomSheet(
                                                context: context,
                                                builder: (context) {
                                                  return Container(
                                                    height: size.height * .4,
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        25),
                                                                topRight: Radius
                                                                    .circular(
                                                                        25)),
                                                        color:
                                                            Color(0xffC3EFB7)),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            IconButton(
                                                              icon: Icon(
                                                                Iconsax
                                                                    .close_circle5,
                                                                color: Colors
                                                                    .red
                                                                    .shade300,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: TextFormField(
                                                            controller:
                                                                collectionDays,
                                                            decoration: InputDecoration(
                                                                filled: true,
                                                                fillColor:
                                                                    thirdColor,
                                                                hintText:
                                                                    "Colletion Day",
                                                                hintStyle:
                                                                    primaryfont(),
                                                                border: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: TextFormField(
                                                            controller:
                                                                collectionType,
                                                            decoration: InputDecoration(
                                                                filled: true,
                                                                fillColor:
                                                                    thirdColor,
                                                                hintText:
                                                                    "Collection Type",
                                                                hintStyle:
                                                                    primaryfont(),
                                                                border: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide
                                                                            .none)),
                                                          ),
                                                        ),
                                                        sizedBox10,
                                                        SizedBox(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                .06,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .6,
                                                            child:
                                                                ElevatedButton(
                                                              onPressed: () {
                                                                context
                                                                    .read<
                                                                        CollectionScheduleBloc>()
                                                                    .add(
                                                                        CollectionScheduleEvent());
                                                                collectionUpdate(
                                                                    index,
                                                                    collectionDays
                                                                        .text,
                                                                    collectionType
                                                                        .text);
                                                                collectionDays
                                                                    .clear();
                                                                collectionType
                                                                    .clear();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              style: const ButtonStyle(
                                                                  backgroundColor:
                                                                      MaterialStatePropertyAll(
                                                                          primaryColor)),
                                                              child: Text(
                                                                "Update",
                                                                style: primaryfont(
                                                                    color:
                                                                        white,
                                                                    fontSize:
                                                                        24),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        } else {
                                          return Center();
                                        }
                                      }),
                                );
                              },
                              itemCount: snapshot.data!.length,
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        });
                  },
                ),
                sizedBox10
              ],
            ),
          )),
    );
  }
}

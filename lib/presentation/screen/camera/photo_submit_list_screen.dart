import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/domain/entities/full_bin_images.dart';
import 'package:waste_management_admin/presentation/screen/camera/location_showing_screen.dart';
import 'package:waste_management_admin/presentation/widget/backbutton.dart';

class PhotoSubmittedListScreen extends StatefulWidget {
  const PhotoSubmittedListScreen({super.key});

  @override
  State<PhotoSubmittedListScreen> createState() =>
      _PhotoSubmittedListScreenState();
}

class _PhotoSubmittedListScreenState extends State<PhotoSubmittedListScreen> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButtonCustomMade(),
                  FutureBuilder<List<FullBinImages>>(
                    future: getFullbinAdmin(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: GroupedListView<FullBinImages, DateTime>(
                            elements: snapshot.data!,
                            groupBy: (element) => DateTime(
                                element.dateTime.year,
                                element.dateTime.month,
                                element.dateTime.day),
                            groupSeparatorBuilder: (DateTime date) => Center(
                              child: Text(
                                DateFormat.yMMMEd().format(date),
                                style: primaryfont(fontSize: 16, color: white),
                              ),
                            ),
                            itemBuilder: (context, element) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: null,
                                  width: null,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffEDFBE2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return LocationShowingScreen(
                                            address: element.userLocation,
                                            gender: element.gender,
                                            image: element.imagePath,
                                            status: element.status,
                                            id: element.imageListId,
                                            userId: element.userId,
                                          );
                                        },
                                      ));
                                    },
                                    child: ListTile(
                                      leading: CircleAvatar(
                                          backgroundColor: Color(0xffFFFFFF),
                                          radius: 30,
                                          child: element.gender == "Female"
                                              ? Image.asset(
                                                  width: 70,
                                                  'asset/images/women.png',
                                                  fit: BoxFit.contain,
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 4),
                                                  child: Image.asset(
                                                    width: 100,
                                                    'asset/images/man-main.png',
                                                    fit: BoxFit.contain,
                                                  ),
                                                )),
                                      title: Center(
                                          child: Text(
                                        element.userLocation,
                                        style: primaryfont(fontSize: 12),
                                      )),
                                      trailing: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: element.status == false
                                              ? const Icon(
                                                  Icons
                                                      .highlight_remove_rounded,
                                                  color: Colors.red,
                                                  size: 30,
                                                )
                                              : const Icon(
                                                  Icons.done_all_rounded,
                                                  color: Colors.green,
                                                )),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }
}

// Future<List<FullBinId>> getAllUsers() async {
//   List<FullBinId> users = [];
//   final snapshot = await FirebaseFirestore.instance
//       .collection('full-bin-images-admin')
//       .get();
//   if (snapshot.docs.isNotEmpty) {
//     users = snapshot.docs.map((data) {
//       final mapContent = data.data();
//       return FullBinId.fromMap(mapContent);
//     }).toList();
//   }

//   return users;
// }

Future<List<FullBinImages>> getFullbinAdmin() async {
  List<FullBinImages> adminImage = [];
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('full-bin-images-admin')
        .get();
    if (snapshot.docs.isNotEmpty) {
      adminImage = snapshot.docs.map((data) {
        final mapcontent = data.data();
        return FullBinImages.fromMap(mapcontent);
      }).toList();
    }
  } catch (e) {
    print('Error retrieving full-bin-images-admin collection: $e');
  }
  return adminImage;
}

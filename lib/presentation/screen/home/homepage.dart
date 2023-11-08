import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/presentation/screen/bin/bin_add_delete.dart';
import 'package:waste_management_admin/presentation/screen/camera/photo_submit_list_screen.dart';
import 'package:waste_management_admin/presentation/screen/chat/chat_list_screen.dart';
import 'package:waste_management_admin/presentation/screen/home/profile.dart';
import 'package:waste_management_admin/presentation/screen/wastecollection/collection_listview.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: thirdColor),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid)
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        var userData =
                            snapshot.data!.data() as Map<String, dynamic>;

                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const Profile()));
                          },
                          child: CircleAvatar(
                              radius: 40,
                              backgroundColor: primaryColor,
                              child: userData['gender'] == "Female"
                                  ? Image.asset(
                                      width: 70,
                                      'asset/images/women.png',
                                      fit: BoxFit.contain,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Image.asset(
                                        width: 100,
                                        'asset/images/man.png',
                                        fit: BoxFit.contain,
                                      ),
                                    )),
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(user.email.toString()),
                sizedBox10,
                Image.asset('asset/images/bin-handle-main.png'),

//----------------- Weekly-Collection ---------------------//

                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return CollectionListView();
                      },
                    ));
                  },
                  child: Container(
                    height: size.height * .15,
                    width: size.width * .9,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff44ADA8), Color(0xffB3E6B5)],
                            stops: [0.1, 0.9],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'asset/images/collection-weekly.png',
                          fit: BoxFit.cover,
                          width: 35,
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBox10,
                //----------------- Camera ---------------------//
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const PhotoSubmittedListScreen();
                            },
                          ));
                        },
                        child: Container(
                          height: size.height * .19,
                          width: size.width * .43,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff44ADA8),
                                    Color(0xffB3E6B5)
                                  ],
                                  stops: [
                                    0.1,
                                    0.9
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/images/camera-logo.png',
                                fit: BoxFit.cover,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                      sizedBoxW10,
                      //----------------- Bin ---------------------//
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return BinAddDelete();
                            },
                          ));
                        },
                        child: Container(
                          height: size.height * .19,
                          width: size.width * .43,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff44ADA8),
                                    Color(0xffB3E6B5)
                                  ],
                                  stops: [
                                    0.1,
                                    0.9
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/images/bin.png',
                                fit: BoxFit.cover,
                                width: 35,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBox10,
                //----------------- Chat ---------------------//
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const ChatListScreen();
                            },
                          ));
                        },
                        child: Container(
                          height: size.height * .15,
                          width: size.width * .89,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff44ADA8),
                                    Color(0xffB3E6B5)
                                  ],
                                  stops: [
                                    0.1,
                                    0.9
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/images/chat.png',
                                fit: BoxFit.cover,
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
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

  Future<void> takeCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  }
}

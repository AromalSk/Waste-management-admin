import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/presentation/camera/photo_submit_list_screen.dart';
import 'package:waste_management_admin/presentation/chat/chat_list_screen.dart';
import 'package:waste_management_admin/presentation/home/profile.dart';
import 'package:waste_management_admin/presentation/wastecollection/collection_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const Profile();
                          },
                        ));
                      },
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: primaryColor,
                        child: Image.asset(
                          'asset/images/men.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                sizedBox10,
                Image.asset('asset/images/bin-handle-main.png'),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const CollectionListView();
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return PhotoSubmittedListScreen();
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
                      Container(
                        height: size.height * .19,
                        width: size.width * .43,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff44ADA8), Color(0xffB3E6B5)],
                                stops: [0.1, 0.9],
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
                    ],
                  ),
                ),
                sizedBox10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ChatListScreen();
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

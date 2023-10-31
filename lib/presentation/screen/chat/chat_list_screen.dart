import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/domain/entities/get_user_id.dart';
import 'package:waste_management_admin/presentation/screen/chat/chat_support.dart';
import 'package:waste_management_admin/presentation/widget/backbutton.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

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
                  Expanded(
                    child: FutureBuilder<List<UserId>>(
                        future: getAllUsers(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemBuilder: (context, index) {
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
                                            return ChatSupport(
                                              userId:
                                                  snapshot.data![index].userId,
                                            );
                                          },
                                        ));
                                      },
                                      child: SizedBox(
                                        height: 70,
                                        child: Center(
                                          child: ListTile(
                                            leading: CircleAvatar(
                                                backgroundColor:
                                                    Color(0xffFFFFFF),
                                                radius: 30,
                                                child: snapshot.data![index]
                                                            .gender ==
                                                        "Female"
                                                    ? Image.asset(
                                                        "asset/images/women.png")
                                                    : Image.asset(
                                                        'asset/images/man-main.png',
                                                        fit: BoxFit.fill,
                                                      )),
                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(
                                                snapshot.data![index].name,
                                                // "hello",
                                                style: primaryfont(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: snapshot.data!.length,
                            );
                          } else {
                            return const Center(
                              child:
                                  CircularProgressIndicator(color: forthColor),
                            );
                          }
                        }),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

Future<List<UserId>> getAllUsers() async {
  List<UserId> users = [];
  final snapshot = await FirebaseFirestore.instance.collection('chat').get();
  if (snapshot.docs.isNotEmpty) {
    users = snapshot.docs.map((data) {
      final mapContent = data.data();
      return UserId.fromMap(mapContent);
    }).toList();
  }

  return users;
}

Future getDocId() async {
  await FirebaseFirestore.instance
      .collection('chat')
      .get()
      .then((snapshot) => snapshot.docs.forEach((element) {
            print("${element.reference}");
          }));
}

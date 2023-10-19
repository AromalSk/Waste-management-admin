import 'package:flutter/material.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/presentation/chat/chat_support.dart';
import 'package:waste_management_admin/presentation/home/widgets/backbutton.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

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
                  BackButtonCustomMade(),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: null,
                            width: null,
                            decoration: BoxDecoration(
                                color: Color(0xffEDFBE2),
                                borderRadius: BorderRadius.circular(20)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return ChatSupport();
                                  },
                                ));
                              },
                              child: SizedBox(
                                height: 70,
                                child: Center(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      child:
                                          Image.asset("asset/images/women.png"),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "User $index",
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
                      itemCount: 5,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:waste_management_admin/constants/constants.dart';

class ListViewCustomMade extends StatelessWidget {
  String heading;
  String subtitle;
  CircleAvatar? circle;
  ListViewCustomMade(
      {super.key, required this.heading, required this.subtitle,this.circle});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffE3F8D7),
        ),
        child: ListTile(
          title: Text(
            heading,
            style: primaryfont(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 16),
          ),
          trailing: circle,
          enabled: true,
          textColor: Colors.black,
        ),
      ),
    );
  }
}

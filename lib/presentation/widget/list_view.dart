import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waste_management_admin/constants/constants.dart';

class ListViewCustomMade extends StatelessWidget {
  String heading;
  String subtitle;
  CircleAvatar? circle;
  final VoidCallback? onTap;
  ListViewCustomMade(
      {super.key,
      required this.heading,
      required this.subtitle,
      this.circle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffE3F8D7),
        ),
        child: ListTile(
          leading: circle,
          title: Text(
            heading,
            style: primaryfont(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 16),
          ),
          trailing: GestureDetector(onTap: onTap, child: Icon(Iconsax.edit)),
          enabled: true,
          textColor: Colors.black,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:waste_management_admin/constants/constants.dart';


class BackButtonCustomMade extends StatelessWidget {
  const BackButtonCustomMade({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(thirdColor)),
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back_outlined,
        color: grey,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:waste_management_admin/constants/constants.dart';
import 'package:waste_management_admin/domain/entities/weekly_collection.dart';
import 'package:waste_management_admin/domain/repositories/weekly_collection.dart';
import 'package:waste_management_admin/presentation/widget/backbutton.dart';

class AmountCollected extends StatelessWidget {
  AmountCollected({super.key});

  int calculateTotalAmount(List<int> lengths) {
    return lengths.reduce((value, element) => value + element) * 50;
  }

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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [BackButtonCustomMade()],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: size.height * 0.6,
                  child: Card(
                    color: secondaryColor,
                    elevation: 30,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return FutureBuilder<List<WeeklyCollection>>(
                            future: getallCollection(index),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListTile(
                                  leading: Text(
                                    'Amount Collected from Day $index :',
                                    style: primaryfont(fontSize: 14),
                                  ),
                                  trailing: Text(
                                      '${snapshot.data!.length.toInt() * 50}',
                                      style: primaryfont(fontSize: 14)),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            });
                      },
                      itemCount: 8,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Text(
                  "Total Amount Collected :",
                  style: primaryfont(fontSize: 18),
                ),
                trailing: FutureBuilder<List<int>>(
                  future: Future.wait(List.generate(
                      8,
                      (index) => getallCollection(index)
                          .then((value) => value.length))),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        '${calculateTotalAmount(snapshot.data!)}',
                        style: primaryfont(fontSize: 18),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

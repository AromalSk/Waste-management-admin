import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waste_management_admin/domain/entities/collection_schedule.dart';

Future<List<CollectionSchedule>> collectionWeekdays() async {
  print("hello");
  final snapshot = await FirebaseFirestore.instance
      .collection('weekly-collection-schedule')
      .get();
  List<CollectionSchedule> collection = [];

  if (snapshot.docs.isNotEmpty) {
    collection = snapshot.docs.map((e) {
      Map<String,dynamic> mapContent = e.data();
    return CollectionSchedule.fromJson(mapContent);
    }).toList();
  }
  print(collection);
  return collection;
}

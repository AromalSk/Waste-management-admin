import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waste_management_admin/domain/entities/weekly_collection.dart';

Future<List<WeeklyCollection>> getallCollection(int index) async {
  List<WeeklyCollection> weekly = [];
  final details = await FirebaseFirestore.instance
      .collection('weekly-collection-schedule')
      .doc('day$index')
      .collection('usersList')
      .where('status', isEqualTo: false)
      .get();

  if (details.docs.isNotEmpty) {
    weekly = details.docs.map((e) {
      Map<String, dynamic> mapContent = e.data();
      return WeeklyCollection.fromMap(mapContent);
    }).toList();
  }

  return weekly;
}

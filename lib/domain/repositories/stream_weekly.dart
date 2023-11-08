import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waste_management_admin/domain/entities/weekly_collection.dart';

Stream<List<WeeklyCollection>> streamAllCollection(int index) {
  return FirebaseFirestore.instance
      .collection('weekly-collection-schedule')
      .doc('day$index')
      .collection('usersList')
      .where('status', isEqualTo: false)
      .snapshots()
      .map((querySnapshot) {
    List<WeeklyCollection> weekly = [];
    querySnapshot.docs.forEach((document) {
      Map<String, dynamic> mapContent = document.data();
      weekly.add(WeeklyCollection.fromMap(mapContent));
    });
    return weekly;
  });
}

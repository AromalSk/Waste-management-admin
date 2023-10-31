import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:waste_management_admin/domain/entities/full_bin_images.dart';

Future<List<FullBinImages>> getallBin(String userId) async {
  List<FullBinImages> list = [];
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('full-bin-images')
        .doc(userId)
        .collection('image-list')
        .get();

    list = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return FullBinImages(
          imageListId: data['imageListId'],
          gender: data['gender'],
          dateTime: DateTime.now(),
          imagePath: data['imagePath'],
          userLocation: data['userLocation'],
          status: false,
          userId: data['userId']);
    }).toList();
  } catch (e) {
    print('Error: $e');
  }
  return list;
}

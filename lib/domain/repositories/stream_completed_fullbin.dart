import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:waste_management_admin/domain/entities/full_bin_images.dart';

Stream<List<FullBinImages>> streamAllCompletedFullBin() {
  return FirebaseFirestore.instance
      .collection('full-bin-images-admin').where('status',isEqualTo:true )
      .snapshots()
      .map((querySnapshots) {
    List<FullBinImages> fullbin = [];
    querySnapshots.docs.forEach((document) {
      Map<String, dynamic> mapContent = document.data();
      fullbin.add(FullBinImages.fromMap(mapContent));
    });
    return fullbin;
  });
}


  import 'package:cloud_firestore/cloud_firestore.dart';

void collectionUpdate(int index,String collectionDays,String collectionType) {
     final data =
        FirebaseFirestore
            .instance
            .collection(
                'weekly-collection-schedule')
            .doc(
                'day$index');
    data.update({
      "days": collectionDays
          ,
      "type": collectionType
          
    });
  }


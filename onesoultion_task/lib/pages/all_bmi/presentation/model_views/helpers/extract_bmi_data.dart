import 'package:cloud_firestore/cloud_firestore.dart';

List<Map<String, dynamic>> extractBmiDataList(QuerySnapshot snapshot) {
  return snapshot.docs
      .map((DocumentSnapshot doc) => {
            'docId': doc.id,
            ...doc.data() as Map<String, dynamic>,
          })
      .toList();
}

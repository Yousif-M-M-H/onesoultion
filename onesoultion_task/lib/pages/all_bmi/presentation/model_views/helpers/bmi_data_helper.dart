import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

Future<void> deleteBmiData(String docId) async {
  try {
    await FirebaseFirestore.instance.collection('bmi_data').doc(docId).delete();
  } catch (e) {
    print('Error deleting BMI data: $e');
  }
}

String formatDateTime(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  return DateFormat('dd MMMM yyyy').format(dateTime);
}

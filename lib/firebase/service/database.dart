import 'package:cloud_firestore/cloud_firestore.dart';

//firebase methods for CRUD

class DatabaseMethods {
  //for adding the data in the firestore
  Future addEmployeeDetails(
    Map<String, dynamic> employeeInfoMap,
    String id,
  ) async {
    return await FirebaseFirestore.instance
        .collection('Employees')
        .doc(id)
        .set(employeeInfoMap);
  }

  //for fetching the data from the firestore
  Stream<QuerySnapshot> getEmployeeDetails() {
    return FirebaseFirestore.instance.collection('Employees').snapshots();
  }
}
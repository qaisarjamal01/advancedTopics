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

  //for updating the data of firestore
  Future updateEmployeeDetails(
    String id,
    Map<String, dynamic> updateInfo,
  ) async {
    return await FirebaseFirestore.instance
        .collection('Employees')
        .doc(id)
        .update(updateInfo);
  }

  //for deleting the data of firestore
  Future deleteEmployeeDetails(String id) async {
    return await FirebaseFirestore.instance
        .collection('Employees')
        .doc(id)
        .delete();
  }
}
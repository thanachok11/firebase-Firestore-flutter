import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference studentsCollection =
    FirebaseFirestore.instance.collection('students');

void addStudent(String name, String studentId, String branch, String year) {
  studentsCollection.add({
    'name': name,
    'student_id': studentId,
    'branch': branch,
    'year': year,
  });
}

void updateStudent(
    String docId, String name, String studentId, String branch, String year) {
  studentsCollection.doc(docId).update({
    'name': name,
    'student_id': studentId,
    'branch': branch,
    'year': year,
  });
}

void deleteStudent(String docId) {
  studentsCollection.doc(docId).delete();
}

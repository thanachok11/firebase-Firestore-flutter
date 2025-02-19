import 'package:flutter/material.dart';

// ฟังก์ชันสำหรับดึงปีจาก student_id
String getYearFromStudentId(String studentId) {
  if (studentId.length < 2 || int.tryParse(studentId.substring(0, 2)) == null) {
    return "Unknown"; // ป้องกันข้อผิดพลาด ถ้า studentId ไม่ถูกต้อง
  }

  int yearCode = int.parse(studentId.substring(0, 2));

  // กำหนดปีตามรหัส
  switch (yearCode) {
    case 67:
      return 'Degree 1';
    case 66:
      return 'Degree 2';
    case 65:
      return 'Degree 3';
    case 64:
      return 'Degree 4';
    default:
      return (yearCode >= 68 || yearCode < 64) ? "Can't Add" : 'Unknown';
  }
}

// ฟังก์ชันตรวจสอบรูปแบบ student_id
bool validateStudentIdFormat(String studentId) {
  return RegExp(r"^6\d{8}-\d$").hasMatch(studentId);
}

// ฟังก์ชันกำหนดสีตามปี
Color getColorBasedOnYear(String year) {
  switch (year) {
    case 'Degree 1':
      return Colors.lightBlue.shade200;
    case 'Degree 2':
      return Colors.pink.shade200;
    case 'Degree 3':
      return const Color.fromARGB(255, 102, 95, 85);
    case 'Degree 4':
      return const Color.fromARGB(255, 206, 192, 73);
    case 'Degree':
      return const Color.fromARGB(255, 0, 0, 0);
    default:
      return Colors.white;
  }
}

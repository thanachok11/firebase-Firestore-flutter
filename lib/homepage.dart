import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // ✅ เพิ่มตัวแปร TextEditingController สำหรับข้อมูลใหม่
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController yearOfStudyController = TextEditingController();
  final TextEditingController majorController = TextEditingController();
  final TextEditingController studentIdController = TextEditingController();

  final CollectionReference users =
      FirebaseFirestore.instance.collection('students');

  // ฟังก์ชันเปิด Popup สำหรับเพิ่มหรือแก้ไขข้อมูล
  void _showAddOrEditStudentDialog(BuildContext context,
      [DocumentSnapshot? student]) {
    // ถ้า student != null หมายถึงกำลังแก้ไขข้อมูล
    if (student != null) {
      nameController.text = student['name'];
      lastnameController.text = student['lastname'];
      yearOfStudyController.text = student['year_of_study'];
      majorController.text = student['major'];
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(student != null ? 'Edit Student' : 'Add New Student'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                // ชื่อ (TextField)
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Enter Name',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                    filled: true,
                    fillColor: Colors.blue[50], // Light blue background
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, // Remove border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // นามสกุล (TextField)
                TextField(
                  controller: lastnameController,
                  decoration: InputDecoration(
                    labelText: 'Enter Lastname',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                    filled: true,
                    fillColor: Colors.blue[50], // Light blue background
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, // Remove border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // ชั้นปีที่ศึกษา (TextField)
                TextField(
                  controller: yearOfStudyController,
                  decoration: InputDecoration(
                    labelText: 'Enter Year of Study',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                    filled: true,
                    fillColor: Colors.blue[50], // Light blue background
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, // Remove border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: studentIdController,
                  decoration: InputDecoration(
                    labelText: 'Enter Student ID',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                    filled: true,
                    fillColor: Colors.blue[50], // Light blue background
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, // Remove border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // สาขาที่ศึกษา (TextField)
                TextField(
                  controller: majorController,
                  decoration: InputDecoration(
                    labelText: 'Enter Major',
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                    filled: true,
                    fillColor: Colors.blue[50], // Light blue background
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, // Remove border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // ระยะห่างระหว่างปุ่ม
              ],
            ),
          ),
          actions: [
            // ปุ่มยกเลิก
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),

            // ปุ่มบันทึก
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: Text(student != null ? 'Update Student' : 'Add Student'),
              onPressed: () async {
                if (nameController.text.isNotEmpty &&
                    lastnameController.text.isNotEmpty &&
                    yearOfStudyController.text.isNotEmpty &&
                    majorController.text.isNotEmpty) {
                  // ถ้าเป็นการแก้ไขข้อมูล
                  if (student != null) {
                    await users.doc(student.id).update({
                      'student_id': studentIdController.text,
                      'name': nameController.text,
                      'lastname': lastnameController.text,
                      'year_of_study': yearOfStudyController.text,
                      'major': majorController.text,
                    });
                  } else {
                    // ถ้าเป็นการเพิ่มข้อมูลใหม่
                    await users.add({
                      'student_id': studentIdController.text,
                      'name': nameController.text,
                      'lastname': lastnameController.text,
                      'year_of_study': yearOfStudyController.text,
                      'major': majorController.text,
                    });
                  }

                  // เคลียร์ข้อมูลหลังบันทึก
                  if (mounted) {
                    nameController.clear();
                    lastnameController.clear();
                    yearOfStudyController.clear();
                    majorController.clear();
                  }

                  // ปิด Popup
                  Navigator.of(context).pop();

                  // แสดงข้อความแจ้งเตือน "Update data success"
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Update Data Success'),
                      backgroundColor: Colors.green,
                    ),
                  );

                  // รีเฟรชหน้าหลักหลังจากเพิ่มหรือแก้ไขข้อมูล
                  setState(() {
                    // ทำให้ UI รีเฟรช
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  // ฟังก์ชันยืนยันการลบ
  void _showDeleteConfirmationDialog(BuildContext context, String studentId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Do you want to delete the student?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                // ลบข้อมูลนักศึกษาจาก Firestore
                await users.doc(studentId).delete();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.school, // Icon for the app (you can change it)
              color: Colors.white,
            ),
            SizedBox(width: 8), // Space between icon and title
            Text(
              'Firestore Example',
              style: TextStyle(
                fontSize: 24, // Larger font size
                fontWeight: FontWeight.bold, // Bold text
                color: Colors.white, // White text color
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blueAccent, // Change AppBar color
        elevation: 5, // Add a shadow to the AppBar
        centerTitle: true, // Center the title and icon
      ),
      body: Column(
        children: [
          // 📌 StreamBuilder ดึงข้อมูลจาก Firestore
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🏷 หัวข้อ "Students List"
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Text(
                    '📋 Students List',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),

                // 🔽 StreamBuilder แสดงรายชื่อ
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: users
                        .orderBy(
                            'year_of_study') // ใช้ orderBy เพื่อจัดเรียงตาม year_of_study
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final docs = snapshot.data!.docs;
                      return ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          final data =
                              docs[index].data() as Map<String, dynamic>;

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            child: Card(
                              elevation: 3, // เพิ่มเงา
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10), // มุมโค้ง
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.blueAccent,
                                  child: Text(
                                    data['name'][0], // ใช้อักษรตัวแรกของชื่อ
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                title: Text(
                                  '${data['name']} ${data['lastname']}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    '🎓 Student ID: ${data['student_id']} | Year: ${data['year_of_study']} | Major: ${data['major']}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        // เรียกใช้ฟังก์ชันแก้ไข
                                        _showAddOrEditStudentDialog(
                                            context, docs[index]);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red),
                                      onPressed: () =>
                                          _showDeleteConfirmationDialog(
                                              context, docs[index].id),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // 📌 ปุ่มเพิ่มข้อมูลที่ด้านล่างสุด
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // เรียกใช้ฟังก์ชันเปิด Popup เมื่อกดปุ่ม
          _showAddOrEditStudentDialog(context);
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}

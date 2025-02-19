import 'package:flutter/material.dart';
import 'student_service.dart'; // Importing the functions to add/update students
import 'utils.dart'; // Importing utility functions like validateStudentIdFormat and getYearFromStudentId

void showStudentForm(BuildContext context,
    {String? docId, Map<String, dynamic>? currentData}) {
  // Initialize controllers with existing data if provided
  TextEditingController nameController =
      TextEditingController(text: currentData?['name']);
  TextEditingController studentIdController =
      TextEditingController(text: currentData?['student_id']);
  TextEditingController branchController =
      TextEditingController(text: currentData?['branch']);

  // Form key for validation
  final formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                docId == null ? "Add Student" : "Edit Student",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 16),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // Name input field
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    // Student ID input field
                    TextFormField(
                      controller: studentIdController,
                      decoration: const InputDecoration(
                        labelText: "Student ID should have - ",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter student ID';
                        } else if (!validateStudentIdFormat(value)) {
                          return 'Invalid student ID format';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    // Branch input field
                    TextFormField(
                      controller: branchController,
                      decoration: const InputDecoration(
                        labelText: "Branch",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a branch';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Submit button
                    ElevatedButton(
                      onPressed: () {
                        String studentId = studentIdController.text;
                        String year = getYearFromStudentId(studentId);

                        // Validate the form and submit
                        if (formKey.currentState!.validate()) {
                          if (year == "Can't Add") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Cannot add this student')),
                            );
                          } else {
                            if (docId == null) {
                              // Adding a new student
                              addStudent(nameController.text, studentId,
                                  branchController.text, year);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Student added successfully!'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else {
                              // Updating an existing student
                              updateStudent(docId, nameController.text,
                                  studentId, branchController.text, year);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Student updated successfully!'),
                                  backgroundColor: Colors.blue,
                                ),
                              );
                            }
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Text(docId == null ? "Add" : "Update"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Cancel button
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

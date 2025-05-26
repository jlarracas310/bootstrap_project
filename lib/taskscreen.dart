import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent, // Top Color
          title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(labelText: 'Enter task'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final task = taskController.text.trim();
                if (task.isNotEmpty && user != null) {
                  await FirebaseFirestore.instance.collection('tasks').add({
                    'title': task,
                    'userId': user.uid,
                    'timestamp': FieldValue.serverTimestamp(),
                  });
                  Navigator.pop(context); // Return to previous screen
                }
              },
              child: Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'taskscreen.dart';
import 'tasklist.dart';
import 'profilescreen.dart';

class HomeScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent, // Top Color
        title: Text(
          "Home - ${user?.email ?? "User"}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => FirebaseAuth.instance.signOut(),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Shrinks column to fit its children
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to your To-Do app!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AddTaskScreen()),
                  );
                },
                child: Text("Add Task"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => TaskListScreen()),
                  );
                },
                child: Text("View Tasks"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProfileScreen()),
                  );
                },
                child: Text("View Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

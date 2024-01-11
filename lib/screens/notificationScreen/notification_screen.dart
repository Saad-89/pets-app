import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationScreen extends StatelessWidget {
  // Pass the current user UID to the widget

  NotificationScreen({Key? key}) : super(key: key);

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('doctorsNotifications')
            .doc(user!
                .uid) // Use .doc(currentUserUid) to get a specific document
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(); // or any loading indicator
          }

          Map<String, dynamic>? data =
              snapshot.data!.data() as Map<String, dynamic>?;

          if (data == null || data.isEmpty) {
            return Center(
              child: Text("No notifications found."),
            );
          }

          List<String> patientNames = [data['patientName'] as String];

          return ListView.builder(
            itemCount: patientNames.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: ListTile(
                  title: Text(
                    "${patientNames[index]} send you an appointment request.",
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// import 'package:doc_app/screens/bookingRequest/booking%20details.dart';
// import 'package:doc_app/utilities/topWidgetOfTheScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class BookingRequestData {
//   final String profileImageUrl;
//   final String name;
//   final String profession;
//   final String date;
//   final String time;

//   BookingRequestData({
//     required this.profileImageUrl,
//     required this.name,
//     required this.profession,
//     required this.date,
//     required this.time,
//   });
// }

// class BookingRequest extends StatefulWidget {
//   const BookingRequest({Key? key}) : super(key: key);

//   @override
//   State<BookingRequest> createState() => _BookingRequestState();
// }

// class _BookingRequestState extends State<BookingRequest> {
//   List<BookingRequestData> bookingRequests = [
//     BookingRequestData(
//       profileImageUrl: 'assets/images/homedelivery.png',
//       name: 'John Doe',
//       profession: 'Dentist',
//       date: '2022-12-01',
//       time: '10:00 AM',
//     ),
//     BookingRequestData(
//       profileImageUrl: 'assets/images/homedelivery.png',
//       name: 'Jane Smith',
//       profession: 'Pediatrician',
//       date: '2022-12-02',
//       time: '02:30 PM',
//     ),
//     BookingRequestData(
//       profileImageUrl: 'assets/images/homedelivery.png',
//       name: 'Jane Smith',
//       profession: 'Pediatrician',
//       date: '2022-12-02',
//       time: '02:30 PM',
//     ),
//     BookingRequestData(
//       profileImageUrl: 'assets/images/homedelivery.png',
//       name: 'Jane Smith',
//       profession: 'Pediatrician',
//       date: '2022-12-02',
//       time: '02:30 PM',
//     ),
//     // Add more booking request data as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 130,
//                     decoration: BoxDecoration(
//                       color: Color(0xff0C96FF),
//                     ),
//                     child: CustomPaint(
//                       painter: WavePainter(
//                         amplitude: 30.0,
//                         frequency:
//                             0.03, // Adjust for the number of crests and troughs
//                         color: Colors.blue[400]!, // Darker shade for the wave
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10.0,
//                   ),
//                   child: Text(
//                     'Booking Requests',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ],
//             ),
//             ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: bookingRequests.length,
//               itemBuilder: (context, index) {
//                 return BookingRequestCard(
//                     bookingRequestData: bookingRequests[index]);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BookingRequestCard extends StatelessWidget {
//   final BookingRequestData bookingRequestData;

//   const BookingRequestCard({Key? key, required this.bookingRequestData})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => AppointmentDetailsScreen(
//                 patientName: 'John Doe',
//                 date: '2022-12-15',
//                 time: '10:30 AM',
//                 doctorName: 'Dr. Smith',
//                 doctorLocation: 'Medical Center',
//                 appointmentType: 'Chat',
//                 amount: 50.0,
//               ),
//             ));
//       },
//       child: Card(
//         color: Color.fromARGB(255, 190, 227, 249),
//         margin: EdgeInsets.all(8.0),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Profile Avatar
//                   CircleAvatar(
//                     radius: 30.0,
//                     backgroundImage:
//                         AssetImage(bookingRequestData.profileImageUrl),
//                   ),
//                   SizedBox(width: 16.0),
//                   // Name and Profession
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           bookingRequestData.name,
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(bookingRequestData.profession),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 16.0),
//                   // Date and Time
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${bookingRequestData.date}',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text('${bookingRequestData.time}'),
//                     ],
//                   ),
//                   SizedBox(width: 6.0),
//                   // Message Icon
//                   Icon(
//                     Icons.message_rounded,
//                     color: Colors.blue,
//                     size: 40,
//                   ),
//                   SizedBox(width: 6.0),
//                   // Accept and Cancel Buttons
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll(Colors.white),
//                         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8)))),
//                     onPressed: () {
//                       // Handle accept action
//                     },
//                     child: Text(
//                       'Reject',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll(Colors.blue),
//                         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8)))),
//                     onPressed: () {
//                       // Handle cancel action
//                     },
//                     child: Text(
//                       'Accept',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:doc_app/screens/bookingRequest/booking%20details.dart';
// import 'package:doc_app/utilities/topWidgetOfTheScreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class BookingRequestData {
//   final String profileImageUrl;
//   final String name;
//   final String patientAddress;
//   final String date;
//   final String time;
//   final String id;

//   BookingRequestData({
//     required this.profileImageUrl,
//     required this.name,
//     required this.patientAddress,
//     required this.date,
//     required this.time,
//     required this.id,
//   });
// }

// class BookingRequest extends StatefulWidget {
//   const BookingRequest({Key? key}) : super(key: key);

//   @override
//   State<BookingRequest> createState() => _BookingRequestState();
// }

// class _BookingRequestState extends State<BookingRequest> {
//   List<BookingRequestData> bookingRequests = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchAppointments();
//   }

//   Future<void> fetchAppointments() async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser != null) {
//         final currentUserId = currentUser.uid;
//         final usersCollection = FirebaseFirestore.instance.collection('users');
//         final appointmentsCollection =
//             FirebaseFirestore.instance.collection('appointments');

//         final userDocIds = await getDocIds(usersCollection);

//         for (var userDocId in userDocIds) {
//           final pendingDocs = await appointmentsCollection
//               .doc(userDocId)
//               .collection('pending')
//               .where('docId', isEqualTo: currentUserId)
//               .get();

//           for (var pendingDoc in pendingDocs.docs) {
//             final bookingRequestData = BookingRequestData(
//               profileImageUrl: 'assets/images/homedelivery.png',
//               name: pendingDoc['patientName'],
//               patientAddress: pendingDoc['patientHomeAddress'],
//               date: pendingDoc['date'],
//               time: pendingDoc['time'],
//               id: pendingDoc['id'],
//             );

//             setState(() {
//               bookingRequests.add(bookingRequestData);
//             });
//           }
//         }

//         setState(() {
//           isLoading = false;
//         });
//       }
//     } catch (error) {
//       print('Error fetching appointments: $error');
//     }
//   }

//   Future<List<String>> getDocIds(CollectionReference collection) async {
//     try {
//       final snapshot = await collection.get();
//       return snapshot.docs.map((doc) => doc.id).toList();
//     } catch (error) {
//       print('Error getting document IDs: $error');
//       return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 130,
//                     decoration: BoxDecoration(
//                       color: Color(0xff0C96FF),
//                     ),
//                     child: CustomPaint(
//                       painter: WavePainter(
//                         amplitude: 30.0,
//                         frequency: 0.03,
//                         color: Colors.blue[400]!,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 10.0,
//                   ),
//                   child: Text(
//                     'Booking Requests',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ],
//             ),
//             isLoading
//                 ? CircularProgressIndicator()
//                 : ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: bookingRequests.length,
//                     itemBuilder: (context, index) {
//                       return BookingRequestCard(
//                           bookingRequestData: bookingRequests[index]);
//                     },
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BookingRequestCard extends StatelessWidget {
//   final BookingRequestData bookingRequestData;

//   const BookingRequestCard({Key? key, required this.bookingRequestData})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => AppointmentDetailsScreen(
//               patientName: 'John Doe',
//               date: '2022-12-15',
//               time: '10:30 AM',
//               doctorName: 'Dr. Smith',
//               doctorLocation: 'Medical Center',
//               appointmentType: 'Chat',
//               amount: 50.0,
//             ),
//           ),
//         );
//       },
//       child: Card(
//         color: Color.fromARGB(255, 190, 227, 249),
//         margin: EdgeInsets.all(8.0),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 30.0,
//                     backgroundImage:
//                         AssetImage(bookingRequestData.profileImageUrl),
//                   ),
//                   SizedBox(width: 16.0),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           bookingRequestData.name,
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(bookingRequestData.patientAddress),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 16.0),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${bookingRequestData.date}',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text('${bookingRequestData.time}'),
//                     ],
//                   ),
//                   SizedBox(width: 6.0),
//                   Icon(
//                     Icons.message_rounded,
//                     color: Colors.blue,
//                     size: 40,
//                   ),
//                   SizedBox(width: 6.0),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll(Colors.white),
//                         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8)))),
//                     onPressed: () {
//                       // Handle reject action
//                       print(bookingRequestData.id);
//                     },
//                     child: Text(
//                       'Reject',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll(Colors.blue),
//                         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8)))),
//                     onPressed: () {
//                       // Handle accept action
//                       print(bookingRequestData.id);
//                     },
//                     child: Text(
//                       'Accept',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_app/screens/bookingRequest/booking%20details.dart';
import 'package:doc_app/utilities/topWidgetOfTheScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookingRequestData {
  final String profileImageUrl;
  final String name;
  final String patientAddress;
  final String date;
  final String time;
  final String id;
  final String userId;
  final String docName;
  final String userDeviceToken;

  BookingRequestData({
    required this.profileImageUrl,
    required this.name,
    required this.patientAddress,
    required this.date,
    required this.time,
    required this.id,
    required this.userId,
    required this.docName,
    required this.userDeviceToken,
  });
}

class BookingRequest extends StatefulWidget {
  const BookingRequest({Key? key}) : super(key: key);

  @override
  State<BookingRequest> createState() => _BookingRequestState();
}

class _BookingRequestState extends State<BookingRequest> {
  List<BookingRequestData> bookingRequests = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final currentUserId = currentUser.uid;
        final usersCollection = FirebaseFirestore.instance.collection('users');
        final appointmentsCollection =
            FirebaseFirestore.instance.collection('appointments');

        final userDocIds = await getDocIds(usersCollection);

        for (var userDocId in userDocIds) {
          final pendingDocs = await appointmentsCollection
              .doc(userDocId)
              .collection('pending')
              .where('docId', isEqualTo: currentUserId)
              .get();

          for (var pendingDoc in pendingDocs.docs) {
            final appointmentStatus = pendingDoc['appointmentStatus'];
            if (appointmentStatus != 'Approved' &&
                appointmentStatus != 'Rejected') {
              final bookingRequestData = BookingRequestData(
                profileImageUrl: 'assets/images/homedelivery.png',
                name: pendingDoc['patientName'],
                patientAddress: pendingDoc['patientHomeAddress'],
                date: pendingDoc['date'],
                time: pendingDoc['time'],
                id: pendingDoc['id'],
                userId: pendingDoc['userId'],
                docName: pendingDoc['docName'],
                userDeviceToken: pendingDoc['deviceToken'],
              );

              setState(() {
                bookingRequests.add(bookingRequestData);
              });
            }
          }
        }

        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      print('Error fetching appointments: $error');
    }
  }

  // Future<void> fetchAppointments() async {
  //   try {
  //     final currentUser = FirebaseAuth.instance.currentUser;
  //     if (currentUser != null) {
  //       final currentUserId = currentUser.uid;
  //       final usersCollection = FirebaseFirestore.instance.collection('users');
  //       final appointmentsCollection =
  //           FirebaseFirestore.instance.collection('appointments');

  //       final userDocIds = await getDocIds(usersCollection);

  //       for (var userDocId in userDocIds) {
  //         final pendingDocs = await appointmentsCollection
  //             .doc(userDocId)
  //             .collection('pending')
  //             .where('docId', isEqualTo: currentUserId)
  //             .get();

  //         for (var pendingDoc in pendingDocs.docs) {
  //           final bookingRequestData = BookingRequestData(
  //             profileImageUrl: 'assets/images/homedelivery.png',
  //             name: pendingDoc['patientName'],
  //             patientAddress: pendingDoc['patientHomeAddress'],
  //             date: pendingDoc['date'],
  //             time: pendingDoc['time'],
  //             id: pendingDoc['id'],
  //             userId: pendingDoc['userId'],
  //           );

  //           setState(() {
  //             bookingRequests.add(bookingRequestData);
  //           });
  //         }
  //       }

  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   } catch (error) {
  //     print('Error fetching appointments: $error');
  //   }
  // }

  Future<List<String>> getDocIds(CollectionReference collection) async {
    try {
      final snapshot = await collection.get();
      return snapshot.docs.map((doc) => doc.id).toList();
    } catch (error) {
      print('Error getting document IDs: $error');
      return [];
    }
  }

  // Future<void> updateAppointmentStatus(
  //     String appointmentId, String userId, String status) async {
  //   try {
  //     final appointmentsCollection =
  //         FirebaseFirestore.instance.collection('appointments');

  //     await appointmentsCollection
  //         .doc(userId)
  //         .collection('pending')
  //         .doc(appointmentId)
  //         .update({'appointmentStatus': status});

  //     final snackBar = SnackBar(
  //       content: Text(
  //           'Appointment ${status == 'Approved' ? 'Approved' : 'Rejected'}!'),
  //       duration: Duration(seconds: 2),
  //     );

  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //   } catch (error) {
  //     print('Error updating appointment status: $error');
  //   }
  // }

  Future<void> updateAppointmentStatus(String appointmentId, String userId,
      String status, String doctorName, String deviceToken) async {
    try {
      final appointmentsCollection =
          FirebaseFirestore.instance.collection('appointments');

      // Update appointment status
      await appointmentsCollection
          .doc(userId)
          .collection('pending')
          .doc(appointmentId)
          .update({'appointmentStatus': status});

      // Save doctor's name with status in userNotification collection
      await FirebaseFirestore.instance
          .collection('usersNotification')
          .doc(userId)
          .set({
        'doctorName': doctorName,
        'status': status,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Notification data
      String notificationTitle = status == 'Approved'
          ? 'Appointment Approved'
          : 'Appointment Rejected';
      String notificationBody =
          '$doctorName has ${status.toLowerCase()} your appointment request!';

      // Send notification
      var data = {
        'to': deviceToken, // Replace with user's device token
        'notification': {
          'title': notificationTitle,
          'body': notificationBody,
        },
      };

      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              '<key=AAAAkBuS2y0:APA91bH-ioiXPSX_y-L8nRcKA0zxJsvjwV0RDH6-dk8XKePBPsI1uFPmGX08V1FVM-zuEZeUT_TIqE0a6cSoxkOIRUFjIBI8OdsId3hK5sy04ko0ZiCK3VZbHPYk5p0Kqyro5b6UQV79>', // Replace with your FCM server key
        },
      );

      // Show success snackbar
      final snackBar = SnackBar(
        content: Text('$notificationTitle!'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (error) {
      print('Error updating appointment status: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Color(0xff0C96FF),
                    ),
                    child: CustomPaint(
                      painter: WavePainter(
                        amplitude: 30.0,
                        frequency: 0.03,
                        color: Colors.blue[400]!,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Text(
                    'Booking Requests',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            isLoading
                ? CircularProgressIndicator(
                    color: Colors.blue,
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: bookingRequests.length,
                    itemBuilder: (context, index) {
                      return BookingRequestCard(
                          bookingRequestData: bookingRequests[index],
                          onAccept: () {
                            updateAppointmentStatus(
                                bookingRequests[index].id,
                                bookingRequests[index].userId,
                                'Approved',
                                bookingRequests[index].docName,
                                bookingRequests[index].userDeviceToken);
                          },
                          onReject: () {
                            updateAppointmentStatus(
                                bookingRequests[index].id,
                                bookingRequests[index].userId,
                                'Rejected',
                                bookingRequests[index].docName,
                                bookingRequests[index].userDeviceToken);
                          });
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class BookingRequestCard extends StatelessWidget {
  final BookingRequestData bookingRequestData;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  const BookingRequestCard({
    Key? key,
    required this.bookingRequestData,
    this.onAccept,
    this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AppointmentDetailsScreen(
              patientName: 'John Doe',
              date: '2022-12-15',
              time: '10:30 AM',
              doctorName: 'Dr. Smith',
              doctorLocation: 'Medical Center',
              appointmentType: 'Chat',
              amount: 50.0,
            ),
          ),
        );
      },
      child: Card(
        color: Color.fromARGB(255, 190, 227, 249),
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        AssetImage(bookingRequestData.profileImageUrl),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookingRequestData.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(bookingRequestData.patientAddress),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${bookingRequestData.date}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('${bookingRequestData.time}'),
                    ],
                  ),
                  SizedBox(width: 6.0),
                  Icon(
                    Icons.message_rounded,
                    color: Colors.blue,
                    size: 40,
                  ),
                  SizedBox(width: 6.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                    ),
                    onPressed: onReject,
                    child: Text(
                      'Reject',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                    ),
                    onPressed: onAccept,
                    child: Text(
                      'Accept',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class BookingRequestCard extends StatefulWidget {
//   final BookingRequestData bookingRequestData;
//   final VoidCallback? onAccept;
//   final VoidCallback? onReject;

//   const BookingRequestCard({
//     Key? key,
//     required this.bookingRequestData,
//     this.onAccept,
//     this.onReject,
//   }) : super(key: key);

//   @override
//   _BookingRequestCardState createState() => _BookingRequestCardState();
// }

// class _BookingRequestCardState extends State<BookingRequestCard> {
//   bool isButtonsDisabled = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => AppointmentDetailsScreen(
//               patientName: 'John Doe',
//               date: '2022-12-15',
//               time: '10:30 AM',
//               doctorName: 'Dr. Smith',
//               doctorLocation: 'Medical Center',
//               appointmentType: 'Chat',
//               amount: 50.0,
//             ),
//           ),
//         );
//       },
//       child: Card(
//         color: Color.fromARGB(255, 190, 227, 249),
//         margin: EdgeInsets.all(8.0),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 30.0,
//                     backgroundImage:
//                         AssetImage(widget.bookingRequestData.profileImageUrl),
//                   ),
//                   SizedBox(width: 16.0),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           widget.bookingRequestData.name,
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         Text(widget.bookingRequestData.patientAddress),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 16.0),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${widget.bookingRequestData.date}',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text('${widget.bookingRequestData.time}'),
//                     ],
//                   ),
//                   SizedBox(width: 6.0),
//                   Icon(
//                     Icons.message_rounded,
//                     color: Colors.blue,
//                     size: 40,
//                   ),
//                   SizedBox(width: 6.0),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStatePropertyAll(Colors.white),
//                       shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       )),
//                     ),
//                     onPressed: isButtonsDisabled
//                         ? null
//                         : () {
//                             setState(() {
//                               isButtonsDisabled = true;
//                             });
//                             if (widget.onReject != null) {
//                               widget.onReject!();
//                             }
//                           },
//                     child: Text(
//                       'Reject',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   SizedBox(width: 8.0),
//                   ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStatePropertyAll(Colors.blue),
//                       shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       )),
//                     ),
//                     onPressed: isButtonsDisabled
//                         ? null
//                         : () {
//                             setState(() {
//                               isButtonsDisabled = true;
//                             });
//                             if (widget.onAccept != null) {
//                               widget.onAccept!();
//                             }
//                           },
//                     child: Text(
//                       'Accept',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

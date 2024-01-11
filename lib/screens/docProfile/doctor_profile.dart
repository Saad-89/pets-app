// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class DoctorProfileScreen extends StatelessWidget {
//   DoctorProfileScreen({Key? key});

//   User? user = FirebaseAuth.instance.currentUser;

//   Future<Map<String, dynamic>> _fetchDoctorData() async {
//     try {
//       DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
//           .instance
//           .collection('doctors')
//           .doc(user!.uid)
//           .get();

//       if (snapshot.exists) {
//         return snapshot.data()!;
//       } else {
//         return {}; // Return an empty map if the document doesn't exist
//       }
//     } catch (e) {
//       print('Error fetching doctor data: $e');
//       return {};
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: _fetchDoctorData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             // Access data using snapshot.data
//             Map<String, dynamic> doctorData = snapshot.data ?? {};

//             return CustomScrollView(
//               slivers: [
//                 SliverAppBar(
//                   expandedHeight: 200,
//                   floating: false,
//                   pinned: true,
//                   flexibleSpace: FlexibleSpaceBar(
//                     title: Text(
//                       '${doctorData['firstName']} ${doctorData['lastName']}',
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     background: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         Image.network(
//                           doctorData['imageUrl'],
//                           fit: BoxFit.cover,
//                         ),
//                         Positioned(
//                           bottom: 0,
//                           left: 0,
//                           right: 0,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.bottomCenter,
//                                 end: Alignment.topCenter,
//                                 colors: [
//                                   Colors.black.withOpacity(0.8),
//                                   Colors.transparent,
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SliverList(
//                   delegate: SliverChildListDelegate([
//                     _buildSection('Contact Information', [
//                       _buildInfoRow('Clinic Name', doctorData['clinicName']),
//                       _buildInfoRow(
//                           'Primary Phone', doctorData['primaryPhoneNumber']),
//                       _buildInfoRow('Secondary Phone',
//                           doctorData['secondaryPhoneNumber']),
//                       _buildInfoRow('Email', doctorData['email']),
//                       _buildInfoRow('City', doctorData['city']),
//                       _buildInfoRow('Address', doctorData['address']),
//                     ]),
//                     _buildSection('Time Availability', [
//                       _buildTimeAvailability(doctorData['selectedTime']),
//                     ]),
//                     _buildSection('Specialization and Other Information', [
//                       _buildInfoRow('Category', doctorData['selectedCategory']),
//                       _buildInfoRow('Instagram', doctorData['insta']),
//                       _buildInfoRow('Facebook', doctorData['fac']),
//                       _buildInfoRow('LinkedIn', doctorData['linkedIn']),
//                     ]),
//                     _buildSection('Description', [
//                       _buildInfoRow('Description', doctorData['description']),
//                     ]),
//                   ]),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildSection(String title, List<Widget> children) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 8),
//           ...children,
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoRow(String label, String? value) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 '$label:',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(width: 8),
//               Expanded(
//                 child: Text(value ?? 'N/A'), // Display 'N/A' if value is null
//               ),
//             ],
//           ),
//         ),
//         Divider(height: 1, color: Colors.grey),
//       ],
//     );
//   }

//   Widget _buildTimeAvailability(Map<String, dynamic> selectedTime) {
//     List<Widget> timeWidgets = [];

//     selectedTime.forEach((day, time) {
//       timeWidgets.add(
//         Column(
//           children: [
//             _buildInfoRow(day, time),
//             Divider(height: 1, color: Colors.grey),
//           ],
//         ),
//       );
//     });

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: timeWidgets,
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorProfileScreen extends StatelessWidget {
  DoctorProfileScreen({Key? key});

  User? user = FirebaseAuth.instance.currentUser;

  Future<Map<String, dynamic>> _fetchDoctorData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('doctors')
          .doc(user!.uid)
          .get();

      if (snapshot.exists) {
        return snapshot.data()!;
      } else {
        return {}; // Return an empty map if the document doesn't exist
      }
    } catch (e) {
      print('Error fetching doctor data: $e');
      return {};
    }
  }

//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

//   void getDeviceToken() async {
//   String? token = await _firebaseMessaging.getToken();
//   print("Device Token: $token");
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchDoctorData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Access data using snapshot.data
            Map<String, dynamic> doctorData = snapshot.data ?? {};

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200,
                  backgroundColor: Colors.blue,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      '${doctorData['firstName']} ${doctorData['lastName']}'
                          .toUpperCase(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          doctorData['imageUrl'],
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    _buildCard('Contact Information', [
                      _buildInfoRow('Clinic Name', doctorData['clinicName']),
                      _buildInfoRow(
                          'Primary Phone', doctorData['primaryPhoneNumber']),
                      _buildInfoRow('Secondary Phone',
                          doctorData['secondaryPhoneNumber']),
                      _buildInfoRow('Email', doctorData['email']),
                      _buildInfoRow('City', doctorData['city']),
                      _buildInfoRow('Address', doctorData['address']),
                    ]),
                    _buildCard('Time Availability', [
                      _buildTimeAvailability(doctorData['selectedTime']),
                    ]),
                    _buildCard('Specialization and Other Information', [
                      _buildInfoRow('Category', doctorData['selectedCategory']),
                      _buildSocialMediaRow('Instagram', doctorData['insta']),
                      _buildSocialMediaRow('Facebook', doctorData['fac']),
                      _buildSocialMediaRow('LinkedIn', doctorData['linkedIn']),
                    ]),
                    _buildCard('Description', [
                      _buildInfoRow('', doctorData['description']),
                    ]),
                  ]),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildCard(String title, List<Widget> children) {
    return Card(
      elevation: 0,
      // color: Color.fromARGB(255, 67, 141, 191),
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(height: 0, thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value ?? 'N/A',
              style: TextStyle(fontSize: 16),
            ), // Display 'N/A' if value is null
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Open the URL on tap
                if (value != null && value.isNotEmpty) {
                  // Use your preferred method to open a URL (e.g., url_launcher package)
                  // Example using url_launcher:
                  // launch(value);
                }
              },
              child: Text(
                value ?? 'N/A',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeAvailability(Map<String, dynamic> selectedTime) {
    List<Widget> timeWidgets = [];

    selectedTime.forEach((day, time) {
      timeWidgets.add(
        _buildInfoRow(day, time),
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: timeWidgets,
    );
  }
}

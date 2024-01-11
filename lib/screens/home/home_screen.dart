// import 'package:flutter/material.dart';

// class Booking {
//   final String bookingFor;
//   final String description;
//   final String image;

//   Booking(
//       {required this.bookingFor,
//       required this.description,
//       required this.image});
// }

// class HomeScreen extends StatelessWidget {
//   final List<Booking> booking = [
//     Booking(
//         bookingFor: 'Order Medicine',
//         description: 'Get them Delivered at your doorstep At upto 10% off',
//         image: 'assets/images/homedelivery.png'),
//     Booking(
//         bookingFor: 'Book Oppointment',
//         description: 'Get you appointment booked online by using our app',
//         image: 'assets/images/homedelivery.png'),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           _TopContainer(),
//           Expanded(
//             child: GridView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//               ),
//               itemCount: 4,
//               itemBuilder: (context, index) {
//                 return _CategoryBox(
//                   index: index,
//                   color: Colors.primaries[index % Colors.primaries.length],
//                   count: (index + 1) *
//                       10, // Replace with actual count from Firestore
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           ListView.builder(
//             padding: EdgeInsets.only(top: 5, left: 10, right: 10),
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: booking.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 color: Color.fromARGB(255, 186, 237, 234),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 child: ListTile(
//                   onTap: () {
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) => DoctorsListScreen()));
//                   },
//                   title: Text(
//                     booking[index].bookingFor,
//                     style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
//                   ),
//                   subtitle: Text(
//                     booking[index].description,
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                   ),
//                   trailing: Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       image: DecorationImage(
//                           fit: BoxFit.fill,
//                           image: AssetImage(booking[index].image)),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(
//                     'Blogs',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 22,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 6),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 100,
//                           height: 120,
//                           child: Column(
//                             children: [
//                               Container(
//                                 height: 90,
//                                 width: 90,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                       color: Color(0xff0C96FF),
//                                     ),
//                                     color: Colors.amber,
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage(
//                                           'assets/images/images.jpg',
//                                         ))),
//                               ),
//                               SizedBox(
//                                 height: 4,
//                               ),
//                               Text('Ophthalmology')
//                             ],
//                           ),
//                         ),
//                         // SizedBox(
//                         //   width: 8,
//                         // ),
//                         Container(
//                           width: 100,
//                           height: 120,
//                           child: Column(
//                             children: [
//                               Container(
//                                 height: 90,
//                                 width: 90,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                       color: Color(0xff0C96FF),
//                                     ),
//                                     color: Colors.amber,
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage(
//                                           'assets/images/Ophthalmology.jpg',
//                                         ))),
//                               ),
//                               SizedBox(
//                                 height: 4,
//                               ),
//                               Text('Surgery ')
//                             ],
//                           ),
//                         ),
//                         // SizedBox(
//                         //   width: 8,
//                         // ),
//                         Container(
//                           width: 100,
//                           height: 120,
//                           child: Column(
//                             children: [
//                               Container(
//                                 height: 90,
//                                 width: 90,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                       color: Color(0xff0C96FF),
//                                     ),
//                                     color: Colors.amber,
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage(
//                                           'assets/images/images.jpg',
//                                         ))),
//                               ),
//                               SizedBox(
//                                 height: 4,
//                               ),
//                               Text('Cardiology ')
//                             ],
//                           ),
//                         ),
//                         // SizedBox(
//                         //   width: 4,
//                         // ),
//                         Container(
//                           width: 100,
//                           height: 120,
//                           child: Column(
//                             children: [
//                               Container(
//                                 height: 90,
//                                 width: 90,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(
//                                       color: Color(0xff0C96FF),
//                                     ),
//                                     color: Colors.amber,
//                                     image: DecorationImage(
//                                         fit: BoxFit.cover,
//                                         image: AssetImage(
//                                           'assets/images/Ophthalmology.jpg',
//                                         ))),
//                               ),
//                               SizedBox(
//                                 height: 4,
//                               ),
//                               Text('Neurology ')
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // SizedBox(height: 10),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Need Help?',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 17,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'In case of any issue, talk to our customer support',
//                       overflow: TextOverflow.clip,
//                       softWrap: true,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 15,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: ListTile(
//                   leading: const Icon(
//                     Icons.phone,
//                     color: Color(0xff0C96FF),
//                   ),
//                   title:
//                       const Text('Call Us Now', style: TextStyle(fontSize: 18)),
//                   trailing: IconButton(
//                       onPressed: () {
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (context) => ContactUsScreen()));
//                       },
//                       icon: const Icon(Icons.arrow_forward_ios)),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class _TopContainer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 140.0,
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(20.0),
//           bottomRight: Radius.circular(20.0),
//         ),
//       ),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: CircleAvatar(
//               backgroundColor: Colors.amber,
//               radius: 40.0,
//               child: CircleAvatar(
//                 radius: 35.0,
//                 child: Icon(Icons.person),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 30.0,
//             right: 20.0,
//             child: Icon(
//               Icons.notifications,
//               color: Colors.white,
//               size: 30.0,
//             ),
//           ),
//           Positioned(
//             top: 30.0,
//             left: 20.0,
//             child: Text(
//               'Hello Doctor',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _CategoryBox extends StatelessWidget {
//   final int index;
//   final Color color;
//   final int count;

//   _CategoryBox({
//     required this.index,
//     required this.color,
//     required this.count,
//   });

//   @override
//   Widget build(BuildContext context) {
//     IconData icon;
//     String text;

//     switch (index) {
//       case 0:
//         icon = Icons.calendar_today;
//         text = 'Appointments & Details';
//         break;
//       case 1:
//         icon = Icons.access_time;
//         text = 'Pending Appointments';
//         break;
//       case 2:
//         icon = Icons.insert_chart;
//         text = 'Monthly Invoices';
//         break;
//       case 3:
//         icon = Icons.admin_panel_settings;
//         text = 'Admin Panel';
//         break;
//       default:
//         icon = Icons.error;
//         text = 'Unknown';
//     }

//     return Container(
//       color: color,
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: Colors.white,
//             size: 40.0,
//           ),
//           SizedBox(height: 8.0),
//           Text(
//             text,
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 4.0),
//           Text(
//             'Count: $count',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:doc_app/screens/notificationScreen/notification_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../firebaseServices/notification_service.dart';

class Booking {
  final String bookingFor;
  final String description;
  final String image;

  Booking(
      {required this.bookingFor,
      required this.description,
      required this.image});
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Booking> booking = [
    Booking(
        bookingFor: 'Order Medicine',
        description: 'Get them Delivered at your doorstep At upto 10% off',
        image: 'assets/images/homedelivery.png'),
    Booking(
        bookingFor: 'Book Oppointment',
        description: 'Get you appointment booked online by using our app',
        image: 'assets/images/homedelivery.png'),
  ];

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _TopContainer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _CategoryBox(
                    index: index,
                    color: Colors.primaries[index % Colors.primaries.length],
                    count: (index + 1) *
                        10, // Replace with actual count from Firestore
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 5, left: 10, right: 10),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: booking.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Color.fromARGB(255, 186, 237, 234),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => DoctorsListScreen()));
                    },
                    title: Text(
                      booking[index].bookingFor,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      booking[index].description,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    trailing: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(booking[index].image)),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Blogs',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 120,
                            child: Column(
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xff0C96FF),
                                      ),
                                      color: Colors.amber,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'assets/images/images.jpg',
                                          ))),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('Ophthalmology')
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: 8,
                          // ),
                          Container(
                            width: 100,
                            height: 120,
                            child: Column(
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xff0C96FF),
                                      ),
                                      color: Colors.amber,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'assets/images/Ophthalmology.jpg',
                                          ))),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('Surgery ')
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: 8,
                          // ),
                          Container(
                            width: 100,
                            height: 120,
                            child: Column(
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xff0C96FF),
                                      ),
                                      color: Colors.amber,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'assets/images/images.jpg',
                                          ))),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('Cardiology ')
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: 4,
                          // ),
                          Container(
                            width: 100,
                            height: 120,
                            child: Column(
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Color(0xff0C96FF),
                                      ),
                                      color: Colors.amber,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'assets/images/Ophthalmology.jpg',
                                          ))),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text('Neurology ')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Need Help?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'In case of any issue, talk to our customer support',
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Color(0xff0C96FF),
                    ),
                    title: const Text('Call Us Now',
                        style: TextStyle(fontSize: 18)),
                    trailing: IconButton(
                        onPressed: () async {
                          var data = {
                            'to':
                                "cnuRsedmR5CCtG_cI-1SwA:APA91bFsw93Oty13_wtJJnPuA9b8cAl6aIPxTV4t6uiObeSeSQPLzAJ60SBiz8AnYTCnkKznokgStGYnLlKlZNHH2zWAzLNdJKcSHxW84_jaVt9gdX-0HZNYnqxiwqcGr9lK71AqIsjN",
                            'notification': {
                              'title': 'Notification',
                              'body': 'body of the notification',
                              "sound": "jetsons_doorbell.mp3"
                            },
                            'android': {
                              'notification': {
                                'notification_count': 23,
                              },
                            },
                            'data': {'type': 'msj', 'id': 'Asif Taj'}
                          };

                          await http.post(
                              Uri.parse('https://fcm.googleapis.com/fcm/send'),
                              body: jsonEncode(data),
                              headers: {
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                                'Authorization':
                                    'key=AAAAkBuS2y0:APA91bH-ioiXPSX_y-L8nRcKA0zxJsvjwV0RDH6-dk8XKePBPsI1uFPmGX08V1FVM-zuEZeUT_TIqE0a6cSoxkOIRUFjIBI8OdsId3hK5sy04ko0ZiCK3VZbHPYk5p0Kqyro5b6UQV79'
                              }).then((value) {
                            if (kDebugMode) {
                              print(value.body.toString());
                            }
                          }).onError((error, stackTrace) {
                            if (kDebugMode) {
                              print(error);
                            }
                          });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ContactUsScreen()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 40.0,
              child: CircleAvatar(
                radius: 35.0,
                child: Icon(Icons.person),
              ),
            ),
          ),
          Positioned(
            top: 30.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
              child: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
          Positioned(
            top: 30.0,
            left: 20.0,
            child: Text(
              'Hello Doctor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryBox extends StatelessWidget {
  final int index;
  final Color color;
  final int count;

  _CategoryBox({
    required this.index,
    required this.color,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    String text;

    switch (index) {
      case 0:
        icon = Icons.calendar_today;
        text = 'Appointments & Details';
        break;
      case 1:
        icon = Icons.access_time;
        text = 'Pending Appointments';
        break;
      case 2:
        icon = Icons.insert_chart;
        text = 'Monthly Invoices';
        break;
      case 3:
        icon = Icons.admin_panel_settings;
        text = 'Admin Panel';
        break;
      default:
        icon = Icons.error;
        text = 'Unknown';
    }

    return Container(
      color: color,
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 40.0,
          ),
          SizedBox(height: 8.0),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            'Count: $count',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

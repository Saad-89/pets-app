import 'package:doc_app/screens/bookingRequest/booking_request.dart';
import 'package:doc_app/screens/docProfile/doctor_profile.dart';
import 'package:doc_app/screens/home/home_screen.dart';
import 'package:doc_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationalBar extends StatefulWidget {
  @override
  _BottomNavigationalBarState createState() => _BottomNavigationalBarState();
}

class _BottomNavigationalBarState extends State<BottomNavigationalBar> {
  int _currentIndex = 0;

  // List of screens
  final List<Widget> _screens = [
    HomeScreen(),
    BookingRequest(),
    DoctorProfileScreen(),

    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedItemColor: const Color(0xff009BFF),
        unselectedItemColor: Colors.grey[500],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_max_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist_outlined), label: 'Requests'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.search_outlined), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded), label: 'profile'),
        ],
      ),
    );
  }
}

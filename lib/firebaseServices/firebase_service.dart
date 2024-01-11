import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<String> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.uid;
    } catch (e) {
      print('Error signing up: $e');
      return '';
    }
  }

  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user!.uid;
    } catch (e) {
      print('Error signing in: $e');
      return '';
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> storeDoctorInfo(
    String firstName,
    String lastName,
    String email,
    String clicnicName,
    String primaryPhoneNumber,
    String secondaryPhoneNumber,
    String selectedCategory,
    String description,
    String city,
    String address,
    String insta,
    String fac,
    String linkedIn,
    String imageUrl,
    String deviceTokken,
    Map<String, String> selectedTime,
  ) async {
    try {
      await _firestore.collection('doctors').doc(user!.uid).set({
        'userId': user!.uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'clinicName': clicnicName,
        'primaryPhoneNumber': primaryPhoneNumber,
        'secondaryPhoneNumber': secondaryPhoneNumber,
        'selectedCategory': selectedCategory,
        'description': description,
        'city': city,
        'address': address,
        'insta': insta,
        'fac': fac,
        'linkedIn': linkedIn,
        'imageUrl': imageUrl,
        'selectedTime': selectedTime,
        "deviceToken": deviceTokken
      });
      print('information stored successfully.');
    } catch (e) {
      print('Error storing information: $e');
    }
  }

// store pending appoinments in firestore..

  //  Future<void> storeAppointments(
  //     String docName,
  //     String date,
  //     String time,
  //     String clinicLocation,
  //     String docSpecialization,
  //     String location,
  //     String docGoogleMapLocation,
  //     String type,
  //     String amount,
  //     String docPhoneNumber,
  //     String docEmail) async {
  //   try {
  //     await _firestore.collection('pending1').doc(user!.uid).update({
  //       'userId': user!.uid,
  //       "docName": docName,
  //       'petBrand': '',
  //       'petKind': '',
  //       'patientName': '',
  //       'date': date,
  //       'time': time,
  //       'clinic': clinicLocation,
  //       'docSpecialization': docSpecialization,
  //       'patientGender': '',
  //       'doclocation': location,
  //       'docGoogleMapLocation': docGoogleMapLocation,
  //       'type': type,
  //       'amount': amount,
  //       'docPhoneNumber': docPhoneNumber,
  //       'docEmail': docEmail,
  //       'paymentStatus': 'unpaid',
  //       'canCancel': 'yes',
  //       'patientHomeAddress': '',
  //       'patientPhoneNumber': ''
  //     });
  //     print('appointment information stored successfully.');
  //   } catch (e) {
  //     print('Error storing appointment information: $e');
  //   }
  // }
  // check if current user is user.
  // Future<bool> checkUserRole(String userId) async {
  //   try {
  //     DocumentSnapshot snapshot =
  //         await _firestore.collection('users').doc(userId).get();
  //     if (snapshot.exists) {
  //       Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
  //       String role = data['role'];
  //       return (role == 'user');
  //     }
  //   } catch (e) {
  //     print('Error checking user role: $e');
  //   }
  //   return false;
  // }
}

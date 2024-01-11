import 'dart:io';
import 'package:doc_app/firebaseServices/firebase_service.dart';
import 'package:doc_app/firebaseServices/notification_service.dart';
import 'package:doc_app/utilities/bottom_navigation_bar.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactInfoScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;

  const ContactInfoScreen(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.email})
      : super(key: key);
  @override
  _ContactInfoScreenState createState() => _ContactInfoScreenState();
}

class _ContactInfoScreenState extends State<ContactInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PageController _pageController = PageController();
  int _currentPage = 0;

  // Values to store user inputs
  String _clinicName = '';
  String _primaryPhoneNumber = '';
  String _secondaryPhoneNumber = '';
  String _selectedCategory = '';
  String _description = '';
  String _city = '';
  String _address = '';
  List<String> _profileImages = [];

  String? _imageUrl;
  List<bool> _availability = List.filled(7, false);
  String _instagramLink = '';
  String _facebookLink = '';
  String _linkedinLink = '';
  Map<String, String> _selectedTimes = {};
  Map<int, String> _selectedTime = {};

  FirebaseService firebaseService = FirebaseService();
  NotificationServices notificationServices = NotificationServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Doctor Information',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildProgressBar(),
                SizedBox(height: 16.0),
                _buildPageView(),
                _buildNavigationButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: List.generate(
          5,
          (index) => Expanded(
            child: Column(
              children: [
                Container(
                  height: 1,
                  color: Colors.grey,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage >= index ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return SizedBox(
      height: 400,
      child: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _buildContactStep(),
          _buildDescriptionStep(),
          _buildAddressStep(),
          _buildProfileImagesStep(),
          _buildAvailabilityStep(),
          _buildSocialMediaStep(),
        ],
      ),
    );
  }

  Widget _buildContactStep() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step 1: General Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: _buildInputDecoration('Clinic Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Clinic name is required';
              }
              return null;
            },
            onSaved: (value) {
              _clinicName = value!;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: _buildInputDecoration('Primary Phone Number'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Primary phone number is required';
              }
              return null;
            },
            onSaved: (value) {
              _primaryPhoneNumber = value!;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: _buildInputDecoration('Secondary Phone Number'),
            onSaved: (value) {
              _secondaryPhoneNumber = value!;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: _buildInputDecoration('Category'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Category is required';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _selectedCategory = value;
              });
            },
            initialValue: _selectedCategory,
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionStep() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step 2: Doctor Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            maxLines: 4,
            decoration: _buildInputDecoration('Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Description is required';
              }
              return null;
            },
            onSaved: (value) {
              _description = value!;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAddressStep() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step 3: Address',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: _buildInputDecoration('City'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'City is required';
              }
              return null;
            },
            onSaved: (value) {
              _city = value!;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: _buildInputDecoration('Address'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Address is required';
              }
              return null;
            },
            onSaved: (value) {
              _address = value!;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProfileImagesStep() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step 4: Profile Image',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _pickedImage != null
                      ? FileImage(File(_pickedImage!.path))
                      : null,
                  child: _profileImages.isEmpty
                      ? Icon(Icons.camera_alt, size: 40, color: Colors.white)
                      : null,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          if (_profileImages.isNotEmpty)
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _profileImages
                  .map(
                    (image) => Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildAvailabilityStep() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step 5: Availability',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text('Select Availability for Each Day:'),
          SizedBox(height: 16.0),
          for (int i = 0; i < 7; i++)
            Row(
              children: [
                Checkbox(
                  value: _availability[i],
                  onChanged: (value) {
                    setState(() {
                      _availability[i] = value!;
                    });
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getDayName(i),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    if (_availability[i] && _selectedTime.containsKey(i))
                      Text(
                        _selectedTime[i]!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
                Spacer(),

                if (_availability[i])
                  ElevatedButton(
                    onPressed: () => _selectTime(i),
                    child: Text('Select Time'),
                  ),

                // if (_availability[i] && _selectedTimes.containsKey(i))
                //   Text(
                //     _selectedTimes[i]!,
                //     style: TextStyle(fontWeight: FontWeight.bold),
                //   ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaStep() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Step 6: Social Media Links',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: _buildInputDecoration('Instagram Link'),
            onSaved: (value) {
              _instagramLink = value!;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: _buildInputDecoration('Facebook Link'),
            onSaved: (value) {
              _facebookLink = value!;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: _buildInputDecoration('LinkedIn Link'),
            onSaved: (value) {
              _linkedinLink = value!;
            },
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      filled: true,
      fillColor: Colors.grey[200],
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xfff6f6f6),
                ),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)))),
            onPressed: _currentPage > 0
                ? () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                    setState(() {
                      _currentPage--;
                    });
                  }
                : null,
            child: Text(
              'Previous',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.blue,
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                if (_currentPage < 5) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  setState(() {
                    _currentPage++;
                  });
                } else {
                  // Process and save the doctor's profile
                  // Navigator.pop(context);
                  // Add your logic here

                  // print('$_clinicName');
                  // print('$_primaryPhoneNumber');
                  // print('$_secondaryPhoneNumber');
                  // print('$_selectedCategory');
                  // print('$_description');
                  // print('$_city');
                  // print('$_address');
                  // print('$_profileImages');
                  // print(_imageUrl);
                  // print('$_availability');
                  // print('$_instagramLink');
                  // print('$_facebookLink');
                  // print('$_linkedinLink');
                  // print('$_selectedTimes');

                  notificationServices.getDeviceToken().then((value) {
                    firebaseService.storeDoctorInfo(
                      widget.firstName,
                      widget.lastName,
                      widget.email,
                      _clinicName,
                      _primaryPhoneNumber,
                      _secondaryPhoneNumber,
                      _selectedCategory,
                      _description,
                      _city,
                      _address,
                      _instagramLink,
                      _facebookLink,
                      _linkedinLink,
                      _imageUrl!,
                      value.toString(),
                      _selectedTimes,
                    );
                  });

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigationalBar(),
                    ),
                    (route) => false, // Pop all existing routes
                  );
                }
              }
            },
            child: Text(
              _currentPage < 5 ? 'Next' : 'Finish',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  final ImagePicker imagePicker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);

      // Generate a unique filename
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      // Create a reference to the location you want to upload to in Firebase Storage
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child(fileName);

      // Upload the file to Firebase Storage
      await ref.putFile(file);

      // Get the download URL
      String downloadURL = await ref.getDownloadURL();

      setState(() {
        _pickedImage = pickedFile;
        _imageUrl = downloadURL;
      });

      // Print the download URL on the console
      print('Download URL: $downloadURL');
    }
  }
  // Future<void> _pickImage() async {
  //   final XFile? pickedFile =
  //       await imagePicker.pickImage(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     setState(() {
  //       _pickedImage = pickedFile;
  //     });
  //   }
  // }

  Future<void> _selectTime(int dayIndex) async {
    TimeOfDay? fromTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: 'From',
    );

    if (fromTime != null) {
      TimeOfDay? toTime = await showTimePicker(
          context: context, initialTime: TimeOfDay.now(), helpText: 'To');

      if (toTime != null) {
        // Handle the selected time range
        String formattedFromTime =
            '${_formatTimeOfDay(fromTime)} ${_getAMPM(fromTime)}';
        String formattedToTime =
            '${_formatTimeOfDay(toTime)} ${_getAMPM(toTime)}';

        setState(() {
          // Save the selected time range for the specified day
          // For now, let's print the selected day and time range
          print(
              'Selected Time for ${_getDayName(dayIndex)}: $formattedFromTime - $formattedToTime');
          // Update the selectedTimes map with the formatted time range
          _selectedTimes[_getDayName(dayIndex)] =
              '$formattedFromTime - $formattedToTime';

          _selectedTime[dayIndex] = '$formattedFromTime - $formattedToTime';
        });
      }
    }
  }

  String _formatTimeOfDay(TimeOfDay time) {
    return '${time.hourOfPeriod}:${time.minute.toString().padLeft(2, '0')}';
  }

  String _getAMPM(TimeOfDay time) {
    return time.period == DayPeriod.am ? 'AM' : 'PM';
  }

  String _getDayName(int dayIndex) {
    switch (dayIndex) {
      case 0:
        return 'Monday';
      case 1:
        return 'Tuesday';
      case 2:
        return 'Wednesday';
      case 3:
        return 'Thursday';
      case 4:
        return 'Friday';
      case 5:
        return 'Saturday';
      case 6:
        return 'Sunday';
      default:
        return '';
    }
  }
}

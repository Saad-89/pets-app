import 'package:doc_app/firebaseServices/firebase_service.dart';
import 'package:doc_app/screens/starterScreens/createDocProfile/general_information.dart';
import 'package:doc_app/screens/starterScreens/sign_in.dart';
import 'package:doc_app/utilities/topWidgetOfTheScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailNameController = TextEditingController();
  TextEditingController _passwordNameController = TextEditingController();

  bool _isLoading = false;
  bool _isSecurePassword = true;
  //  bool _isChecked = false;

  FirebaseService firebaseService = FirebaseService();

  Widget passwordToggle() {
    return IconButton(
        onPressed: () {
          setState(() {
            _isSecurePassword = !_isSecurePassword;
          });
        },
        icon: _isSecurePassword
            ? Icon(Icons.visibility)
            : Icon(Icons.visibility_off));
  }

  void registerUser(
      String firstName, String lastName, String email, String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        String userId = await firebaseService.signUpWithEmailAndPassword(
          email,
          password,
        );

        if (userId.isNotEmpty) {
          print('User signed up successfully. User ID: $userId');
          var sharedPref = await SharedPreferences.getInstance();
          sharedPref.setBool(MyAppState.KEYLOGIN, true);

          // Add user information including "teamNCondition"
          // await firebaseService.storeUserInfo(
          //     userId, firstName, lastName, email);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContactInfoScreen(
                        firstName: firstName,
                        lastName: lastName,
                        email: email,
                      )));
        } else {
          print('Failed to sign up the user.');
        }
      } catch (e) {
        print('An error occurred during sign up: $e');
        // Handle the error here, e.g., show an error dialog
      } finally {
        // const snackBar = SnackBar(
        //   content: Text('The email address is already exist!'),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         width: MediaQuery.of(context).size.width,
              //         child: SvgPicture.asset(
              //           fit: BoxFit.cover,
              //           'assets/newTopWidget.svg',
              //           width: MediaQuery.of(context).size.width,
              //           height: 130,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
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
                          frequency:
                              0.03, // Adjust for number of crests and troughs
                          color: Colors.blue[400]!, // Darker shade for wave
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // sign up fields...
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Sign Up',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: TextFieldWidget(
                            controller: _firstNameController,
                            labelText: 'First Name',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter First Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextFieldWidget(
                            controller: _lastNameController,
                            labelText: 'Last Name',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Last Name';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // TextFieldWidget(
                    //   controller: _userNameController,
                    //   labelText: 'Username',
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please Enter Username';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    TextFieldWidget(
                      controller: _emailNameController,
                      labelText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      controller: _passwordNameController,
                      labelText: 'Password',
                      obscureText: _isSecurePassword,
                      hideIcon: passwordToggle(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 55,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color(0xff0C96FF),
                                  ),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))))),
                              onPressed: () async {
                                registerUser(
                                    _firstNameController.text,
                                    _lastNameController.text,
                                    _emailNameController.text,
                                    _passwordNameController.text);
                                // if (_formKey.currentState!.validate()) {
                                //   setState(() {
                                //     _isLoading = true;
                                //   });
                                //   await Future.delayed(Duration(seconds: 2));
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               ContactInfoScreen()));
                                //   setState(() {
                                //     _isLoading = false;
                                //   });
                                // }
                              },
                              child: _isLoading == true
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'Or sign in with',
                    //       style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.w400,
                    //           color: Colors.black),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     InkWell(
                    //       child: Image(image: AssetImage('assets/google.png')),
                    //     ),
                    //     SizedBox(
                    //       width: 8,
                    //     ),
                    //     InkWell(
                    //       child:
                    //           Image(image: AssetImage('assets/facebook.png')),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => SignInScreen())));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff0C96FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final Widget? hideIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  const TextFieldWidget(
      {super.key,
      this.controller,
      this.labelText,
      this.hideIcon,
      this.obscureText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      cursorColor: Colors.black,
      style: TextStyle(
        fontSize: 18,
        decoration: TextDecoration.none,
      ),
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: hideIcon,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}

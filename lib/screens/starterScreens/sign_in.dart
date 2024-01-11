import 'package:doc_app/firebaseServices/firebase_service.dart';
import 'package:doc_app/main.dart';
import 'package:doc_app/screens/starterScreens/sign_up.dart';
import 'package:doc_app/utilities/bottom_navigation_bar.dart';
import 'package:doc_app/utilities/topWidgetOfTheScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailNameController = TextEditingController();
  TextEditingController _passwordNameController = TextEditingController();

  bool _isLoading = false;
  bool _isSecurePassword = true;
  bool isChecked = false;

  FirebaseService firebaseService = FirebaseService();

  Future<void> _handleSignIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String userId =
          await firebaseService.signInWithEmailAndPassword(email, password);
      if (userId.isNotEmpty) {
        // Check if the user is an user

        // bool isUser = await firebaseService.checkUserRole(userId);

        print('user signed in successfully. User ID: $userId');
        var sharedPref = await SharedPreferences.getInstance();
        sharedPref.setBool(MyAppState.KEYLOGIN, true);
        // await UserSession.storeUserSession(userId);
        // await SessionManager.saveUserSession(userId);
        // Proceed with user-specific actions'Navigator
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomNavigationalBar()));
        // Navigator.push(
        //     context, MaterialPageRoute(builder: ((context) => HomeScreen())));
      } else {
        print('Failed to sign in the user.');
        const snackBar = SnackBar(
          content: Text('Please enter correct email or password!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

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
              //         height: 130,
              //         decoration: BoxDecoration(
              //             color: Colors.blue,
              //             borderRadius: BorderRadius.only(
              //                 bottomLeft: Radius.circular(10),
              //                 bottomRight: Radius.circular(10))),
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

              // SvgPicture.asset(
              //   fit: BoxFit.fitWidth,
              //   'assets/newTopWidget.svg',
              //   width: MediaQuery.of(context).size.width,
              //   // height: 130,
              // ),
              SizedBox(
                height: 30,
              ),
              // sign up fields...
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Sign In',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600))
                      ],
                    ),
                    SizedBox(height: 25),
                    TextFieldWidget(
                      controller: _emailNameController,
                      labelText: 'Email',
                      validator: (text) {
                        if (text == null || text.isEmpty) {
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
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                }),
                            Text('Remember me')
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             ForgotPasswordScreen()));
                          },
                          child: Text('Forget Password?',
                              style: TextStyle(
                                color: Color(0xff0C96FF),
                              )),
                        )
                      ],
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
                                _handleSignIn(_emailNameController.text,
                                    _passwordNameController.text);
                              },
                              child: _isLoading == true
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Sign In',
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
                          "Don't have an account? ",
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
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            'SignUp',
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

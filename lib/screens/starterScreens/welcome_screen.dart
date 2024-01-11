import 'package:doc_app/screens/starterScreens/sign_in.dart';
import 'package:doc_app/screens/starterScreens/sign_up.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0C96FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Image(
                image: AssetImage(
                  'assets/images/group.png',
                ),
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
                onPressed: () async {
                  print('sign up button got pressed');
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => SignUpScreen())));
                  setState(() {
                    isLoading = false;
                  });
                },
                child: isLoading == true
                    ? CircularProgressIndicator(
                        color: Color(0xff0C96FF),
                      )
                    : Text(
                        'Sign Up',
                        style:
                            TextStyle(color: Color(0xff0C96FF), fontSize: 20),
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
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
                        color: Colors.black),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

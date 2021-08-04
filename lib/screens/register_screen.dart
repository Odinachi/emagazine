import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emagazine/custom_widgets/custom_button.dart';
import 'package:emagazine/custom_widgets/input_field.dart';
import 'package:emagazine/screens/home_screen.dart';
import 'package:emagazine/screens/login_screen.dart';
import 'package:emagazine/state_management/authnotifier.dart';
import 'package:emagazine/state_management/set_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    initializeCurrentUser(authNotifier);
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    String _emailController = '';
    String _passwordController = '';
    String _firstNameController = '';
    String _lastNameController = '';
    String _phoneNumberController = '';
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const FractionalOffset(0.0, 1.5),
              end: const FractionalOffset(0.0, 0.0),
              stops: [0.4, 1.0],
              colors: [Colors.white60, Colors.pinkAccent],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, bottom: 40),
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                CustomInputField(
                    onChangeCallback: (value) {
                      _firstNameController = value;
                    },
                    name: 'First Name'),
                SizedBox(
                  height: 20,
                ),
                CustomInputField(
                    onChangeCallback: (value) {
                      _lastNameController = value;
                    },
                    name: 'Last Name'),
                SizedBox(
                  height: 20,
                ),
                CustomInputField(
                  onChangeCallback: (value) {
                    _emailController = value;
                  },
                  name: 'Email',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInputField(
                  onChangeCallback: (value) {
                    _phoneNumberController = value;
                  },
                  name: 'Phone Number',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPassWordField(
                  onChangeCallback: (value) {
                    _passwordController = value;
                  },
                  name: 'Password',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'Register',
                  callback: () async {
                    UserCredential authResult = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController,
                            password: _passwordController)
                        .catchError((e) => print(e));
                    if (authResult != null) {
                      User? firebaseUser = authResult.user;
                      if (firebaseUser != null) {
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(firebaseUser.uid)
                            .set({
                          'phoneNumber': _phoneNumberController,
                          'firstName': _firstNameController,
                          'last_name': _lastNameController,
                          'email': _emailController,
                        });
                        await firebaseUser.reload();
                        print('sign up: $firebaseUser');
                        User? newUser = await FirebaseAuth.instance.currentUser;
                        authNotifier.setUser(newUser!);
                      }
                    }
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (_) => HomeScreen(),
                      ),
                    );
                  },
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'have an Account?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (_) => LoginScreen(),
                              ),
                            );
                          },
                        text: ' Login',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    print(value);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

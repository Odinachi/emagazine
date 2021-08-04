import 'package:emagazine/custom_widgets/custom_button.dart';
import 'package:emagazine/custom_widgets/input_field.dart';
import 'package:emagazine/screens/home_screen.dart';
import 'package:emagazine/screens/register_screen.dart';
import 'package:emagazine/state_management/authnotifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    String _emailController = '';
    String _passwordController = '';

    String? validatePassword(String value) {
      if (!(value.length > 5) && value.isNotEmpty) {
        return "Password should contain more than 5 characters";
      }
      return null;
    }

    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 178.0, bottom: 20),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                CustomInputField(
                  onChangeCallback: (value) {
                    setState(() {
                      _emailController = value;
                    });
                  },
                  name: 'Email',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPassWordField(
                  onChangeCallback: (value) {
                    setState(() {
                      _passwordController = value;
                    });
                  },
                  name: 'Password',
                  error: validatePassword(_passwordController),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  callback: () async {
                    print(_passwordController);
                    print(_emailController);

                    UserCredential authResult = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailController,
                            password: _passwordController)
                        .catchError((onError) => print(onError.code));
                    if (authResult != null) {
                      User? firebaseUser = authResult.user;
                      if (firebaseUser != null) {
                        print('logged in: $firebaseUser');
                        authNotifier.setUser(firebaseUser);
                      }
                    }

                    FocusScope.of(context).unfocus();
                    // Navigator.push(
                    //   (context),
                    //   MaterialPageRoute(
                    //     builder: (_) => HomeScreen(),
                    // ),
                    //);
                  },
                  text: 'Login',
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an Account?',
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
                                  builder: (_) => RegisterScreen(),
                                ),
                              );
                            },
                          text: ' Register',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

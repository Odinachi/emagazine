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
    bool _emailValidate = true;
    bool _passwordValidate = true;
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

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
                  control: _emailController,
                  name: 'Email',
                  error: _emailValidate ? null : 'input a valid email',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomPassWordField(
                  control: _passwordController,
                  name: 'Password',
                  error: _passwordValidate ? null : 'Input a valid password',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  callback: () async {
                    setState(() {
                      _emailController.text.isNotEmpty &&
                              _emailController.text.contains('@')
                          ? _emailValidate = true
                          : _emailValidate = false;
                      if (_emailValidate == false) {
                        _emailController.text = '';
                        FocusScope.of(context).unfocus();
                      }
                    });
                    if (_passwordValidate && _emailValidate) {
                      FocusScope.of(context).unfocus();
                      UserCredential authResult = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .catchError(
                        (onError) {
                          AlertDialog(
                            title: onError.code,
                          );
                          print(onError.code);
                        },
                      );

                      if (authResult != null) {
                        User? firebaseUser = authResult.user;
                        if (firebaseUser != null) {
                          print('logged in: $firebaseUser');
                          authNotifier.setUser(firebaseUser);
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                              builder: (_) => HomeScreen(),
                            ),
                          );
                        }
                      }
                    }

                    FocusScope.of(context).unfocus();
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

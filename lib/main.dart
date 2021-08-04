import 'package:emagazine/screens/login_screen.dart';
import 'package:emagazine/state_management/authnotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthNotifier(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        home: LoginScreen(),
      ),
    );
  }
}

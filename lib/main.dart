import 'package:emagazine/screens/detail_screen.dart';
import 'package:emagazine/screens/login_screen.dart';
import 'package:emagazine/state_management/authnotifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        debugShowCheckedModeBanner: false,
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

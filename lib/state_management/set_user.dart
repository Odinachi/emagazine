import 'package:emagazine/state_management/authnotifier.dart';
import 'package:firebase_auth/firebase_auth.dart';

initializeCurrentUser(AuthNotifier authNotifier) async {
  User? firebaseUser = await FirebaseAuth.instance.currentUser;
  if (firebaseUser != null) {
    authNotifier.setUser(firebaseUser);
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBtvVDDLEP9Ty4Hb57C_JW5-5JGxpekiKw",
            authDomain: "minitw.firebaseapp.com",
            projectId: "minitw",
            storageBucket: "minitw.appspot.com",
            messagingSenderId: "142749803545",
            appId: "1:142749803545:web:768cc5a3bce991448e7688",
            measurementId: "G-1553EKF5K4"));
  } else {
    await Firebase.initializeApp();
  }
}

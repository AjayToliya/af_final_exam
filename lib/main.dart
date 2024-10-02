import 'package:af_final_exam/view/Cart_Page.dart';
import 'package:af_final_exam/view/Home_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'view/Splash_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    initialRoute: 'splash',
    routes: {
      'splash': (context) => SplashScreen(),
      '/': (context) => HomePage(),
      'cart': (context) => CartPage(),
    },
  ));
}

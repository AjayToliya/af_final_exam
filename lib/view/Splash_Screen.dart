import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed('/');
    });

    return Scaffold(
      body: Center(child: Text('Welcome')),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Log Me In!',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Form'),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, int index){
                return LoginScreen();
              }
          ),
        ),
      ),
    );
  }

}
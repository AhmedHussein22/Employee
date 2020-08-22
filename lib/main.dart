import 'package:fire_base_1/screens/warpper.dart';
import 'package:fire_base_1/services/auth_fire.dart';
import 'package:fire_base_1/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fire_base_1/model/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Services().user,
          child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: Warpper(),
        title: "Firebase",


      ),
    );
  }
}
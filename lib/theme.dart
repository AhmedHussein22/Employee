import 'package:flutter/material.dart';

ThemeData theme =ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: true,
    color: Colors.orange,
    elevation: 5,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      )
    )

  ),
  splashColor: Color(0xFF022840),
  backgroundColor: Color(0xFF011640),
  primaryColor: Color(0xFF011640),
  
  applyElevationOverlayColor: true,



);
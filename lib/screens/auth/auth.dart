import 'package:fire_base_1/screens/auth/regester.dart';
import 'package:fire_base_1/screens/auth/signin.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool viweSignIn = false;
  void viewState()
  {
    setState(() => viweSignIn= !viweSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if (viweSignIn==true)
    {
      return SignIn(viewstate:viewState);
    }
    else
    return Regester(viewstate:viewState);
  }
}
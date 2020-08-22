import 'package:fire_base_1/model/user.dart';
import 'package:fire_base_1/screens/auth/auth.dart';
import 'package:fire_base_1/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Warpper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user != null) {
      return Home();
    } else {
      return Auth();
    }
  }
}
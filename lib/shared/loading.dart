import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        
        child: SpinKitFadingCircle(
          color: Colors.orange,
          size: 50.0,
          duration: Duration(seconds: 3),


        ),
      ),
    );
  }
}

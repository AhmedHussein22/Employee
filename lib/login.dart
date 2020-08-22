import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        appBar: AppBar(
          title:Text("welcome",
       
          ),
          primary: true,

        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              children: [
                TextField(
                  
                  decoration: InputDecoration(
                    

                    icon: Icon(Icons.mail),
                    labelText: "Mail"
                  ),
                ),
                 TextField(
                  decoration: InputDecoration(

                    icon: Icon(Icons.vpn_key),
                    labelText: "Password"
                  ),
                ),
                SizedBox(height: 20,),
                RaisedButton(onPressed: (){

                },
                color: Color(0xFF022840),
                elevation: 5,
                child: Text("LOGIN",
                style: TextStyle(
                  color: Colors.white,

                ),
                ),
                )

              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
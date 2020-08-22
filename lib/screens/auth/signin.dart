import 'package:fire_base_1/services/auth_fire.dart';
import 'package:fire_base_1/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function viewstate;
  SignIn({this.viewstate});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String error="";
  String pass="";
  String mail="";
  final _formKey = GlobalKey<FormState>();
  final Services _auth = Services();
  bool isLoasing =false;
  @override
  Widget build(BuildContext context) {
    return isLoasing ? Loading(): SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton.icon(
              onPressed: () =>widget.viewstate(),
              icon: Icon(Icons.account_circle),
              label: Text("Regester"))
        ],
        title: Text(
          "Sign in ",
        ),
        primary: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
           key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) =>
                      value.isEmpty ? "Pleas Enter Your Mail" : null,
                  onChanged: (value){
                    setState(()  => mail = value);
                  },
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.mail,
                      color: Colors.orange,
                    ),
                    labelText: "Mail"),
              ),
              TextFormField(
                validator: (value) =>
                      value.length < 6 ? "Pleas Enter Password more than 6 chart" : null,
                      onChanged: (value) {
                        setState(() => pass = value);
                      },
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,
                      color: Colors.orange,
                    ),
                    labelText: "Password"),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: ()async {
                  if (_formKey.currentState.validate()) {
                    setState(() => isLoasing =true);
                     dynamic result= await _auth.signINWithMailAndPass(mail, pass);
                     if(result == null)
                     {
                         setState((){
                         error="Pleas Enter Correct Mail";
                         isLoasing =false;
                       } );

                     }
                    }
                },
                color: Colors.orange,
                elevation: 10,
                child: Text("SIGN IN"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

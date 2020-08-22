import 'package:fire_base_1/services/auth_fire.dart';
import 'package:fire_base_1/shared/loading.dart';
import 'package:flutter/material.dart';

class Regester extends StatefulWidget {
  final Function viewstate;
  Regester({this.viewstate});
  @override
  _RegesterState createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  String error="";
  String pass="";
  String mail="";
  final _formKey = GlobalKey<FormState>();
  final Services _auth= Services();
  bool isLoasing= false;
  @override
  Widget build(BuildContext context) {
    return  isLoasing ? Loading(): SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton.icon(
                onPressed: () => widget.viewstate(),
                icon: Icon(Icons.account_circle),
                label: Text("SIGN IN"))
          ],
          title: Text(
            "Regester",
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
                      setState(() => isLoasing=true);
                     dynamic result= await _auth.regWithMailAndPass(mail, pass);
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
                  child: Text("Regester"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 20,),
                Text(error,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
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

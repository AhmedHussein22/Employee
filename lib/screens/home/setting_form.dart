import 'package:fire_base_1/model/user.dart';
import 'package:fire_base_1/model/user_stream.dart';
import 'package:fire_base_1/services/database.dart';
import 'package:fire_base_1/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _key = GlobalKey<FormState>();

  String crrname;
  var crrage;
  var crrsalary;

  @override
  Widget build(BuildContext context) {
          final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DataBaseServices(uid: user.uid).userdata,
      builder: (context, snapshot) {
        UserData userData = snapshot.data;
        if (snapshot.hasData ) {
          return Form(
          key: _key,
          child: Column(
            children: [
              Text(
                "Update",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: userData.name,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.person_pin,
                      color: Colors.orange,
                    ),
                    labelText: "UPdate name"),
                validator: (value) =>
                    value.isEmpty ? "Pleas Enter Your New Name" : null,
                onChanged: (value) {
                  setState(() => crrname = value);
                },
              ),
              TextFormField(
                initialValue: userData.salary.toString(),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.monetization_on,
                      color: Colors.orange,
                    ),
                    labelText: "UPdate salary"),
                validator: (value) =>
                    value.isEmpty ? "Pleas Enter Your New salary" : null,
                onChanged: ( value) {
                  setState(() => crrsalary = value);
                },
              ),
              SizedBox(height: 20,),
              Slider(
                value: (crrage ?? userData.age.toDouble()).toDouble(),
                onChanged:(value) {
                  setState(() => crrage = value.round());
                },
               // divisions: 1,
                label: "Update Age",
                min: 20.0,
                max: 60.0,
                activeColor: Colors.orange,
                inactiveColor: Colors.grey,

                ),
             
              Text("Your selected age is: $crrage"),
               SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                 if (_key.currentState.validate()) 
                 {
                   await DataBaseServices(uid: user.uid).updateUserData(
                     crrname?? userData.name, 
                     crrage?? userData.age,
                      crrsalary?? userData.salary
                      );
                   Navigator.pop(context);
                 }
                  
                },
                color: Colors.orange,
                elevation: 10,
                child: Text("Update"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            ],
          ),
        );
          
        } else {
          return Loading();
        }
        
      }
    );
  }
}

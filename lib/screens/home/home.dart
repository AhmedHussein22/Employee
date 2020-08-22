import 'package:fire_base_1/model/user_stream.dart';
import 'package:fire_base_1/screens/home/setting_form.dart';
import 'package:fire_base_1/screens/home/user_list.dart';
import 'package:fire_base_1/services/auth_fire.dart';
import 'package:fire_base_1/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Services _auth = Services();

  @override
  Widget build(BuildContext context) {
    setting()
    {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
          child: SettingForm(),
        );

      }
      );
    }
    return StreamProvider<List<UserStream>>.value(
      value: DataBaseServices().user,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text(
            "welcome",
          ),
          actions: [
            FlatButton.icon(
              onPressed: () {
                _auth.signOut();
              },
              icon: Icon(Icons.account_circle),
              label: Text("SIGNOUT"),
            ),
            FlatButton.icon(
              onPressed: () =>setting(),
              icon: Icon(Icons.settings_applications),
              label: Text("Setting"),
            ),
          ],
          primary: true,
        ),
        body: UserList(),
      )),
    );
  }
}

import 'package:fire_base_1/model/user_stream.dart';
import 'package:fire_base_1/screens/home/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<UserStream>>(context)??[];



    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context,index)
      {
        return UsreTile(userStream: users[index]);
      }
      ,
      
    );
  }
}
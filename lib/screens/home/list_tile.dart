import 'package:fire_base_1/model/user_stream.dart';
import 'package:flutter/material.dart';

class UsreTile extends StatefulWidget {

  final UserStream userStream;
  UsreTile({this.userStream});

  @override
  _UsreTileState createState() => _UsreTileState();
}

class _UsreTileState extends State<UsreTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(

        borderOnForeground: true,
        color: Colors.orange,
        elevation: 5,
        margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          
          leading: CircleAvatar(
            child: Text(widget.userStream.name.substring(0,2).toUpperCase()),
          ),
          title: Text(widget.userStream.name),
          subtitle: Text("${widget.userStream.name} has ${widget.userStream.age}"),
        ),
        
      ),
    );
  }
}
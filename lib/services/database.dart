import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_1/model/user.dart';
import 'package:fire_base_1/model/user_stream.dart';

class DataBaseServices{
  final uid ;
  DataBaseServices({this.uid});

  //collection reference
  final CollectionReference usercollection =Firestore.instance.collection("User");

  Future updateUserData (String name , int age, double salary )async{

    return await usercollection.document(uid).setData({
       
       "name": name,
       "age": age,
       "salary":salary,
    });

  }

  //user list from snapshot
  List<UserStream>_userfeomsnapshot (QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc) {
      return UserStream(
        age: doc.data["age"] ?? 0,
        name: doc.data["name"] ?? "",
        salary: doc.data["salary"] ?? 0.0
        );
    }).toList();
    

  }
  // user data from snapshot
  UserData _userDatafromsnapshot (DocumentSnapshot snapshot)
  {
    return UserData(
      uid: uid,
      name: snapshot.data["name"],
      age: snapshot.data["age"],
      salary: snapshot.data["salary"],

    );
  }

  Stream<List<UserStream>> get user{
    return usercollection.snapshots().map(_userfeomsnapshot);

  }
  //get user doc stream
  Stream<UserData>get userdata{
    return usercollection.document(uid).snapshots().map(_userDatafromsnapshot);
  }

}
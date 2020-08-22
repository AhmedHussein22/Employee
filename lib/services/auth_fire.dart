import 'package:fire_base_1/model/user.dart';
import 'package:fire_base_1/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Services {
  final FirebaseAuth _auth =FirebaseAuth.instance;
  User _userFromFirebase (FirebaseUser user)
  {
    return user != null ? User(uid: user.uid): null;
  }

  Stream <User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  //sign in anoa
  Future signInAnon()async
   {
    try 
    {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
      
    }
     catch (e) 
    {
      print(e.toString());
      return null;
    }
  }

  //sign in with mail
  Future signINWithMailAndPass(String mail, String pass)async
  {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: mail, password: pass);
      FirebaseUser user= result.user;
      return _userFromFirebase(user);
      
    } catch (e) {
      print(e.toString());
      return null;
    }

  }

  //reg with mail
  Future regWithMailAndPass(String mail, String pass)async
  {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: mail, password: pass);
      FirebaseUser user= result.user;
      await DataBaseServices(uid: user.uid).updateUserData("Ahmed", 21, 3000.5);
      return _userFromFirebase(user);
      
    } catch (e) {
      print(e.toString());
      return null;
    }

  }

  //sign out
  Future signOut()async
   {
    try 
    {
     return _auth.signOut();
      
    }
     catch (e) 
    {
      print(e.toString());
      return null;
    }
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kotgirwar_fan_club/models/user.dart';

class AuthService{

  final FirebaseAuth _auth=FirebaseAuth.instance;

  //create user object based on firebase user 
  User _userfromfirebaseuser(FirebaseUser user){
    return user!=null ? User(uid: user.uid) : null;
  }

  //auth change user stream

  Stream<User> get user{
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userfromfirebaseuser(user));
    .map(_userfromfirebaseuser);
  }

  //sign in anonymously
  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userfromfirebaseuser(user) ;
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailandPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password:password);
      FirebaseUser user = result.user;
      return _userfromfirebaseuser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailandPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email,password:password);
      FirebaseUser user = result.user;
      return _userfromfirebaseuser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out

  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}
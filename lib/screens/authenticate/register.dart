import 'package:flutter/material.dart';
import 'package:kotgirwar_fan_club/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth=AuthService();

  //text field state
  String email="";
  String password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor:Colors.purple[400],
        elevation: 0.0,
        title: Text('Sign Up to KFC'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                
                onChanged: (val){
                  setState(()=>email=val);
                }
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(()=>password=val);
                }
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color: Colors.purple[400], 
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print(email);
                  print(password);
                },
              )
            ]
          ),
        )
      ),
    );
  }
}
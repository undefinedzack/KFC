import 'package:flutter/material.dart';
import 'package:kotgirwar_fan_club/services/auth.dart';
import 'package:kotgirwar_fan_club/shared/constants.dart';
import 'package:kotgirwar_fan_club/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth=AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email="";
  String password="";
  String error='';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        backgroundColor:Colors.purple[400],
        elevation: 0.0,
        title: Text('Sign In to KFC'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: (){
              widget.toggleView();
            }, 
            icon: Icon(Icons.person), 
            label: Text('Register')
            ) 
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText : 'E-mail'),
                validator: (val)=> val.isEmpty ? 'Enter an email' : null,
                onChanged: (val){
                  setState(()=>email=val);
                }
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText : 'Password'),
                validator: (val)=> val.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                onChanged: (val){
                  setState(()=>password=val);
                }
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color: Colors.purple[400], 
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formkey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailandPassword(email, password);
                    if(result==null){
                      setState(() {
                        error = 'sahi daalo na sir';
                        loading = false;
                      } );
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ]
          ),
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:kotgirwar_fan_club/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:kotgirwar_fan_club/models/user.dart';
import 'package:kotgirwar_fan_club/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
  
    
    //return home or authenticate widget
    
    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
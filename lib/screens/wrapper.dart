import 'package:petlubb/models/user.dart';
import 'package:petlubb/screens/authentication/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:petlubb/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if(user == null){
      return Authenticate();
    } else{
      return Home();
    }

    return Authenticate();


  }
}


import "package:flutter/material.dart";
import 'package:petlubb/models/user.dart';
//import 'package:petlubb/screens/home/profile_page.dart';
import 'package:petlubb/services/database.dart';
import 'package:petlubb/shared/constants.dart';
import 'package:petlubb/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> purpose = ['sell', 'giveup'];

  String _currentName;
  String _currentEmail;
  String _currentPhoneNo;
  int _currentPrice;
  String _currentAddress;
  String _currentPurpose;
  String _currentPetType;

  @override
  Widget build(BuildContext context) {

      final user = Provider.of<User>(context);


    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData userData = snapshot.data;




            return Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.only(top: 50),
              // ),

              // Text(
              //   'Profile',
              //   style: TextStyle(
              //     fontSize: 20.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // // ),
              //  Padding(
              //   padding: EdgeInsets.only(top: 50),
              // ),
              // Text(
              //   'Update your profile details',
              //   style: TextStyle(
              //     fontSize: 20.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
               
              // Padding(
              //    padding: EdgeInsets.only(top: 80)),

                //   RaisedButton(
                // color: Colors.blue[800],
                // child: Text(
                //   'Update Profile',
                //   style: TextStyle(color: Colors.white),
                // ),
                //  onPressed: () =>  {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => ProfilePageForm()))
                // }
              //    )
            
                         Padding(
                                 padding: EdgeInsets.only(top: 80)),
                
                              Text(
                                'Update your pet details',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 50),
                              ),
                              TextFormField(
                               // initialValue: userData.name,
                                decoration: textInputDecoration.copyWith(hintText: 'Name'),
                                validator: (val) => val.isEmpty ? 'Please Enter your name' : null,
                                onChanged: (val) => setState(() => _currentName = val),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              TextFormField(
                                //initialValue: userData.phoneno,
                                decoration: textInputDecoration.copyWith(hintText: 'phone number'),
                                validator: (val) =>
                                    val.isEmpty ? 'Please Enter your contact number' : null,
                                onChanged: (val) => setState(() => _currentPhoneNo = val),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              TextFormField(
                                //initialValue: userData.email,
                                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                                validator: (val) => val.isEmpty ? 'Please Enter your email' : null,
                                onChanged: (val) => setState(() => _currentEmail = val),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              TextFormField(
                               // initialValue: userData.address,
                                decoration: textInputDecoration.copyWith(hintText: 'address'),
                                validator: (val) =>
                                    val.isEmpty ? 'Please Enter your address' : null,
                                onChanged: (val) => setState(() => _currentAddress = val),
                              ), Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              TextFormField(
                                //initialValue: userData.price.toString(),
                                decoration: textInputDecoration.copyWith(hintText: 'Pet type'),
                                validator: (val) => val.isEmpty ? 'Please Enter your pet type' : null,
                                onChanged: (val) => setState(() => _currentPetType = val) ,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              TextFormField(
                                //initialValue: userData.price.toString(),
                                decoration: textInputDecoration.copyWith(hintText: 'Price'),
                                validator: (val) => val.isEmpty ? 'Please Enter your price' : null,
                                onChanged: (val) => setState(() => _currentPrice = int.parse(val)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              Text('What do you want to do?'),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                              ),
                              DropdownButtonFormField(
                                value: _currentPurpose,
                                decoration: textInputDecoration,
                                items: purpose.map((purpose) {
                                  return DropdownMenuItem(
                                    value: purpose,
                                    child: Text('$purpose'),
                                  );
                                }).toList(),
                                onChanged: (val) => setState(() => _currentPurpose = val),
                              ),
                              RaisedButton(
                                color: Colors.blue[800],
                                child: Text(
                                  'Update',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if(_formKey.currentState.validate()){
                                    await DatabaseService(uid: user.uid).updateUserData(
                                      _currentName ?? userData.name
                                    ,_currentPetType ?? userData.pettype,
                                     _currentAddress ?? userData.address,
                                     _currentEmail ?? userData.email,
                                    _currentPurpose ?? userData.purpose,
                                     _currentPhoneNo ?? userData.phoneno,
                                      _currentPrice ?? userData.price);
                
                                      Navigator.of(context).pop();
                                  }
                                },
                              )
                            ],
                          ),
                        );
                
                          }else{
                
                            return Loading();
                
                          }
                
                
                      }
                    );
                  }
                }
                
               
import 'package:flutter/material.dart';
import 'package:petlubb/services/auth.dart';
import 'package:petlubb/shared/constants.dart';
import 'package:petlubb/shared/loading.dart';

class Register extends StatefulWidget {
final Function toggleView;
Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = "";
   String password = "";
   String error = "";

  @override
  Widget build(BuildContext context) {
     return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(

        backgroundColor: Colors.blue[500],
        title: Text("Sign up to PetLubb!"),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: (){
              widget.toggleView();

            },
          )
        ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration:textInputDecoration.copyWith(hintText: 'Email'),


                  validator: (val) => val.isEmpty ? 'Enter an email': null,

                  onChanged: (val){
                  setState(() => email = val);

                },),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration:textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Password should be atleast 6 characters long!' : null,

                  onChanged: (val){
                    setState(() => password = val );

                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.indigo[400],
                  child: Text('Register',
                  style: TextStyle(color: Colors.white)
                  ,),
                  onPressed: () async{
                    
                    if(_formKey.currentState.validate()){
                          print(email);
                          print(password);
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth.registerWithEmailAndPassword(email,password);
                          if (result == null){
                            setState((){
                              error = 'please supply a valid email or sign in if already registered';
                              loading = false;

                          });
                          }
                    }
                  },
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
              ],
            ),

          ),

        ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:petlubb/screens/authentication/authenticate.dart';
import 'package:petlubb/services/auth.dart';
import 'package:petlubb/shared/constants.dart';
import 'package:petlubb/shared/loading.dart';


class SignIn extends StatefulWidget {


  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}


class _SignInState extends State<SignIn> {
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
        title: Text("PetLubbApp"),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
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
                  validator: (val) => val.length < 6 ? 'Password should be atleast 6 characters long!' : null,

                  obscureText: true,
                  onChanged: (val){
                    setState(() => password = val );

                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.indigo[400],
                  child: Text('Sign In',
                  style: TextStyle(color: Colors.white)
                  ,),
                  onPressed: () async{
                    print(email);
                    print(password);
                    if(_formKey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);


                    if (result == null){
                    setState(() {
                      error = 'COULD NOT SIGN IN WITH THOSE CREDENTIALS!';
                      loading = false;
                        });
                    }
                  }},
                  ),
                   SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
              ],
            ),

          ),

        ),
    );
  }
}
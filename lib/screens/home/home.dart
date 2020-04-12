import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petlubb/models/pet.dart';
import 'package:petlubb/screens/home/pet_list.dart';
import 'package:petlubb/screens/home/settings_form.dart';
import 'package:petlubb/services/auth.dart';
import 'package:petlubb/services/database.dart';
import 'package:provider/provider.dart';
//import 'package:petlubb/screens/home/profile_page.dart';
class Home extends StatelessWidget{
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context){

    void _showSettingsPanel(){

      showModalBottomSheet(context: context,
      builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,
          horizontal: 60.0),
          child: SettingsForm(),
        );

    }, isScrollControlled: true);


    // void _showProfilePanel(){
    //   showModalBottomSheet(context: context,
    //   builder:(context) {
    //     return Container(
    //       child: ProfilePageForm(),
    //   );
    // }
    //   );
    // }
    }
    
  


    return StreamProvider<List<Pet>>.value(
      value: DatabaseService().pets,
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          title: Text('Pet LuBB'),
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                  await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel() ,

            ),

          ],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.png'),
                fit: BoxFit.fitHeight, )
            ),
            child: PetList()),
      ),
    );
  }
}

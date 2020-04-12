//import 'package:flushbar/flushbar.dart';
//import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petlubb/models/pet.dart';

//import 'package:petlubb/screens/home/details_form.dart';


class PetTile extends StatelessWidget {
  final Pet pet;
  PetTile({this.pet});
  String copyText;


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          isThreeLine: true,
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage('assets/dog.jpeg'),),
            title: Text('${pet.name}            ',style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text('${pet.name} wants to ${pet.purpose} their pet ${pet.petType} for ${pet.price}. Contact: ${pet.phno} email: ${pet.emailId}',
            style: TextStyle(color: Colors.black),),
            onTap: (){ Clipboard.setData(new ClipboardData(text: '${pet.phno}' ));
//             Flushbar(
//   message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
//   icon: Icon(
//     Icons.info_outline,
//     size: 28.0,
//     color: Colors.blue[300],
//     ),
//   duration: Duration(seconds: 3),
//   leftBarIndicatorColor: Colors.blue[300],
// )..show(context);
           // showSimpleFlushbar(context);
                     //   SnackBarPage();
                                    
                            
                                     } ),
                                              ),
                                        
                                            );
                                          }
            
  //     void showSimpleFlushbar(BuildContext context) {
  //   Flushbar(
  //     // There is also a messageText property for when you want to
  //     // use a Text widget and not just a simple String
  //     message: 'Hello from a Flushbar',
  //     // Even the button can be styled to your heart's content
  //     mainButton: FlatButton(
  //       child: Text(
  //         'Click Me',
  //         style: TextStyle(color: Theme.of(context).accentColor),
  //       ),
  //       onPressed: () {},
  //     ),
  //     duration: Duration(seconds: 3),
  //     // Show it with a cascading operator
  //   )..show(context);
  // }
              }
                            
            
            
    


            
            
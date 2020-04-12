import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:petlubb/models/pet.dart';
import 'package:petlubb/models/user.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});


  final CollectionReference petCollection = Firestore.instance.collection('pets');

  Future updateUserData(String name,String petType, String address, String emailId, String purpose, String phno, int price )
  async {
    return await petCollection.document(uid).setData({
      'name': name,
      'petType' : petType,
      'address': address,
      'emailId' : emailId,
      'purpose' : purpose,
    //image to be added
      'phno' : phno,
      'price' : price
    });
  }

  List<Pet> _petListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
        return Pet(
          name: doc.data['name'] ?? '',
          address: doc.data['address'] ?? '',
          emailId: doc.data['emailId'] ?? '',
          petType: doc.data['petType'] ?? '',
          phno: doc.data['phno'] ?? '',
          price: doc.data['price'] ?? 0,
          purpose: doc.data['purpose'] ?? ''
        );
    }).toList();
  }

  UserData _userDataFromSnapShot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      address: snapshot.data['address'],
      email: snapshot.data['email'],
      pettype: snapshot.data['pettype'],
      phoneno: snapshot.data['phoneno'],
      price: snapshot.data['price'],
      purpose: snapshot.data['purpose']
    );
  }



  Stream<List<Pet>> get pets{
    return petCollection.snapshots()
    .map(_petListFromSnapshot);
  }


//get user doc stream

Stream<UserData> get userData{

  return petCollection.document(uid).snapshots()
  .map(_userDataFromSnapShot);



}



}
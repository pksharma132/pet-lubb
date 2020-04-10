import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final CollectionReference petCollection = Firestore.instance.collection('pets');

  Future updateUserData(String dogs, String cats, ){
    
  }
}
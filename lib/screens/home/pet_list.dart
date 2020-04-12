

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petlubb/models/pet.dart';
import 'package:petlubb/screens/home/pet_tile.dart';
import 'package:provider/provider.dart';

class PetList extends StatefulWidget {
  @override
  _PetListState createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  @override
  Widget build(BuildContext context) {

      final pets = Provider.of<List<Pet>>(context) ?? [];


     // print(pets.documents);
    pets.forEach((pet){
      print(pet.name);
      print(pet.emailId);
      print(pet.address);
      print(pet.phno);
      print(pet.purpose);
      print(pet.price);
      print(pet.petType);

     // final details = Provider.of<QuerySnapshot>(context);

    });

    return ListView.builder(
      itemCount: pets.length,
      itemBuilder: (context,index){
        return PetTile(pet: pets[index],);
      },


    );
  }
}
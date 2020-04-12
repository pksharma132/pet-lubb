class User{
  final String uid;
  User({this.uid});

}

class UserData{
  final String uid;
  final String name;
  final String email;
  final String pettype;
  final String phoneno;
  final String address;
  final String purpose;
  final int price;

  UserData({ this.uid, this.name,
  this.email, this.phoneno, this.address,this.pettype,
   this.purpose, this.price});
}
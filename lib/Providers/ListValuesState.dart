import 'package:flutter/cupertino.dart';


class Contact {
  String nom;
  String phone;
  String email;
  String location;
  Contact(this.nom, this.phone, this.email, this.location);

}
class ListValuesState extends ChangeNotifier{
  List<Contact> data=[];

  void AddItem(String nom,String phone,String email,String location){
    Contact contact =new Contact(nom, phone, email, location);
data.add(contact);
notifyListeners();
  }
}
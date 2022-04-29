

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/ListValuesState.dart';

class Ajout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AjoutState();
  }
}

class _AjoutState extends State<Ajout> {
  TextEditingController Name =new TextEditingController();
  TextEditingController Phone =new TextEditingController();
  TextEditingController email =new TextEditingController();
  TextEditingController location =new TextEditingController();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar:AppBar(
      title: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text("Ajouter un Contact", textAlign: TextAlign.center),
        ],
      ),
    ),
    body: Center(
      child: Card(
        child: ListView(
          children: [
            Expanded(
        child: Padding(
        padding:EdgeInsets.all(8),
          child:TextFormField(
                  controller: Name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.face),
                    label: Text("Name"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15))),
                ))),
            Expanded(
                child: Padding(
                  padding:EdgeInsets.all(8),
                child:TextFormField(
                  controller: Phone,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.call,color: Colors.green,),
                      label: Text("Phone Number"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15))),
                ))),
            Expanded(
              child: Padding(
                padding:EdgeInsets.all(8),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,color: Colors.red,),
                      label: Text("Gmail"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15))),
                ))),
            Expanded(
              child: Padding(
                padding:EdgeInsets.all(8),
                child:TextFormField(
                  controller: location,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on,color: Colors.blue,),
                      label: Text("Location"),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(15))),
                ))),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:EdgeInsets.all(8),
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      )
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.blue,
                      textStyle: TextStyle(fontSize: 20,color: Colors.green),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context,"/contacts");
                      setState(() {
                        Provider.of<ListValuesState>(context,listen: false).AddItem(Name.text,Phone.text,email.text,location.text);
                      });
                    },
                    child:Text("Save"),
                  ),
                ),
              ),
            ),
              ]),
  ),
      ),
    );
  }

}
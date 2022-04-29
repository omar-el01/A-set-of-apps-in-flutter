import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Covid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CovidState();
  }
}

class _CovidState extends State<Covid> {
  var Data = null;
  TextEditingController covidController = TextEditingController();

  void GetStatics(String Country) {
    String url = "https://covid-api.mmediagroup.fr/v1/cases?country=${Country}";
    http.get(Uri.parse(url)).then((response) {
      print('Response status: ${response.statusCode}');
      setState(() {
        if (response.statusCode == 200) {
          // If the server did return a 200 OK response,
          // then parse the JSON.
          Data = json.decode(response.body);
        } else {
          // If the server did not return a 200 OK response,
          // then throw an exception.
          throw Exception('Failed to load Statistics');
        }
      });
    });
  }

  String getFlag(String country) {
    String url = "https://countryflagsapi.com/png/${country}";
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Covid-19 statistics", textAlign: TextAlign.center),
            ],
          ),
        ),
        body:Padding(
    padding:EdgeInsets.all(10),
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: covidController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.coronavirus),
                        hintText: "Country",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(15))),
                  )),
                  SizedBox(
                    width: 4,
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                        color: Colors.blue, shape: CircleBorder()),
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          GetStatics(covidController.text);
                        });
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      itemCount: Data == null || Data["All"] == null ? 0 : 1,
                      itemBuilder: (context, index) {
                        return Card(
                          shape:RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          color: Colors.blueGrey,
                          elevation: 15,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 2, 10),
                              child: Column(children:[
                                Row(
                                  children: [
                                    Container(
                                      height: 200,
                                      margin: EdgeInsets.all(8.0),
                                      child:Image.network(
                                          getFlag(covidController.text),
                                        fit: BoxFit.cover),
                                    ),
                                    SizedBox(width: 600,
                                      height: 600,
                                      child:ListView(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        children: [
                                          Card(
                                            child:ListTile(
                                              leading: IconTheme(
                                                  data: IconThemeData(
                                                      color: Colors.red),
                                                  child: Icon(Icons.airline_seat_individual_suite,size: 60),
                                    ),
                                              title: Padding(padding:
                                              EdgeInsets.fromLTRB(2, 8, 2, 8),
                                                child: Column(
                                                    children: [
                                                      Text(
                                                          Data["All"]["deaths"].toString(),
                                                          style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 26),
                                                          textAlign: TextAlign.center),
                                                      Text("Total Deaths",style: TextStyle(fontSize:18,fontStyle: FontStyle.italic)),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            child: ListTile(
                                              leading:
                                              IconTheme(
                                                data: IconThemeData(
                                                    color: Colors.blue),
                                                child: Icon(Icons.whatshot,size: 60),
                                              ),
                                              title:Padding(
                                                padding:
                                                EdgeInsets.fromLTRB(2, 8, 2, 8),
                                                child:Column(
                                                    children: [
                                                      Text(
                                                          Data["All"]["confirmed"].toString(),
                                                          style:TextStyle(fontWeight: FontWeight.bold, fontStyle :FontStyle.italic,fontSize: 26),
                                                          textAlign: TextAlign.center),
                                                      Text("Active Cases",style: TextStyle(fontSize: 18, fontStyle :FontStyle.italic)),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            child:ListTile(
                                              leading:
                                              IconTheme(
                                                data: IconThemeData(
                                                    color: Colors.green),
                                                child: Icon(Icons.whatshot,size: 60),
                                              ),
                                              title : Padding(
                                                padding:
                                                EdgeInsets.fromLTRB(2, 8, 2, 8),
                                                child:Column(
                                                    children: [
                                                      Text(Data["All"]["recovered"].toString(),
                                                          style: TextStyle(fontWeight:FontWeight.bold, fontStyle: FontStyle.italic,fontSize: 26),
                                                          textAlign:TextAlign.center),
                                                      Text("Total Recovered",style: TextStyle(fontSize: 18, fontStyle :FontStyle.italic)),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            child: ListTile(
                                              leading:
                                              IconTheme(
                                                data: IconThemeData(
                                                    color: Colors.grey),
                                                child: Icon(Icons.date_range,size: 60),
                                              ),
                                              title: Padding(
                                                padding:
                                                EdgeInsets.fromLTRB(2, 8, 2, 8),
                                                child:Column(
                                                    children: [
                                                      Text(
                                                          Data["All"]["updated"].toString().substring(0, 10),
                                                          style: TextStyle(fontWeight:FontWeight.bold, fontStyle: FontStyle.italic,fontSize: 26),
                                                          textAlign:TextAlign.center),
                                                      Text("Updated Date",style: TextStyle(fontSize: 18, fontStyle :FontStyle.italic)),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                          Card(
                                            child: ListTile(
                                              leading:
                                              IconTheme(
                                                data: IconThemeData(
                                                    color: Colors.brown),
                                                child: Icon(Icons.people,size: 60),
                                              ),
                                              title: Padding(
                                                padding:
                                                EdgeInsets.fromLTRB(2, 8, 2, 8),
                                                child:Column(
                                                    children: [
                                                      Text(
                                                          Data["All"]["population"].toString(),
                                                          style:TextStyle(fontWeight:FontWeight.bold,fontStyle:FontStyle.italic,fontSize: 26),
                                                          textAlign: TextAlign.center),
                                                      Text("population",style: TextStyle(fontSize: 18, fontStyle :FontStyle.italic)),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                  ],
                                  ),
    ));}
                        )),
                              ]),
    ));
  }
}

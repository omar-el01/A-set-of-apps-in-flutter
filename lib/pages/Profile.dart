import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/ListValuesState.dart';

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text("Profile", textAlign: TextAlign.center),
          ],
        ),
      ),
      body: Center(
          child: Column(
            children: [
                  Expanded(
                  child:Consumer<ListValuesState>(builder: (context,d,i){
                    return ListView.builder(
                    itemCount:d.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                      title: ListView(
                        shrinkWrap: true,
                        children: [
                        CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.blueGrey,
                      ),
                          SizedBox(height: 10,),
                        Align(
                          alignment: Alignment.center,
                          child: Text(d.data[index].nom,style: TextStyle(fontSize: 22,fontWeight:FontWeight.w400),),
                        ),
                          Card(
                              margin: EdgeInsets.all(10),
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(Icons.call,color: Colors.green,size: 40,),
                                      backgroundColor: Colors.white70,
                                    ),
                                    SizedBox(width: 12,),
                                    Text(d.data[index].phone,style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),),
                                  ],
                                ),
                              )
                          ),
                          Card(
                            margin: EdgeInsets.all(10),
                            child:Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    child: Icon(Icons.email,color:Colors.red,size: 40,),
                                    backgroundColor: Colors.white70,
                                  ),
                                  SizedBox(width: 12,),
                                  Text(d.data[index].email+"@gmail.com",style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(Icons.location_on,color: Colors.blue,size: 40,),
                                      backgroundColor: Colors.white70,
                                    ),
                                    SizedBox(width: 12,),
                                    Text(d.data[index].location,style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),),
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                      );
          },);
          }),
      ),
      ],),
          )
    );
  }
}

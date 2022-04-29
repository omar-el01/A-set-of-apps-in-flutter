import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AboutState();
  }

}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("About Me", textAlign: TextAlign.center,),
      ),
      body:Padding(
            padding:
            EdgeInsets.all(4),
          child:ListView(
            children: [
              Container(
                height: 300,
                width: 1800,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/cvp.jpg"),
                      fit: BoxFit.cover,
                    )
                ),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 100,
                              backgroundImage: AssetImage("images/pr.jpg"),
                            ),
                            SizedBox(height: 10,),
                            Text("Omar EL-AQQAD",style: TextStyle(fontSize: 22,fontWeight:FontWeight.w400),),
                            SizedBox(height: 8,),
                            Text("Hello , my name is omar el-aqqad ,i'm a big data engineering student from ENSET-M",style:TextStyle(color: Colors.white,fontSize: 18),softWrap:true),
                          ],
                        )
                    ),
                  ],
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.call,color: Colors.green,size: 40,),
                          backgroundColor: Colors.white70,
                        ),
                        SizedBox(width: 12,),
                        Text("+212 6 97 03 19 65",style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),),
                      ],
                    ),
                  )
              ),
              Card(
                  margin: EdgeInsets.all(10),
                  child:Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.email,color:Colors.red,size: 40,),
                        backgroundColor: Colors.white70,
                      ),
                      SizedBox(width: 12,),
                      Text("omaargily@gmail.com",style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),),
                    ],
                  ),
              ),
              ),
              Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.location_on,color: Colors.blue,size: 40,),
                        backgroundColor: Colors.white70,
                      ),
                      SizedBox(width: 12,),
                      Text("Mohammedia",style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold),),
                    ],
                  )
              ),
              ),
            ],
          ),
        ),
      );
  }
}
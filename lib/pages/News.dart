import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class News extends StatefulWidget {  @override
  State<StatefulWidget> createState() {
  return _NewsState();

  }
}

class _NewsState extends State<News>{
  TextEditingController keyword=new TextEditingController();
  String APIkey="e1a5037e88754d08ab963f06addd2c83";
  var news=null;
  void GetNews(String keyword) {
    String url="https://newsapi.org/v2/everything?q=${keyword}&from=2022-04-02&sortBy=publishedAt&apiKey=${APIkey}";
    http.get(Uri.parse(url)).then((response) {
setState(() {
  news=json.decode(response.body);
});
    }).catchError((onError){
  print("Failed to load news");
  });
  }

  @override
  Widget build(BuildContext context) {
   return
     Scaffold(
       appBar: AppBar(
         title:
         Row(
           children: [
             SizedBox(
               width: 20,
             ),
             SizedBox(
               width: 10,
             ),
           Text("News",textAlign: TextAlign.center)
           ],
         ),
       ),
       body: Padding(
         padding:
         EdgeInsets.fromLTRB(2, 6, 2, 6),
         child: Column(
           children: [
             Row(
               children: [
                 Expanded(
                   child: TextFormField(
                     decoration: InputDecoration(
                         prefixIcon: Icon(Icons.newspaper,color: Colors.indigo,size: 25,),
                         hintText: "News ",
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15)
                         )
                     ),
                     controller: keyword,
                   ),
                 ),
                 Ink(
                   decoration: ShapeDecoration(
                       shape:CircleBorder(),),width: 60,height: 60,
                   child: IconButton(
                     icon: Icon(Icons.search,color: Colors.blue,size: 25,),
                     onPressed: () {
                       setState(() {
                         GetNews(keyword.text);
                       });
                     },
                   ),
                 ),
               ],
             ),
             SizedBox(height: 5,),
             Expanded(child: ListView.builder(
               shrinkWrap: true,
                 padding: EdgeInsets.all(8),
                 itemCount: news==null || news["articles"]==null ? 0 : news["articles"].length,
                 itemBuilder:(context,index){
                   return Card(
                     child: Column(
                       children:[
                         Row(
                           children: [
                             Container(
                                 child:Image.network(news["articles"][index]["urlToImage"],width: 400,height:400,fit: BoxFit.cover,)
                             ),
                           ],
                         ),
                         SizedBox(
                             height: 700,
                             width: 700,
                             child: ListView(
                               scrollDirection: Axis.vertical,
                               shrinkWrap: true,
                               children: [
                                 ListTile(
                                   leading: Icon(Icons.subtitles,color: Colors.indigo,size: 30,),
                                   title: Text(news["articles"][index]["title"],style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                                 ),
                                 ListTile(
                                   leading: Icon(Icons.description,color: Colors.blue,size: 30,),
                                   title:Text(news["articles"][index]["description"]),
                                 ),
                                 ListTile(
                                   leading: Icon(Icons.person,color: Colors.blueGrey,size: 30,),
                                   title: Text(news["articles"][index]["author"],style:TextStyle(fontSize: 12)),
                                 ),
                               ],
                             )
                         ),
                     ],
                     )
                   );

                 }))
               ],
             )
         ),
       );
  }
}

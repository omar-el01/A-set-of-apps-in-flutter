import 'package:flutter/material.dart';

class News extends StatefulWidget {  @override
  State<StatefulWidget> createState() {
  return _NewsState();

  }
}

class _NewsState extends State<News>{
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
     );
  }
}

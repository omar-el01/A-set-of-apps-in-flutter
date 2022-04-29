import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1_flutter/Providers/ListValuesState.dart';
import 'package:tp1_flutter/pages/About.dart';
import 'package:tp1_flutter/pages/Ajout.dart';
import 'package:tp1_flutter/pages/Covid.dart';
import 'package:tp1_flutter/pages/News.dart';
import 'package:tp1_flutter/pages/Profile.dart';
import 'package:tp1_flutter/pages/contacts.dart';
import 'package:tp1_flutter/pages/github_users.dart';
import 'package:tp1_flutter/pages/home.dart';

void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListValuesState())
      ],
     child:MaterialApp(
       theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          //bodyText1: TextStyle(color: Colors.grey)
        )
      ),
      routes: {
        "/":(context)=>Home(),
        "/contacts":(context)=>Contacts(),
        "/github_users":(context)=>GitHubUsers(),
        "/covid":(context)=>Covid(),
        "/news":(context)=>News(),
        "/about":(context)=>About(),
        "/profile":(context)=>Profile(),
        "/ajout":(context)=>Ajout(),
      },

    ));
  }

}
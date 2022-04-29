import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1_flutter/widgets/app_drawer.dart';


class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
  return _homeState();

  }
}

class _homeState  extends State<Home>{

  void Search(String text) {

print(text);
  }
  TextEditingController keyword=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Padding(
            padding: EdgeInsets.all(13),
            child: Align(
                  alignment: Alignment.bottomRight,
                  child: Ink(
                    decoration: ShapeDecoration(
                        shape:CircleBorder(),
                        color: Colors.orange),width: 60,height: 60,
                    child: IconButton(
                      icon: Icon(Icons.add,color: Colors.white,size: 40,),
                      onPressed: () {
                        Navigator.pushNamed(context,"/ajout");
                      },
                    ),
                  ),
                )
    ));
  }
}

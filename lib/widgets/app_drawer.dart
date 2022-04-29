import 'package:flutter/material.dart';
import 'package:tp1_flutter/widgets/drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context,"/about");
                },
                child:const CircleAvatar(
                    backgroundImage: AssetImage("images/pr.jpg"),
                    radius: 50
                  ),
              ),
              const SizedBox(height: 10),
              const Text("Profile",style: TextStyle(fontSize: 20),),
            ],
          )),
          DrawerItem("Home","/",const Icon(Icons.home,color: Colors.blue,size: 30,)),
          DrawerItem("Contacts","/contacts",const Icon(Icons.contacts,color: Colors.orange,size: 30,)),
          DrawerItem("Github Users","/github_users",const Icon(Icons.supervised_user_circle,color: Colors.black,size: 30,)),
          DrawerItem("News","/news",const Icon(Icons.newspaper,color: Colors.indigo,size: 30,)),
          DrawerItem("Covid 19","/covid",const Icon(Icons.airplay_rounded,color: Colors.redAccent,size: 30,)),
          DrawerItem("About","/about",const Icon(Icons.error,color: Colors.blueGrey,size: 30,)),

        ],
      ),
    );
  }
}

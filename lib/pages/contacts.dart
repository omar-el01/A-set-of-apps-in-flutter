import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1_flutter/Providers/ListValuesState.dart';




class Contacts extends StatefulWidget {
  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  void search(String text) {
    print(text);
  }
  TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.contacts),
                      hintText: "Search Contacts",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )
                    ),
                    controller: textController,
                  ),
                ),
                IconButton(onPressed: (){
                    setState(() {
                      search(textController.text);
                    });
                }, icon: Icon(Icons.search,color: Colors.blue,size: 30,))
              ],
            ),
            Expanded(
              child:Consumer<ListValuesState>(builder: (context,d,i){
                return  ListView.builder(
                  itemCount:d.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/profile");
                        },
                         child :CircleAvatar(
                            child: Text(d.data[index].nom[0])
                        ),
                      ),
                      title: Text(d.data[index].nom),
                    );
                  },);
              }),
            )
          ],
        ),
      ),
    );
  }
}

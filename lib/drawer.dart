import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/services.dart';
DbConnection dbConnection = DbConnection();

class DrawerMenu extends StatelessWidget{
  const DrawerMenu({super.key});

  @override 
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              currentAccountPicture: Container(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('Images/scaredClown.png'),
                ),
                ),
              accountName: const Text("Олег"),
              accountEmail: const Text("oleg@yandex.ru"),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
              otherAccountsPictures: [
                IconButton(
                  onPressed: (){
                    dbConnection.logOut();
                    Navigator.popAndPushNamed(context, '/');
                  },
                   icon: const Icon(Icons.exit_to_app)
                   )
              ],
            )
            ),
            ListTile(
                title: const Text("Settings"),
                leading: const Icon(Icons.settings, color: Colors.black),
                trailing: const Icon(Icons.arrow_right, color: Colors.black),
                onTap: (){},
            ),
            ListTile(
                title: const Text("Shop"),
                leading: const Icon(Icons.shop, color: Colors.black),
                trailing: const Icon(Icons.arrow_right, color: Colors.black),
                onTap: (){},
            ),
            ListTile(
                title: const Text("Help"),
                leading: const Icon(Icons.question_answer, color: Colors.black),
                trailing: const Icon(Icons.arrow_right, color: Colors.black),
                onTap: (){},
            )
          ],
      ),
    );
  }
}
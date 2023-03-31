import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/desktop.dart';
import 'DBPage.dart';
import 'calendar.dart';
import 'deal.dart';
import 'cards.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Deal> newDealList = List.from(dealList);
  List<Deal> newDealList2 = List.from(dealList2);
  onItemSearch(String value) {
    setState(
      () {
        if (index == 0){
          newDealList = dealList
            .where((element) => element.title!.toLowerCase().contains(value) || element.discription!.toLowerCase().contains(value) || element.title!.toUpperCase().contains(value) || element.discription!.toUpperCase().contains(value))
            .toList();
        }
        else if (index == 1){
           
        }
        else if (index == 2){
          newDealList = dealList2
            .where((element) => element.title!.toLowerCase().contains(value) || element.discription!.toLowerCase().contains(value) || element.title!.toUpperCase().contains(value) || element.discription!.toUpperCase().contains(value))
            .toList();
        }
        
        // return newDealList
        //     .where(
        //       (element) => element.title!.contains(value),
        //     )
        //     .toList();
      },
    );
  }

  // List<User> users = List.from(DBConnection().listUserMap());
  // Future users = DBConnection().list();
  // int index = 0;
  // final listPages = [
  //   const DealPages(),
  //   const CalendarPage(),
  // ];
  int index = 0;

  TextEditingController searchController = TextEditingController();
  String title = "Список дел";
  bool tittleAppBar = false;

  @override
  Widget build(BuildContext context) {
    Widget listSearchWidget(BuildContext context) {
      return ListView(
        children: newDealList.map(
          (deal) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.red,
                ),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Colors.red,
                leading: Text(
                  deal.id.toString(),style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16),
                ),
                title: Text(deal.title!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 20),),
                subtitle: Text(deal.discription!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                onTap: () {},
              ),
            );
          },
        ).toList(),
      );
    }

    TextEditingController titleDeal = TextEditingController();
    TextEditingController descriptionDeal = TextEditingController();
    TextEditingController imgUrl = TextEditingController();

    final list = [
      listSearchWidget(context), // 0
      // const CalendarPage(), // 1
      const dbPage(), // 2
      const DesktopPage(), // 3
    ];
    AppBar appBarSearch = AppBar(
      centerTitle: true,
      backgroundColor: Colors.red,
      title: TextField(
        decoration: const InputDecoration(
          label: Text("Название"),
        ),
        controller: searchController,
        onChanged: onItemSearch,
      ),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                searchController.clear();
                newDealList = dealList;
                tittleAppBar = false;
              });
            },
            icon: const Icon(Icons.close))
      ],
    );
    AppBar appBar = AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.red,
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                tittleAppBar = true;
              });
            },
            icon: const Icon(Icons.search))
      ],
    );

    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: tittleAppBar ? appBarSearch : appBar,
      // appBar: AppBar(
      //   title: Text(title),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.popAndPushNamed(context, '/');
      //         // Navigator.pop(context);
      //       },
      //       icon: const Icon(Icons.exit_to_app),
      //     ),
      //   ],
      // body: ListView(
      //   physics: const BouncingScrollPhysics(),
      //   children: users.map((user) {
      //     return Card(
      //       child: ListTile(
      //         title: Text(user.name!),
      //         subtitle: Text(user.login!),
      //         onTap: () {},
      //       ),
      //     );
      //   }).toList(),
      // ),
      // body: ListView.builder(
      //   itemCount: users.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(users as String),
      //     );
      //   },
      // ),
      body: list.elementAt(index),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: index == 0 ? FloatingActionButton(
        backgroundColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Добавить задачу'),
          content: Container(
            height: 120,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Заголовок",
                    ),
                  controller: titleDeal,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Описание",
                  ),
                  controller: descriptionDeal,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () { 
                dealList.add(new Deal(
                  id: dealList.length + 1,
                  title: titleDeal.text,
                  discription: descriptionDeal.text,
                ));
                titleDeal.text = "";
                descriptionDeal.text = "";
                setState(() {
                  newDealList = dealList;
                });
                Navigator.pop(context, 'OK');
                },
              child: const Text('OK'),
            ),
          ],
        ),
          ),
          ) : index == 1 ? FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => showDialog(
              context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Добавить задачу'),
          content: Container(
            height: 180,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Заголовок",
                    ),
                  controller: titleDeal,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Описание",
                  ),
                  controller: descriptionDeal,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "ссылка на картинку",
                  ),
                  controller: imgUrl,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async{ 
                CollectionReference dealsDB = FirebaseFirestore.instance.collection('deal');
                await dealsDB.add(
                  {
                    'title': titleDeal.text.toString(),
                    'discription': descriptionDeal.text.toString(),
                    'image': imgUrl.text.toString(),
                  },
                );
                titleDeal.clear();
                descriptionDeal.clear();
                imgUrl.clear();
                Navigator.pop(context, 'OK');
                },
              child: const Text('OK'),
            ),
          ],
        ),
            ),
          ) : null,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: SizedBox(
            child: BottomNavigationBar(
            backgroundColor: Color.fromARGB(88, 255, 0, 0),
            selectedItemColor: Colors.white,
            currentIndex: index,
            items: const [
              BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: "Список дел"),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.calendar_today,
          //     ),
          //     label: "Календарь"),
              BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard,
              ),
              label: "БД"),
              BottomNavigationBarItem(
              icon: Icon(
                Icons.phone_android,
              ),
              label: "Рабочий стол"),
          ],
          onTap: (value) {
          setState(
            () {
              index = value;
              if (index == 0) {
                title = 'Список дел';
              } 
              else if (index == 1){
                title = "БД";
              }
              else if (index == 2){
                title = "Рабочий стол";
              }
            },
          );
        },
          ),
            )
          
          ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.red,
      //   selectedItemColor: Colors.white,
      //   currentIndex: index,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.list,
      //         ),
      //         label: "Список дел"),
      //     // BottomNavigationBarItem(
      //     //     icon: Icon(
      //     //       Icons.calendar_today,
      //     //     ),
      //     //     label: "Календарь"),
      //         BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.card_giftcard,
      //         ),
      //         label: "Карточки"),
      //         BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.phone_android,
      //         ),
      //         label: "Рабочий стол"),
        // ],
      );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_contact.dart';

class dbPage extends StatefulWidget {
  const dbPage({super.key});

  @override
  State<dbPage> createState() => _dbPageState();
}

dynamic documentFirebase;
bool tittleAppBar = false;
TextEditingController searchController =TextEditingController();
String title = "Список дел";


class _dbPageState extends State<dbPage> {

onItemSearch(String value){
  setState(() {
    
  });


}

  @override
  Widget build(BuildContext context) {
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
       appBar: tittleAppBar ? appBarSearch : appBar,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("deal").snapshots(),
        builder: (context, AsyncSnapshot<dynamic> snapShots) {
          if (!snapShots.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapShots.data.docs.length,
              itemBuilder: (context, index) {
                String str = snapShots.data?.docs[index].get('title');
                if (tittleAppBar){
                  if (str.toLowerCase().contains(searchController.text.toLowerCase())){ 
                    return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: const BorderSide(
        color: Colors.black,
      ),
    ),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tileColor: Colors.blueGrey[100],
      leading: Text((index + 1).toString()),
      title: Text(snapShots.data?.docs[index].get('title')),
      subtitle: Text(snapShots.data?.docs[index].get('discription')),
      trailing: const Icon(
        Icons.arrow_right,
        color: Colors.black,
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text("Выберите действие:"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () async {
                          CollectionReference deal =
                              FirebaseFirestore.instance.collection('deal');
                          await deal.doc(docs.id).delete();
                          Navigator.pop(context);
                        },
                        child: const Text("Удалить")),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => AddDeal(
                                      title: snapShots.data?.docs[index]['title'],
                                      discription: snapShots.data?.docs[index]['discription'],
                                      image: snapShots.data?.docs[index]['image'],
                                      documentFirebase: snapShots.data?.docs[index],
                                    )));
                      },
                      child: const Text("Редактировать"),
                    )
                  ],
                ));
      },
    ),
  );
                  }
                }else{
                   return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: const BorderSide(
        color: Colors.black,
      ),
    ),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tileColor: Colors.blueGrey[100],
      leading: Text((index + 1).toString()),
      title: Text(snapShots.data?.docs[index].get('title')),
      subtitle: Text(snapShots.data?.docs[index].get('discription')),
      trailing: const Icon(
        Icons.arrow_right,
        color: Colors.black,
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text("Выберите действие:"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () async {
                          CollectionReference deal =
                              FirebaseFirestore.instance.collection('deal');
                          await deal.doc(snapShots.data?.docs.id).delete();
                          Navigator.pop(context);
                        },
                        child: const Text("Удалить")),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => AddDeal(
                                      title: snapShots.data?.docs[index]['title'],
                                      discription: snapShots.data?.docs[index]['discription'],
                                      image: snapShots.data?.docs[index]['image'],
                                      documentFirebase: snapShots.data?.docs[index],
                                    )));
                      },
                      child: const Text("Редактировать"),
                    )
                  ],
                ));
      },
    ),
  );
                }
              },
            );
          }
        },
      ),
    );
  }
}

Widget buildList(context, docs, index) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
      side: const BorderSide(
        color: Colors.black,
      ),
    ),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tileColor: Colors.blueGrey[100],
      leading: Text((index + 1).toString()),
      title: Text(docs['title']),
      subtitle: Text(docs['discription']),
      trailing: const Icon(
        Icons.arrow_right,
        color: Colors.black,
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text("Выберите действие:"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () async {
                          CollectionReference deal =
                              FirebaseFirestore.instance.collection('deal');
                          await deal.doc(docs.id).delete();
                          Navigator.pop(context);
                        },
                        child: const Text("Удалить")),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => AddDeal(
                                      title: docs['title'],
                                      discription: docs['discription'],
                                      image: docs['image'],
                                      documentFirebase: docs,
                                    )));
                      },
                      child: const Text("Редактировать"),
                    )
                  ],
                ));
      },
    ),
  );
}

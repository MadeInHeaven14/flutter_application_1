import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/deal.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddDeal extends StatelessWidget {
  dynamic documentFirebase;
  bool? invisible;
  String? title;
  String? discription;
  String? image;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController discriptioncontroller = TextEditingController();
  TextEditingController imagecontroller = TextEditingController();
  Deal deal = Deal();
  AddDeal(
      {Key? key,
      this.title,
      this.discription,
      this.image,
      this.documentFirebase})
      : super(key: key);

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          TextField(
            decoration: InputDecoration(
              label: const Text("Заголовок"),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            controller: titlecontroller,
          ),
          TextField(
            decoration: InputDecoration(
              label: const Text("Описание"),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            controller: discriptioncontroller,
          ),
          TextField(
            decoration: InputDecoration(
              label: const Text("ссылка на картинку"),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            controller: imagecontroller,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          CollectionReference deal =
              FirebaseFirestore.instance.collection('deal');
          await deal.doc(documentFirebase.id).update({
            'title': titlecontroller.text,
            'discription': discriptioncontroller.text,
            'image': imagecontroller.text
          });
          titlecontroller.clear();
          discriptioncontroller.clear();
          imagecontroller.clear();
          Navigator.pop(buildContext);
        },
        ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.black,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.border_color,
      //         color: Colors.yellow,
      //       ),
      //       label: "redaction",
      //     ),
      //   ],
      //   onTap: (value) async {
      //     CollectionReference deal =
      //         FirebaseFirestore.instance.collection('deal');
      //     await deal.doc(documentFirebase.id).update({
      //       'title': titlecontroller.text,
      //       'discription': discriptioncontroller.text,
      //       'image': imagecontroller.text
      //     });
      //     titlecontroller.clear();
      //     discriptioncontroller.clear();
      //     imagecontroller.clear();
      //     Navigator.pop(buildContext);
      //   },
      // ),
    );
  }
}

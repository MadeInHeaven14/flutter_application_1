

import 'package:flutter/material.dart';

class DealPage extends StatelessWidget{
  const DealPage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: dealList.map(
        (e) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              tileColor: Colors.blueGrey[100],
              leading: Text(
                e.id.toString(),
              ),
              title: Text(e.title!),
              subtitle: Text(e.discription!),
              trailing: const Icon(
                Icons.arrow_right,
                color: Colors.black,
              ),
              onTap: () {},
            ),
          );
        },
      ).toList(),
    );
  }
}

class Deal {
  int? id;
  String? title;
  String? discription;
  String? image;
  Deal({this.id, this.title, this.discription});
}

List<Deal> dealList = [
  Deal(
    id: 1,
    title: 'Unity',
    discription: 'Доделать гонки на unity',
  ),
  Deal(
    id: 2,
    title: 'Flutter',
    discription: 'Доделать календарь',
  ),
  Deal(
    id: 3,
    title: 'Dota 2',
    discription: 'Апнуть ранг "Рыцарь"',
  ),
  Deal(
    id: 4,
    title: 'Тестирование',
    discription: 'Доделать 6-ю практическую работу',
  ),
];

List<Deal> dealList2 = [
  Deal(
    id: 1,
    title: 'abc',
    discription: 'abc',
  ),
  Deal(
    id: 2,
    title: 'abc',
    discription: 'abc',
  ),
  Deal(
    id: 3,
    title: 'abc',
    discription: 'abc',
  ),
];

List<Deal> dealList3 = [
  Deal(
    id: 1,
    title: '',
    discription: '',
  ),
  Deal(
    id: 2,
    title: '',
    discription: '',
  ),
  Deal(
    id: 3,
    title: '',
    discription: '',
  ),
  Deal(
    id: 4,
    title: '',
    discription: '',
  ),
];

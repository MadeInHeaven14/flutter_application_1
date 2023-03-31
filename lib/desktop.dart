import 'package:flutter/material.dart';
import 'deal.dart';

class DesktopPage extends StatelessWidget {
  const DesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          SizedBox(
            height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
        children: dealList3.map(
          (deal) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.red,
                ),
              ),
              child: SizedBox(child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Colors.red,
                leading: Text(
                  deal.id.toString(), style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)
                ),
                title: Text(deal.title!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)),
                subtitle: Text(deal.discription!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {},
              ), width: 88,
              ), 
            );
          },
        ).toList(),
      ),
          ),
        SizedBox(
          height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
        children: dealList3.map(
          (deal) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.red,
                ),
              ),
              child: SizedBox(child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Colors.red,
                leading: Text(
                  deal.id.toString(), style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)
                ),
                title: Text(deal.title!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)),
                subtitle: Text(deal.discription!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {},
              ), width: 88,
              ), 
            );
          },
        ).toList(),
      ),
          ),
          SizedBox(
            height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
        children: dealList3.map(
          (deal) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.red,
                ),
              ),
              child: SizedBox(child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Colors.red,
                leading: Text(
                  deal.id.toString(), style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)
                ),
                title: Text(deal.title!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)),
                subtitle: Text(deal.discription!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {},
              ), width: 88,
              ), 
            );
          },
        ).toList(),
      ),
          ),
          SizedBox(
            height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
        children: dealList3.map(
          (deal) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.red,
                ),
              ),
              child: SizedBox(child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Colors.red,
                leading: Text(
                  deal.id.toString(), style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)
                ),
                title: Text(deal.title!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)),
                subtitle: Text(deal.discription!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {},
              ), width: 88,
              ), 
            );
          },
        ).toList(),
      ),
          ),
          SizedBox(
            height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
        children: dealList3.map(
          (deal) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.red,
                ),
              ),
              child: SizedBox(child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Colors.red,
                leading: Text(
                  deal.id.toString(), style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)
                ),
                title: Text(deal.title!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)),
                subtitle: Text(deal.discription!, style: TextStyle(color: Colors.white, fontFamily: "IMFellGreatPrimerSC-Regular", fontSize: 16)),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onTap: () {},
              ), width: 88,
              ), 
            );
          },
        ).toList(),
      ),
          ),
          ],
      ),) 
      );
  }
}


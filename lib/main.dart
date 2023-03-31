import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/landing.dart';
import 'package:flutter_application_1/services/services.dart';
import 'package:provider/provider.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ClownMobileApp());
}

class ClownMobileApp extends StatelessWidget{
  const ClownMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(value: DbConnection().currentUser, 
    initialData: null,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AuthPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandnigPage(),
        '/home': (context) => const HomePage(),
      },
    )
    );
     
  }
}


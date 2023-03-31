import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/model.dart';
import 'package:flutter_application_1/services/services.dart';

import 'home.dart';

  TextEditingController  Email = TextEditingController();
  TextEditingController  Password = TextEditingController();
  bool sign = false;
  DbConnection dbConnection = DbConnection();

    
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Clown Mobile ", style: TextStyle(fontSize: 30, color: Colors.red)),
                  Image.asset("Images/scaredClown.png")
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: Email,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    label: const Text("Email", selectionColor: Colors.red,),
                    labelStyle: const TextStyle(color: Colors.red),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red)
                    ),
                    prefixIcon: const Icon(Icons.email, color: Colors.amber),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: Password,
                  obscureText: true,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    label: const Text("Password", selectionColor: Colors.red,),
                    labelStyle: const TextStyle(color: Colors.red),
                    // hintText: "email",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.red)
                    ),
                    prefixIcon: const Icon(Icons.apps, color: Colors.amber),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )
                    )),
                    backgroundColor: MaterialStatePropertyAll(Colors.red)
                  ),
                  onPressed: () async {
                    if (sign == false) {
                        UserModel? user = await dbConnection.signIn(
                            Email.text, Password.text);
                        if (user != null) {
                          // Navigator.popAndPushNamed(context, '/home');
                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        } else {}
                      } else {
                        UserModel? user = await dbConnection.signUp(Email.text, Password.text);
                        if (user!=null) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        } else {
                          
                        }
                      }
                  }, 
                  child: sign == false
                        ? const Text("Sign In")
                        : const Text("Sign Up"),
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              InkWell(
                child: sign == false
                      ? const Text(
                          "Sign Up?",
                          style: TextStyle(color: Colors.black54),
                        )
                      : const Text("Sign In"),
                  onTap: () {
                    setState((){
                      sign = !sign;
                    });
                  },
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      sign = !sign;
                    });
                  },
                  child: Text(
                    "Sign In?",
                    style: TextStyle(
                        color: Color.fromARGB(170, 255, 255, 255),
                        fontFamily: "IMFellGreatPrimerSC-Regular",
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
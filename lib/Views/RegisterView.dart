import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterView extends StatelessWidget{

  TextEditingController tecUser=TextEditingController();
  TextEditingController tecPass=TextEditingController();

  void clickSobreRegister(BuildContext context) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: tecUser.text,
          password: tecPass.text
      );
   Navigator.of(context).pushNamed("/homeview");

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void clickCancel(BuildContext context){
    Navigator.of(context).pushNamed("/loginview");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("REGISTRAR PROYECTO1"),
          TextFormField(controller: tecUser,
            decoration: const InputDecoration(
              labelText: 'Enter your usernane',
              border: OutlineInputBorder(),
            ),
          ),
          TextFormField(controller: tecPass,
            decoration: const InputDecoration(
              labelText: 'Enter your password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          TextFormField(controller: tecPass,
            decoration: const InputDecoration(
              labelText: 'ReEnter your password',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(Icons.check),
                onPressed: (){clickSobreRegister(context);}
              ),
              IconButton(
                icon: const FaIcon(Icons.back_hand),
                onPressed: (){clickCancel(context);}
              )
            ],
          )
        ],
      ),
    );
  }

}
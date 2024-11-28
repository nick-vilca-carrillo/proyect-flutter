import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget{

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  double dbPorcentaje=0.0;
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading();
  }

  void loading() async{

    while (dbPorcentaje <= 1.0){
      print('Valor actual: $dbPorcentaje');
      setState(() {
        dbPorcentaje += 0.05;
      });
      await Future.delayed(Duration(microseconds: 50));
    }
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };

// Add a new document with a generated ID

    /*db.collection("users").add(user).then((DocumentReference doc) {
        print('DocumentSnapshot added with ID: ${doc.id}');
    });*/

  if(FirebaseAuth.instance.currentUser!=null){
    db.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set(user);
    Navigator.of(context).pushNamed("/homeview");
  }else{
    Navigator.of(context).pushNamed("/loginview");
  }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("BIENVENIDO A MI APP"),
        LinearProgressIndicator(value: dbPorcentaje,),
        Text("${dbPorcentaje*100}%"),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int iContador=0;
  bool blVisible=true;

  void clickDelBotonDeIcono(){
    setState(() {
      iContador++;
      blVisible=!blVisible;

    });
    print("valor del contador $iContador");
  }

  Widget pintadoComoJava(){
  Text miTexto = Text("Hola mundo");
  Text miTexto1 = Text("Hola");
  Text miTexto2 = Text("mundo");

  TextButton btn1=TextButton(onPressed: (){}, child: Text("Btn1"));
  TextButton btn2=TextButton(onPressed: (){}, child: Text("Btn2"));
  Row row = Row(children: [btn1,btn2],mainAxisAlignment: MainAxisAlignment.center,);
  Column column= Column(children: [miTexto,miTexto1,miTexto2,row],);

  return column;
}

Widget pintadoComoFlutter(BuildContext context){


  return Scaffold(
    appBar: AppBar(title: Text("MI PRIMERA APP"),backgroundColor: Colors.amber,),
    body: Column(
      children: [
        blVisible ? const Text("hola mundo"):const Text("Hasta luego mundo"),
        const Text("hola"),
        const Text("mundo"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){}, child: const Text("Btn1")),
            TextButton(onPressed: (){}, child: const Text("Btn2")),
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.gamepad),
                onPressed: clickDelBotonDeIcono
            ),
          ],
        ),
        const Text("Contador de clicks",style: TextStyle(fontSize: 30,color: Colors.green)),
        Text("C:$iContador",style: TextStyle(fontSize: 30)),
      ],
    ),
    floatingActionButton: IconButton(onPressed: (){
      Navigator.of(context).pushNamed("mainview");
    }, icon: const FaIcon(FontAwesomeIcons.airbnb)),
  );
}

@override
Widget build(BuildContext context) {
  return pintadoComoFlutter(context);
}
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //Widgets aqui!
      home: Scaffold(
        //AppBar
        appBar: AppBar(
          title: Text("Nome do Aplicativo"),
          backgroundColor: Colors.deepPurple,
          ),
          //Body
          body: Center(child: Text("Este é o corpo do Scaffold, seja bem-vindo.")),
          backgroundColor: Colors.grey,
          //Drawer
          drawer: Drawer(
            child: ListView(children: [Text('Opção 1'), Text('Opção 2')]),
          ),


      ),
      );
  }
}

// ignore_for_file: avoid_print, non_constant_identifier_names, unnecessary_this, prefer_const_constructors, file_names, camel_case_types, unused_local_variable

import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {

    final name = ModalRoute.of(context)!.settings.arguments;

    return  Scaffold(

        backgroundColor: Colors.amber[200],

        appBar: AppBar(

          backgroundColor: Colors.amber[600],

          elevation: 1,

          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(50, 10))),

          leading: const IconButton(
              icon: Icon(Icons.person),
              onPressed: _Funcion_Prueba, 
            ),

          actions: const <Widget> [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: _Funcion_Prueba, 
            ),

          ],

          title: const Text('UniFood'),
        ),

        // Hacer Scroll y listas
        body: ListView(
          children: <Widget> [
            Card(
              child: Image.network("https://quantosanos.com.br/wp-content/uploads/2022/08/idade-do-luffy-scaled.jpg"),
            ),
            Text("data")
          ],
        ),

      );
  }
}

// ignore: must_be_immutable
class ListaInfinita extends StatelessWidget {
  ListaInfinita({super.key});

  // Definimos variable
  List<String> names = ["Francisco", "Yasser"];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        backgroundColor: Colors.amber[200],

        appBar: AppBar(

          backgroundColor: Colors.amber[600],

          elevation: 1,

          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(50, 10))),

          leading: const IconButton(
              icon: Icon(Icons.person),
              onPressed: _Funcion_Prueba, 
            ),

          actions: const <Widget> [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: _Funcion_Prueba, 
            ),

          ],

          title: const Text('UniFood'),
        ),

        //Lista infinita
        
        body: ListView.builder(

          // Se ve la longitud de la lista
          itemCount: names.length,
          itemBuilder: (BuildContext context, int index) {
            // Tomamos la variable para recorrerla
            final name = names[index];
            
            
            // recorremos un listado e imprimirmos en consola si lo presionamos
            return ListTile(
              title: Text("hola $name"), 
              leading: const Icon(Icons.person),
              onTap: () {
                print("adios $name");
              },
            );
            
            /*
            return Card(
              child: Column(
                children: [
                Text(name),
                Image.network("https://quantosanos.com.br/wp-content/uploads/2022/08/idade-do-luffy-scaled.jpg",
                height: 200,
                ),
                ],
              ),
            );
            */
          },
        ),

      );
  }
}

void _Funcion_Prueba() {
  print("holiswis funcion");
}
// ignore_for_file: avoid_print, non_constant_identifier_names, unnecessary_this, prefer_const_constructors, file_names, camel_case_types

import 'package:flutter/material.dart';


class Pruebas_1 extends StatefulWidget {
  const Pruebas_1({super.key});

  @override
  State<Pruebas_1> createState() => _Pruebas_1State();
}

class _Pruebas_1State extends State<Pruebas_1> {
  bool opcion_1 = false;
  bool opcion_2 = false;

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

        body: SizedBox(
          width: double.infinity,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start, // Alinear al centro arriba - abajo
            crossAxisAlignment: CrossAxisAlignment.center, // Alinear al centro izquierda - derecha

            children: <Widget> [

              const Padding(padding: EdgeInsets.only(top: 20)),
              
              // Textos
              const Text(
                'Hola mundo visible',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontFamily: "TheMarioKat",
                ),
              ),

              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  _showPruebas_2(context);
                },
                child: const Text(
                  'Siguiente Pantalla',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

              // Imagenes En linea y local
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Internet
                  Column(
                    children: [
                      const Text(
                        "Internet",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "TheKat",
                        ),
                      ),
                      Image.network(
                        "https://quantosanos.com.br/wp-content/uploads/2022/08/idade-do-luffy-scaled.jpg",
                        //color: Colors.white,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  // Local
                  Column(
                    children: [
                      const Text(
                        "Local",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: "TheKat",
                        ),
                      ),
                      Image.asset(
                        "assets/images/logo.png",
                        width: 100,
                      ),
                    ],
                  ),
                ],
              ),
              
              // Iconos normales y tipo boton
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lunch_dining,
                    color: Colors.green,
                    size: 80,
                  ),
                  IconButton(
                    iconSize: 80,
                    color: Colors.green,
                    icon: const Icon(Icons.verified_user),
                    onPressed: (){
                      print("hola mundito invisible");
                    },
                  ),
                ],
              ),

              // Container con cosas dentro
              Container(
                color: Colors.green[200],
                width: 300,
                height: 170,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),

                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: <Widget> [
                      const Text("Soy un cuadro",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      
                      Row(
                        children: [
                          const Text("Opcion 1",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w200,
                              color: Colors.red,
                            ),
                          ),
                          const Icon(Icons.home),
                          Switch(
                            value: opcion_1, 
                            onChanged: (value) {
                              setState(() {
                                this.opcion_1 = value;
                              });
                            },
                          ),
                        ],
                      ),

                      const Divider(),

                      Row(
                        children: [
                          const Expanded( // Expanded hace que tome todo el espacio disponible
                            child: Text("Opcion 2",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w200,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          const Icon(Icons.home),
                          Switch(
                            value: opcion_2, 
                            onChanged: (value) {
                              setState(() {
                                this.opcion_2 = value;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              const Divider(),

              // Tipo FlexBox
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget> [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.lime[700],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.black,
                  ),
                  Container(
                    width: 50,
                    height: 75,
                    color: Colors.green[500],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red[700],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.teal[300],
                  ),
                ],
              ),

              const Divider(),

              // Margenes (Fuera del Container) y Paddings (Dentro del Container)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,

                    margin: const EdgeInsets.all(10), //only(top: (10)),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),

                    child: const Text(
                      "----",
                      style: TextStyle(backgroundColor: Colors.amber, fontSize: 50 ),
                    ),
                  ),
                ],
              ),

              // Color Especifico
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue[200],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: const Color(0xff1DD1FE).withOpacity(0.5), //0xff y Hexadecimal
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: const Color.fromRGBO(29, 209, 254, 0.5), // Red / Blue / Green / Opacity
                  ),
                ],
              ),

            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.remove),
          onPressed: () {
            print("Soy un boton flotante");
          },
        ),

        drawer: Drawer(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.orange,
                    margin: const EdgeInsets.only(top: (100)),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    margin: const EdgeInsets.only(left: (20)),
                  ),
                ],
              ),
            ],
            ),
        ),

        endDrawer: const Drawer(),

      );
  }
  
  void _showPruebas_2(BuildContext context) {
    Navigator.of(context).pushNamed("/P_2", arguments: "Fran gay");
    /* 
    final route = MaterialPageRoute(builder: (BuildContext context){
      return Pruebas_2(
        name: "Fran",
      );
    });
    Navigator.of(context).push(route);
    */
  }
}

void _Funcion_Prueba() {
  print("holiswis funcion");
}
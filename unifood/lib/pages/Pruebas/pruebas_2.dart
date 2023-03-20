// ignore_for_file: avoid_print, non_constant_identifier_names, unnecessary_this, prefer_const_constructors, file_names, camel_case_types, unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';

class Pruebas_2 extends StatefulWidget {
  const Pruebas_2({super.key});

  @override
  State<Pruebas_2> createState() => _Pruebas_2State();
}

class _Pruebas_2State extends State<Pruebas_2> {

  String name = "Fran";
  double progressValue = 0.0;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {

    final name = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget> [

            Text(
              this.name,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.orange,
              ),
            ),

            LinearProgressIndicator(
              value: progressValue,
            ),

            TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  _showPruebas_3(context);
                },
                child: const Text(
                  'Siguiente Pantalla',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),

            Switch(
              value: switchValue,
              onChanged: (value) {
                setState((){
                  this.switchValue = value;
                });
              },
            ),

            // Meto el WIDGET PERSONAL
            GD_Personal(),
            GD_Personal(),

            // Botones
            /*
            RaisedButtom( // Ya no funciona
              color: Colors.green,
              textColor: Colors.white,
              child: Text("RaisedButtom"),
              onPressed: _onPressBtn1,
            ),
            */

            // Te da un color y elevacion
            ElevatedButton(
              onPressed: _onPressBtn1,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
                ),
                side: const BorderSide(
                  color: Colors.red,
                  width: 3,
                ),
              ),
              child: const Text('ElevatedButton / RaisedButton'),
            ),

            /*
            FlatButton( // Ya no sirve
              child: Text("FlatButton"),
              onPressed: _onPressBtn2(),
            ),
            */

            // No tiene color hasta presionar, se puede poner color
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
                //backgroundColor: Colors.amber,
              ),
              onPressed: _onPressBtn2,
              child: const Text('TextButton / FlatButton'),
            ),

            // Un icono
            IconButton(
              onPressed: _onPressBtn3,
              icon: Icon(Icons.home),
            ),

            // Te da borde, y puedes agregar color
            OutlinedButton(
              onPressed: _onPressBtn4,
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.amber,
              ),
              child: Text("FlatButton"),
            ),

          ],
        )
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: changedName,
        child: const Icon(Icons.refresh)
      ),
    );
  }

  void changedName(){
    /*setState(() {
      if(name == "Fran") {
      name = "Yasser";
      }
      else {
        name = "Fran";
      }
      progressValue +=  0.1;

      if(progressValue >= 1){
        progressValue = 0;
      }
    });*/
  }


  @override
  void initState() {
    // TO_DO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (value){
      changedName();
    });
  }
  
  @override
  void dispose() {
    // TO_DO: implement dispose
    super.dispose();
  }


  void _onPressBtn1() {
    print("Boton 1");
  }
  void _onPressBtn2() {
    print("Boton 2");
  }
  void _onPressBtn3() {
    print("Boton 3");
  }
  void _onPressBtn4() {
    print("Boton 4");
  }
  
  void _showPruebas_3(BuildContext context) {
    Navigator.of(context).pushNamed("/P_3",arguments: "Fran NO es gay");
  }
}

// Creamos Widget PROPIO de Gesture
class GD_Personal extends StatelessWidget {
  const GD_Personal({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // InkWell es igual pero se ve que se presiona
      onTap: _onTap,
      onLongPress: _onLongPress,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: const <Widget> [
            Icon(Icons.folder),
            SizedBox(
              width: 20,
            ),
            Text("Mis Videos"),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    print("has presionado");
  }

  void _onLongPress() {
    print("has dejado presionado");
  }
}

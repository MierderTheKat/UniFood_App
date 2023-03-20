// ignore_for_file: prefer_const_constructors, avoid_print, camel_case_types, unused_import

import 'package:flutter/material.dart';

import '../Global/routes.dart';

class LoginPage_NormalForm extends StatefulWidget {
  const LoginPage_NormalForm({super.key});

  @override
  State<LoginPage_NormalForm> createState() => _LoginPage_NormalFormState();
}

class _LoginPage_NormalFormState extends State<LoginPage_NormalForm> {

  late TextEditingController nameTextController;
  late TextEditingController lastNameTextController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.amber[200],

      appBar: AppBar(
          backgroundColor: Colors.amber[600],
          elevation: 1,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(50, 10))),
        ),

      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(45),
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [

              Image.asset(
                "assets/images/logo.png",
                scale: .25,
              ),

              Divider(
                color: Colors.white,
                height: 50.0,
                thickness: 5,
              ),

              Container(
                color: Colors.red[200],
                height: 300,

                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget> [
                      TextField(
                        decoration: InputDecoration(labelText: "Nombre:"),
                        controller: nameTextController,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: "Apellido:"),
                        controller: lastNameTextController,
                      ),

                      Divider(
                        color: Colors.transparent,
                        height: 20.0,
                      ),

                      ElevatedButton(
                        onPressed: () {
                          // Destruye la ruta anterior y no puedes regresar
                          // Navigator.pushReplacementNamed(context, "/home");
                          // Navigator.of(context).pushReplacementNamed("/home",
                          Navigator.of(context).pushNamed("/home",
                            //arguments: HomePageArguments("ola", "No"),
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                        ),
                        child: Column(
                          children: const [
                            Text('Ingresar'),
                        ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text("¿No tienes una cuenta?"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(nameTextController.text);
                      print(lastNameTextController.text);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      textStyle: const TextStyle(fontSize: 15),
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                    ),
                    child: Text("¡Regístrate!")
                  )
                ],
              )

            ],
          ),
        ),
      ),

      


    );
  }

  @override
  void initState() {
    // TO.DO: implement initState
    super.initState();

    nameTextController = TextEditingController();
    lastNameTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TO.DO: implement dispose
    super.dispose();

    nameTextController.dispose();
    lastNameTextController.dispose();
  }

}
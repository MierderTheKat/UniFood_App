// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_this, unused_import, unuseCafeProfilePaged_element

import '../Global/routes.dart';

class CafeProfilePage extends StatefulWidget {
  const CafeProfilePage({super.key});

  @override
  State<CafeProfilePage> createState() => _CafeProfilePageState();
}

class _CafeProfilePageState extends State<CafeProfilePage> {

  String matriculaValue = "1234567890";
  String nombreValue = "Juanito Perez Mendez Salas";
  String contrasenaValue = "12345";
  String correoValue = "juanito.perez.is@unipolidgo.edu.mx";

  late TextEditingController matriculaTextController = TextEditingController(text: matriculaValue);
  late TextEditingController nombreTextController = TextEditingController(text: nombreValue);
  late TextEditingController contrasenaTextController;
  late TextEditingController correoTextController;
  late TextEditingController imageFileController;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(color_6),

      appBar: AppBar(
        backgroundColor: Color(color_1),
        elevation: 1,
        
        leading: IconButton(
              onPressed: _onPressBtnUser,
              icon: const Icon(Icons.person),
              iconSize: 40,
              color: Color(color_2),
            ),
            
        actions: <Widget> [
          IconButton(
            onPressed: _onPressBtnCalendar,
            icon: const Icon(Icons.calendar_month),
            iconSize: 40,
            color: Color(color_2),
          ),
        ],
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo_global.png",
              width: 200,
            ),
          ],
        ),
      ),

      body: Center(
        child: ListView(
          shrinkWrap: false,
          padding: const EdgeInsets.only(right: 20, left: 20, top: 100),
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Card_PerfilPhoto(),

                  Divider(
                    color: Color(color_5),
                    height: 50,
                    thickness: 2,
                  ),

                  Column(
                    children: [
                      
                      TextFormField(
                        //controller: matriculaTextController,
                        initialValue: matriculaValue,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Matrícula",
                          hintText: '1234567890',
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        onSaved: (value) {
                          matriculaValue = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "¡Debe llenar este campo!";
                          } else if (value.length != 10) {
                            return "¡Debe tener 10 caracteres!";
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        //controller: nombreTextController,
                        initialValue: nombreValue,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Nombre",
                          hintText: 'Yasser Alvarez Espera',
                        ),
                        keyboardType: TextInputType.name,
                        onSaved: (value) {
                          nombreValue = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "¡Debe llenar este campo!";
                          }
                          return null;
                        },
                      ),

                      Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),

                      TextFormField(
                        //controller: contrasenaTextController,
                        initialValue: contrasenaValue,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Contraseña"
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        obscuringCharacter: '●',
                        onSaved: (value) {
                          contrasenaValue = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "¡Debe llenar este campo!";
                          }
                          return null;
                        },
                      ),

                      Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),

                      TextFormField(
                        //controller: correoTextController,
                        initialValue: correoValue,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Correo Electrónico",
                          hintText: 'nombre.apellido.is@unipolidgo.edu.mx',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          correoValue = value!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "¡Debe llenar este campo!";
                          }
                          return null;
                        },
                      ),
                    ]
                  ),

                ],
              ),
            ),
            
            Divider(color: Colors.transparent),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _onPressBtnCancel,
                  style: TextButton.styleFrom(
                    foregroundColor: Color(color_4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Color(color_5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Column(
                    children: const [
                      Text('Cancelar'),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: _onPressBtnSave,
                  style: TextButton.styleFrom(
                    foregroundColor: Color(color_4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Color(color_7),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Column(
                    children: const [
                      Text('Guardar'),
                    ],
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    
      bottomNavigationBar: BottomAppBar(
        color: Color(color_1),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              IconButton(
                onPressed: _onPressBtnHome,
                icon: const Icon(Icons.home),
                color: Color(color_2),
                iconSize: 40,
              ),
              IconButton(
                onPressed: _onPressBtnCrud,
                icon: const Icon(Icons.restaurant),
                color: Color(color_2),
                iconSize: 40,
              ),
              IconButton(
                onPressed: _onPressBtnPedidos,
                icon: const Icon(Icons.edit_document),
                color: Color(color_2),
                iconSize: 40,
              ),
            ],
          ),
          
        ),
      ),
    
    );
  }


  void _onPressBtnCancel() {
    print("Boton Cancel");
    setState(() {
      matriculaValue = "1234567890";
      nombreValue = "Juanito Perez Mendez Salas";
      contrasenaValue = "12345";
      correoValue = "juanito.perez.is@unipolidgo.edu.mx";
    });
  }
  void _onPressBtnSave() {
    print("Boton Guardar");
  }

  void _onPressBtnUser() {
    print("Boton User Cafe");
  }
  void _onPressBtnCalendar() {
    print("Boton Calendario Cafe");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_calendar");
  }
  void _onPressBtnHome() {
    print("Boton Home Cafe");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_home");
  }
  void _onPressBtnCrud() {
    print("Boton CRUD Cafe");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_crud");
  }
  void _onPressBtnPedidos() {
    print("Boton Pedidos Cafe");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_order");
  }

  @override
  void initState() {
    // TO.DO: implement initState
    super.initState();

    matriculaTextController = TextEditingController();
    nombreTextController = TextEditingController();
    contrasenaTextController = TextEditingController();
    correoTextController = TextEditingController();
    imageFileController = TextEditingController();
  }

  @override
  void dispose() {
    // TO.DO: implement dispose
    super.dispose();

    matriculaTextController.dispose();
    nombreTextController.dispose();
    contrasenaTextController.dispose();
    correoTextController.dispose();
    imageFileController.dispose();
  }
}
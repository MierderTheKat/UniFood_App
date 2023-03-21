// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_this, unused_import, unused_element

import 'Global/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String matriculaValue = "";
  String nombreValue = "";
  String contrasenaValue = "";
  String correoValue = "";

  late TextEditingController matriculaTextController;
  late TextEditingController nombreTextController;
  late TextEditingController contrasenaTextController;
  late TextEditingController correoTextController;
  late TextEditingController imageFileController;

  final _formKey = GlobalKey<FormState>();
/*
  bool _isClicked = false;
  File? _image;

  options(context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          contentPadding: EdgeInsets.all(10),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          content: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    _image_('camera');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    backgroundColor: Color(color_8),
                    foregroundColor: Color(color_4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.cameraRetro,
                    size: 30,
                  ),
                ),
                VerticalDivider(),
                TextButton(
                  onPressed: () {
                    _image_('gallery');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    backgroundColor: Color(color_8),
                    foregroundColor: Color(color_4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.image,
                    size: 30,
                  ),
                ),
              ],
            )
          ),
        );
      }
    );
  }

  Future _image_(String source) async {
    try{
      final image;
      if(source == 'gallery'){
        image = await ImagePicker().pickImage(source: ImageSource.gallery);
      }
      else{
        image = await ImagePicker().pickImage(source: ImageSource.camera);
      }
      if (image == null) return;
      setState(() {
        _image = File(image.path);
      } );
    }
    on PlatformException catch (e) {
      print(e);
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Color(color_6),
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

/*
                  Stack(
                    children: [
                      Container(width: 280),
                      //Boton inicial
                      Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: 
                        _image == null
                          ? TextButton(
                            onPressed: () {
                              setState(() {
                                _isClicked = !_isClicked;
                              });
                            },
                            style: TextButton.styleFrom(                          
                              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                              backgroundColor: Color(color_5),
                              foregroundColor: Color(color_4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                              ),
                            ),
                            child: FaIcon(
                                FontAwesomeIcons.solidUser,
                                size: 150,
                              )
                          )
                          : TextButton(
                            onPressed: () {
                              setState(() {
                                _isClicked = !_isClicked;
                              });
                            },
                            style: TextButton.styleFrom(                          
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                              backgroundColor: Color(color_5),
                              foregroundColor: Color(color_4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                              ),
                            ),
                            child:  Container(
                              width: 162,
                              height: 165,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(_image!),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(color_5)
                              ),
                            ),
                          ),
                      ),
                      //Botones emergentes
                      _isClicked ? Positioned(
                        top: 5,
                        left: 210,
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isClicked = !_isClicked;
                                });
                                _image_('camera');
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                backgroundColor: Color(color_8),
                                foregroundColor: Color(color_4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)
                                ),
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.cameraRetro,
                                size: 30,
                              ),
                            ),
                            Divider(),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isClicked = !_isClicked;
                                });
                                _image_('gallery');
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                backgroundColor: Color(color_8),
                                foregroundColor: Color(color_4),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)
                                ),
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.image,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      )
                      : const SizedBox.shrink(),
                    ],
                  ),
*/
                  Divider(
                    color: Color(color_5),
                    height: 50,
                    thickness: 2,
                  ),

                  Column(
                    children: [
                      
                      TextFormField(
                        controller: matriculaTextController,
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
                        controller: nombreTextController,
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
                        controller: contrasenaTextController,
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
                        controller: correoTextController,
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                  onPressed: () {
                    _register(context);
                  },
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
          
          // otro
          /*
            Column(
              children: [
                Divider(),
                Divider(),
                ElevatedButton(
                  onPressed: () {
                    options(context);
                  },
                  child: Text('MODAL'),
                ),

                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print('Imagen del dispositivo: $_image');
                    }
                  },
                  child: Text('Guardar'),
                ),
              ],
            )
            */

          ],
        ),
      ),
    );
  }

  void _register(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      // Destruye la ruta anterior y no puedes regresar
      // Navigator.pushReplacementNamed(context, "/home");
      // Navigator.of(context).pushReplacementNamed("/home",
      Navigator.pop(context);
      Navigator.of(context).pushNamed(
        "/login",
        //arguments: HomePageArguments("ola", "No"),
      );
    }
    print(matriculaTextController.text);
    print(nombreTextController.text);
    print(contrasenaTextController.text);
    print(correoTextController.text);
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

// menu emergente inferior
/*

options(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return SizedBox(
          height: 150,
          child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text('Tomar una foto',style: TextStyle(fontSize: 16),)
                          ),
                          Icon(Icons.camera_alt,color: Colors.blue,)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ),
        );
      }
    );
  }


*/


// Botones de foto e imagen
/*
                  TextButton(
                    onPressed: () {
                      options(context);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                      backgroundColor: Color(color_8),
                      foregroundColor: Color(color_4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.solidUser,
                      size: 90,
                    ),
                  ),


                  TextButton(
                    onPressed: () {
                      _image_('camera');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      backgroundColor: Color(color_8),
                      foregroundColor: Color(color_4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                      ),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.cameraRetro,
                      size: 30,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      _image_('gallery');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      backgroundColor: Color(color_8),
                      foregroundColor: Color(color_4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                      ),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.image,
                      size: 30,
                    ),
                  ),

*/





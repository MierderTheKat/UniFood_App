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
  
  bool _isClicked = false;
  File? _image;

  Future _image_(String source) async {
    try{
      // ignore: prefer_typing_uninitialized_variables
      final image;
      if(source == 'gallery'){
        image = await ImagePicker().pickImage(source: ImageSource.gallery);
      }
      else{
        image = await ImagePicker().pickImage(source: ImageSource.camera);
      }
      if (image == null) return;
      setState(() {
        //_image = File(image.path);
        _cropImage(File(image.path));
      } );
    }
    on PlatformException catch (e) {
      print(e);
    }
  }

  _cropImage(File image) async {

    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0)
    );
    if(croppedImage == null) return null;
    setState(() {
        _image = File(croppedImage.path);
    });
  }

  TextEditingController matriculaTextController = TextEditingController(text: "");
  TextEditingController nombreTextController = TextEditingController(text: "");
  TextEditingController contrasenaTextController = TextEditingController(text: "");
  TextEditingController correoTextController = TextEditingController(text: "");
  TextEditingController imageFileController = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();

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
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Stack(
                        children: [
                          Container(width: 280),
                          //Boton inicial
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child:
                            _image == null
                              ? TextButton(
                                onPressed: () {
                                  setState(() {
                                    _isClicked = !_isClicked;
                                  });
                                },
                                style: TextButton.styleFrom(                          
                                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                                  backgroundColor: Color(color_5),
                                  foregroundColor: Color(color_4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)
                                  ),
                                ),
                                child: const FaIcon(
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
                                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                    backgroundColor: Color(color_8),
                                    foregroundColor: Color(color_4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)
                                    ),
                                  ),
                                  child: const FaIcon(
                                    FontAwesomeIcons.cameraRetro,
                                    size: 30,
                                  ),
                                ),
                                const Divider(),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isClicked = !_isClicked;
                                    });
                                    _image_('gallery');
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                    backgroundColor: Color(color_8),
                                    foregroundColor: Color(color_4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)
                                    ),
                                  ),
                                  child: const FaIcon(
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
                              hintText: '2003151209',
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

                          Divider(
                            color: Colors.transparent,
                            height: 10,
                          ),

                          TextFormField(
                            controller: nombreTextController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Nombre",
                              hintText: 'Juan Rulfo Esqueda Salazar',
                            ),
                            maxLength: 40,
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
                            height: 10,
                          ),

                          TextFormField(
                            controller: contrasenaTextController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Contraseña",
                              hintText: 'C0ntr45ena!',
                            ),
                            maxLength: 20,
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
                            height: 10,
                          ),

                          TextFormField(
                            controller: correoTextController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Correo Electrónico",
                              hintText: 'nombre.apellido.is@unipolidgo.edu.mx',
                            ),
                            maxLength: 50,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              correoValue = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "¡Debe llenar este campo!";
                              } if (!RegExp(r'\S+\.\S+@unipolidgo.edu.mx').hasMatch(value)) {
                                return 'Ingrese un email válido';
                              }
                              return null;
                            },
                          ),

                        ]
                      ),


                    ],
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
                        onPressed: () async {
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

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      if(_image != null){
        await saveUser(
          int.parse(matriculaTextController.text),
          nombreTextController.text,
          contrasenaTextController.text,
          correoTextController.text,
          _image!
        ).then((value) {
          if(value=='Agregando usuario'){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Center(child: Text(value))),
            );
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Center(child: Text(value))),
            );
          }
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Center(child: Text('Sube una imagen'))),
        );
      }
    }
  }

  @override
  void initState() {
    // TO.DO: implement initState
    super.initState();
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

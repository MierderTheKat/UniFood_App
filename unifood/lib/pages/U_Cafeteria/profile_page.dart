// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_this, unused_import, unuseCafeProfilePaged_element

import '../Global/routes.dart';

class CafeProfilePage extends StatefulWidget {
  const CafeProfilePage({super.key});

  @override
  State<CafeProfilePage> createState() => _CafeProfilePageState();
}

class _CafeProfilePageState extends State<CafeProfilePage> {

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

    Map userArg = ModalRoute.of(context)!.settings.arguments as Map;

    matriculaTextController.text = userArg['user']['matricula'].toString();
    nombreTextController.text = userArg['user']['nombre'];
    contrasenaTextController.text = userArg['user']['contrasena'];
    correoTextController.text = userArg['user']['correo'];
    imageFileController.text = userArg['user']['imagen'];

    return Scaffold(
      backgroundColor: Color(color_6),

      appBar: AppBar(
          backgroundColor: Color(color_1),
          elevation: 1,
          
          leading: IconButton(
                onPressed: (){
                  _onPressBtnUser(userArg);
                },
                icon: const Icon(Icons.person),
                iconSize: 40,
                color: Color(color_2),
              ),
              
          actions: <Widget> [
            IconButton(
              onPressed: (){
                _onPressBtnCalendar(userArg);
              },
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
          padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(color_5)
                                  ),
                                  child:

                                  FadeInImage(
                                    placeholder: AssetImage(loadingDefault),
                                    image: NetworkImage(imageFileController.text),
                                  )

                                  /*
                                  Image.network(
                                    imageFileController.text,
                                    frameBuilder: (BuildContext context, Widget child, int? frame, bool? wasSynchronouslyLoaded) {
                                      return Container(
                                        child: child,
                                      );
                                    },
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                      return Center(child: child);
                                    },
                                  ),

                                  Image.network(
                                    imageFileController.text,
                                    fit: BoxFit.cover,
                                    loadingBuilder:(context, child, loadingProgress) {
                                      return loadingIcons(size: 250, padding: 0,);
                                    },
                                  ),*/
                                ),
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
                          _onPressBtnCancel(userArg);
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
                          userArg = await _onPressBtnSave(userArg);
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

      bottomNavigationBar: BottomAppBar(
        color: Color(color_1),
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              IconButton(
                onPressed: (){
                  _onPressBtnHome(userArg);
                },
                icon: const Icon(Icons.home),
                color: Color(color_2),
                iconSize: 40,
              ),
              IconButton(
                onPressed:  (){
                  _onPressBtnCrud(userArg);
                },
                icon: const Icon(Icons.restaurant),
                color: Color(color_2),
                iconSize: 40,
              ),
              IconButton(
                onPressed:  (){
                  _onPressBtnPedidos(userArg);
                },
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


  void _onPressBtnCancel(userArg) {
    matriculaTextController.text = userArg['user']['matricula'].toString();
    nombreTextController.text = userArg['user']['nombre'];
    contrasenaTextController.text = userArg['user']['contrasena'];
    correoTextController.text = userArg['user']['correo'];
  }
  
  Future<Map> _onPressBtnSave(userArg) async {
    if (_formKey.currentState!.validate()) {
      await updateUser(
        userArg['user']['doc_id'],
        int.parse(matriculaTextController.text),
        nombreTextController.text,
        contrasenaTextController.text,
        correoTextController.text,
        _image,
        imageFileController.text,
      ).then((value) async {
        if(value=='Editando usuario'){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Center(child: Text(value))),
          );
          Map newdata = await getUser(userArg['user']['doc_id']);
          if (newdata.isNotEmpty){
            userArg = newdata;
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Center(child: Text(value))),
          );
        }
      });
    }
    return userArg;
  }

  void _onPressBtnUser(userArg) {}
  void _onPressBtnCalendar(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_calendar", arguments: userArg);
  }
  void _onPressBtnHome(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_home", arguments: userArg);
  }
  void _onPressBtnCrud(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_crud", arguments: userArg);
  }
  void _onPressBtnPedidos(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_order", arguments: userArg);
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
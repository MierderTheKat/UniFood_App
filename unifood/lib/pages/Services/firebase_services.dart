// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import '../Global/routes.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseStorage storage = FirebaseStorage.instance;

Future<Map> loginUser(int matricula, String contrasena) async {
  Map<dynamic, dynamic> user = {};
  CollectionReference cRUser = firestore.collection('user');
  QuerySnapshot queryUser = await cRUser.where('matricula', isEqualTo: matricula).where('contrasena', isEqualTo: contrasena).get();
  queryUser.docs.forEach((doc) {
    user['user'] = {
      'doc_id': doc.id,
      'matricula': doc.get('matricula'),
      'nombre': doc.get('nombre'),
      'contrasena': doc.get('contrasena'),
      'correo': doc.get('correo'),
      'imagen': doc.get('imagen'),
      'descuento': doc.get('descuento'),
      'reporte': doc.get('reporte'),
      'rol': doc.get('rol'),
    };
  });
  //print(user);
  //await Future.delayed(const Duration(seconds: 3));
  return user;
}

Future<String> saveUser(context, int matricula, String nombre, String contrasena, String correo, File? imagen) async {

  Map<dynamic, dynamic> validator = {};
  CollectionReference cRUsers = firestore.collection('user');
  QuerySnapshot queryValidator = await cRUsers.where('matricula', isEqualTo: matricula).get();
  queryValidator.docs.forEach((doc) {
    validator['message'] = 'Matricula ya registrada!';
  });
  if(validator.isNotEmpty){
    return validator['message'];
  }
  validator = {};
  QuerySnapshot queryValidator2 = await cRUsers.where('correo', isEqualTo: correo).get();
  queryValidator2.docs.forEach((doc) {
    validator['message'] = 'Correo ya registrado!';
  });
  if(validator.isNotEmpty){
    return validator['message'];
  }

  final imageUrl = await uploadImage(context, imagen!);

  if(imageUrl == 'No se pudo subir la imagen'){
    return imageUrl;
  }

  await firestore.collection('user').add({
    'matricula': matricula,
    'nombre': nombre,
    'contrasena': contrasena,
    'correo': correo,
    'imagen': imageUrl,
    'descuento': false,
    'reporte': 0,
    'rol': "consumidor"
  });

  return 'Agregando usuario';
}

Future<String> updateUser(context, String docId, int matricula, String nombre, String contrasena, String correo, File? imagen, String urlImagen) async {

  Map<dynamic, dynamic> validator = {};
  CollectionReference cRUsers = firestore.collection('user');
  QuerySnapshot queryValidator = await cRUsers.where('matricula', isEqualTo: matricula).get();
  queryValidator.docs.forEach((doc) {
    validator['message'] = 'Matricula ya registrada!';
    validator['data'] = doc.get('matricula');
  });
  if(validator.isNotEmpty){
    if(matricula != validator['data']){
      return validator['message'];
    }
  }
  validator = {};
  QuerySnapshot queryValidator2 = await cRUsers.where('correo', isEqualTo: correo).get();
  queryValidator2.docs.forEach((doc) {
    validator['message'] = 'Correo ya registrado!';
    validator['data'] = doc.get('correo');
  });
  if(validator.isNotEmpty){
    if(correo != validator['data']){
      return validator['message'];
    }
  }

  if(imagen != null){
    urlImagen = await updateImage(context, imagen, urlImagen);
    if(urlImagen == 'No se pudo eliminar la imagen'){
      return urlImagen;
    }
  }

  await firestore.collection('user').doc(docId).set({
    'matricula': matricula,
    'nombre': nombre,
    'contrasena': contrasena,
    'correo': correo,
    'imagen': urlImagen,
    'descuento': false,
    'reporte': 0,
    'rol': "consumidor"
  });
  return 'Editando usuario';
}


Future<Map> getMenu(String tipo) async {
  Map<dynamic, dynamic> productos = {};
  CollectionReference cRMenu = firestore.collection('menu');
  QuerySnapshot queryMenu = await cRMenu.where('tipo', isEqualTo: tipo).where('disponible', isEqualTo: true).get();
  int i = 1;
  queryMenu.docs.forEach((doc) {
    productos['producto$i'] = {
      'doc_id': doc.id,
      'nombre': doc.get('nombre'),
      'descripcion': doc.get('descripcion'),
      'precio': doc.get('precio'),
      'imagen': doc.get('imagen'),
      'variaciones': doc.get('variacion'),
      'descuento': doc.get('descuento'),
      'tipo': doc.get('tipo'),
    };
    i++;
  });
  //print(productos);
  await Future.delayed(const Duration(seconds: 0));
  return productos;
}


Future<Map> getUser() async {
  Map<dynamic, dynamic> user = {};
    CollectionReference cRUser = firestore.collection('user');
    QuerySnapshot queryUser = await cRUser.get();
    queryUser.docs.forEach((doc) {
      user['user'] = {
        'doc_id': doc.id,
        'matricula': doc.get('matricula'),
        'nombre': doc.get('nombre'),
        'contrasena': doc.get('contrasena'),
        'correo': doc.get('correo'),
        'imagen': doc.get('imagen'),
        'descuento': doc.get('descuento'),
        'reporte': doc.get('reporte'),
        'rol': doc.get('rol'),
      };
    });
    print(user);
    //await Future.delayed(const Duration(seconds: 3));
    return user;


/*
  List user = [];
  CollectionReference cRUser = firestore.collection('user');
  
  QuerySnapshot queryUser = await cRUser.get();
  queryUser.docs.forEach((doc) {
    final data = doc.data() as Map<String,dynamic>;
    final person
    user.add(doc.data());
  });
  Future.delayed(const Duration(seconds: 5));
  return user;
  */
}


// Subir imagen
Future<String> uploadImage(context, File imagen) async {
  /*ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Center(child: Text('Subiendo imagen a la nube'))),
  );*/
  final String nameFile = imagen.path.split("/").last;
  Reference ref = storage.ref().child("profilePhotos").child(nameFile);
  final UploadTask uploadTask = ref.putFile(imagen);
  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
  final String url = await snapshot.ref.getDownloadURL();
  if(snapshot.state == TaskState.success){
    return url;
  } else {
    return "No se pudo subir la imagen";
  }
}

// Editar imagen
Future<String> updateImage(context, File imagen, String oldUrl) async {

  Reference refDelete = FirebaseStorage.instance.refFromURL(oldUrl);
  refDelete.delete().then((_) {print('Archivo eliminado correctamente.');}).catchError((error) {print('Error al eliminar archivo: $error');});

  String newUrl = await uploadImage(context, imagen);
  return newUrl;
}
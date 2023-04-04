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
    user['products'] = {};
  });
  return user;
}

Future<Map> getUser(String docId) async {
  Map<dynamic, dynamic> user = {};
  CollectionReference cRUser = FirebaseFirestore.instance.collection('user');
  DocumentReference dRUser = cRUser.doc(docId);
  DocumentSnapshot snapshot = await dRUser.get();
  if (snapshot.exists) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    user['user'] = {
      'doc_id': docId,
      'matricula': data['matricula'],
      'nombre': data['nombre'],
      'contrasena': data['contrasena'],
      'correo': data['correo'],
      'imagen': data['imagen'],
      'descuento': data['descuento'],
      'reporte': data['reporte'],
      'rol': data['rol'],
    };
    user['products'] = {};
  }
  return user;
}

Future<String> saveUser(int matricula, String nombre, String contrasena, String correo, File? imagen) async {

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

  final imageUrl = await uploadImage(imagen!);

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

Future<String> updateUser(String docId, int matricula, String nombre, String contrasena, String correo, File? imagen, String urlImagen) async {
  DocumentSnapshot<Map<String, dynamic>> thisUser = await firestore.collection('user').doc(docId).get();

  Map<dynamic, dynamic> validator = {};
  CollectionReference cRUsers = firestore.collection('user');
  QuerySnapshot queryValidator = await cRUsers.where('matricula', isEqualTo: matricula).get();
  queryValidator.docs.forEach((doc) {
    validator['message'] = 'Matricula ya registrada!';
    validator['data'] = doc.get('matricula');
  });
  if(validator.isNotEmpty){
    if(matricula != thisUser['matricula']){
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
    if(correo != thisUser['correo']){
      return validator['message'];
    }
  }

  if(imagen != null){
    urlImagen = await updateImage(imagen, urlImagen);
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
  //await Future.delayed(const Duration(seconds: 0));
  return productos;
}

Future<Map> getAllMenu() async {
  Map<dynamic, dynamic> productos = {};
  CollectionReference cRMenu = firestore.collection('menu');
  QuerySnapshot queryMenu = await cRMenu.where('disponible', isEqualTo: true).get();
  int i = 1;
  queryMenu.docs.forEach((doc) {
    productos['producto$i'] = {
      'nombre': doc.get('nombre'),
      'precio': doc.get('precio'),
      'imagen': doc.get('imagen'),
      'variaciones': doc.get('variacion'),
    };
    i++;
  });
  return productos;
}


Future<String> saveOrder(String idUser, Map orders, int costoTotal) async {

  DateTime now = DateTime.now();
  String addLeadingZeroIfNeeded(int number) {
    return number.toString().padLeft(2, '0');
  }
  String formattedDate = "${now.year}-${addLeadingZeroIfNeeded(now.month)}-${addLeadingZeroIfNeeded(now.day)}";
  String formattedTime = "${addLeadingZeroIfNeeded(now.hour)}:${addLeadingZeroIfNeeded(now.minute)}";
  
  String nOrder = '${formattedTime.split(':')[0]}${formattedTime.split(':')[1]}${formattedDate.split('-')[2]}${formattedDate.split('-')[1]}${formattedDate.split('-')[0]}';
  
  /*
    var letras = nOrder.split('');
    letras.shuffle(Random()); // Aleatoriza el orden de los caracteres
    var palabraAleatoria = letras.join(); // Une los caracteres en un nuevo string
    print(palabraAleatoria); // Imprime el string aleatorio
  */

  await firestore.collection('ordenes').add({
    'nOrder': nOrder,
    'idUser': idUser,
    'costoTotal': costoTotal,
    'menu': orders,
    'estatus': 'pendiente',
    'date': now,
  });

  return 'Enviando orden';
}

Future<Map> getOrder(String idUser, int year, String month) async {

  int getMonthNumber(String monthName) {
    switch (monthName.toLowerCase()) {
      case 'enero':
        return 1;
      case 'febrero':
        return 2;
      case 'marzo':
        return 3;
      case 'abril':
        return 4;
      case 'mayo':
        return 5;
      case 'junio':
        return 6;
      case 'julio':
        return 7;
      case 'agosto':
        return 8;
      case 'septiembre':
        return 9;
      case 'octubre':
        return 10;
      case 'noviembre':
        return 11;
      case 'diciembre':
        return 12;
      default:
        throw ArgumentError('Nombre de mes inválido: $monthName');
    }
  }

  int nMonth = getMonthNumber(month);

  DateTime startOfYear = DateTime(year, nMonth, 1); // inicio del año y mes
  DateTime startOfNextYear = DateTime(year, nMonth + 1, 1).subtract(const Duration(milliseconds: 1)); // inicio del siguiente año y mes

  Timestamp startOfYearTimestamp = Timestamp.fromDate(startOfYear);
  Timestamp startOfNextYearTimestamp = Timestamp.fromDate(startOfNextYear);

  Map<dynamic, dynamic> productos = {};

  CollectionReference cROrder = firestore.collection('ordenes');
  QuerySnapshot queryOrder = await cROrder
    .where('date', isGreaterThanOrEqualTo: startOfYearTimestamp)
    .where('date', isLessThan: startOfNextYearTimestamp)
    .where('idUser', isEqualTo: idUser)
    .get();
    
  int i = 1;

  String addLeadingZeroIfNeeded(int number) {
    return number.toString().padLeft(2, '0');
  }

  DocumentSnapshot<Map<String, dynamic>> userName = await firestore.collection('user').doc(idUser).get();

  queryOrder.docs.forEach((doc) {
    DateTime now = doc.get('date').toDate();
    String formattedDate = "${now.year}-${addLeadingZeroIfNeeded(now.month)}-${addLeadingZeroIfNeeded(now.day)}";
    String formattedTime = "${addLeadingZeroIfNeeded(now.hour)}:${addLeadingZeroIfNeeded(now.minute)}";
    productos['$i'] = {
      'nOrder': doc.get('nOrder'),
      'userName': userName['nombre'],
      'costoTotal': doc.get('costoTotal'),
      'menu': doc.get('menu'),
      'fecha': formattedDate,
      'hora': formattedTime,
    };
    i++;
  });
  //await Future.delayed(const Duration(seconds: 0));
  return productos;
}


// Subir imagen
Future<String> uploadImage(File imagen) async {
  final String nameFile = imagen.path.split("/").last;
  Reference ref = storage.ref().child("profilePhotos").child(nameFile);
  File imagenCompress = await compressImage(imagen);
  final UploadTask uploadTask = ref.putFile(imagenCompress);
  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
  final String url = await snapshot.ref.getDownloadURL();
  if(snapshot.state == TaskState.success){
    return url;
  } else {
    return "No se pudo subir la imagen";
  }
}

// Editar imagen
Future<String> updateImage(File imagen, String oldUrl) async {
  Reference refDelete = FirebaseStorage.instance.refFromURL(oldUrl);
  refDelete.delete().then((_) {print('Archivo eliminado correctamente.');}).catchError((error) {print('Error al eliminar archivo: $error');});
  String newUrl = await uploadImage(imagen);
  return newUrl;
}

//Comprimir imagen
Future<File> compressImage(File file) async {
  var compressedImage = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path, // ruta de origen
      "${file.parent.path}/compressed.jpg", // ruta de destino
      quality: 50, // calidad de salida de la imagen comprimida
      minHeight: 256, // altura mínima de la imagen comprimida
      minWidth: 256 // ancho mínimo de la imagen comprimida
  );
  file = File(compressedImage!.path);
  return file;
}


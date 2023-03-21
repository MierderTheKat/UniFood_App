// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, unused_import, no_leading_underscores_for_local_identifiers

import '../Global/routes.dart';

class CafeCrudPage extends StatefulWidget {
  CafeCrudPage({super.key});

  @override
  State<CafeCrudPage> createState() => _CafeCrudPageState();
}

class _CafeCrudPageState extends State<CafeCrudPage> {

    String nombre = "";
    String descripcion = "";
    String precio = "";

    late TextEditingController nombreTextController;
    late TextEditingController descripcionTextController;
    late TextEditingController precioTextController;
    late TextEditingController imageFileController;

    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Map<String, Map<String, dynamic>> _productos = {
      'producto1': {
        'nombre': 'Producto 1',
        'descripcion': 'Descripción del producto 1',
        'precio': 100,
        'imagen': 'assets/images/logo.png',
      },
      'producto2': {
        'nombre': 'Producto 2',
        'descripcion': 'Descripción del producto 2',
        'precio': 200,
        'imagen': 'assets/images/logo.png',
      },/*
      'producto3': {
        'nombre': 'Producto 3',
        'descripcion': 'Descripción del producto 3',
        'precio': 200,
        'imagen': 'assets/images/logo.png',
      },
      'producto4': {
        'nombre': 'Producto 4',
        'descripcion': 'Descripción del producto 4',
        'precio': 200,
        'imagen': 'assets/images/logo.png',
      },
      'producto5': {
        'nombre': 'Producto 5',
        'descripcion': 'Descripción del producto 5',
        'precio': 200,
        'imagen': 'assets/images/logo.png',
      },
      'producto6': {
        'nombre': 'Producto 6',
        'descripcion': 'Descripción del producto 6',
        'precio': 200,
        'imagen': 'assets/images/logo.png',
      }*/
    };

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
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    backgroundColor: Color(color_8),
                    foregroundColor: Color(color_4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.burger,
                    size: 40,
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 53, vertical: 15),
                    backgroundColor: Color(color_7),
                    foregroundColor: Color(color_4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.glassWater,
                    size: 40,
                  ),
                ),

              ],
            ),

            Divider(
              height: 30,
              thickness: 3,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 22),
                ),
                Text(
                  "Alimentos",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    options(context, 'burger');
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(color_7),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.plus,
                      size: 25,
                      color: Color(color_4),
                    ),
                  )
                ),
              ],
            ),

            ListView.builder (
              itemCount: _productos.length,
              itemBuilder: (BuildContext context, int index) {
                return Card_Crud(
                  nombre: '${_productos['producto${index+1}']!['nombre']}',
                  descripcion: '${_productos['producto${index+1}']!['descripcion']}',
                  precio: _productos['producto${index+1}']!['precio'],
                  imagen: '${_productos['producto${index+1}']!['imagen']}',
                  icon: 'burger',
                );
              },
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 22),
                ),
                Text(
                  "Bebidas",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    options(context, 'water');
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(color_7),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.plus,
                      size: 25,
                      color: Color(color_4),
                    ),
                  )
                ),
              ],
            ),

            Card_Crud(
              nombre: 'Nombre del Producto',
              descripcion: 'Descripción del producto',
              precio: 500,
              imagen: 'assets/images/logo.png',
              icon: 'water',
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

  options(context, String icon){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return Container(
          padding:const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 40),
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [

                        Card_ProductPhoto(
                          icon: icon,
                        ),

                        const Divider(
                          color: Colors.transparent,
                          height: 10,
                        ),

                        TextFormField(
                          controller: nombreTextController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Nombre del Producto",
                            hintText: 'Burrito',
                          ),
                          keyboardType: TextInputType.text,
                          onSaved: (value) {
                            nombre = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "¡Debe llenar este campo!";
                            }
                            return null;
                          },
                        ),

                        const Divider(
                          color: Colors.transparent,
                          height: 20,
                        ),

                        TextFormField(
                          controller: descripcionTextController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Descripción del Producto",
                            hintText: 'Carne envuelta en un tortilla de harina',
                          ),
                          keyboardType: TextInputType.text,
                          onSaved: (value) {
                            descripcion = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "¡Debe llenar este campo!";
                            }
                            return null;
                          },
                        ),

                        const Divider(
                          color: Colors.transparent,
                          height: 20,
                        ),

                        TextFormField(
                          controller: precioTextController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Precio del Producto",
                            hintText: '16',
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            precio = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "¡Debe llenar este campo!";
                            }
                            return null;
                          },
                        ),

                        const Divider(
                          color: Colors.transparent,
                          height: 10,
                        ),

                      ],
                    )
                  ),

                  const Divider(
                    thickness: 3,
                    height: 35,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          backgroundColor: Color(color_8),
                          foregroundColor: Color(color_4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        )
                      ),

                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          backgroundColor: Color(color_7),
                          foregroundColor: Color(color_4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)
                          ),
                        ),
                        onPressed: (){},
                        child: const Text(
                          'Guardar',
                          style: TextStyle(
                            fontSize: 20
                          ),
                        )
                      ),

                    ],
                  )
                ],
              )
            ),
        );
      }
    );
  }

  @override
  void initState() {
    // TO.DO: implement initState
    super.initState();

    nombreTextController = TextEditingController();
    descripcionTextController = TextEditingController();
    precioTextController = TextEditingController();
    imageFileController = TextEditingController();
  }

  @override
  void dispose() {
    // TO.DO: implement dispose
    super.dispose();

    nombreTextController.dispose();
    descripcionTextController.dispose();
    precioTextController.dispose();
    imageFileController.dispose();

  }

  void _onPressBtnUser() {
    print("Boton User Cafe");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_profile");
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
  }
  void _onPressBtnPedidos() {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_order");
  }

}
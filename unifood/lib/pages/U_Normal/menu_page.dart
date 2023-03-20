// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, unused_import, no_leading_underscores_for_local_identifiers

import '../Global/routes.dart';

class MenuPage extends StatefulWidget {
  MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

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
            onPressed: _onPressBtnCar,
            icon: const Icon(Icons.shopping_cart),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Alimentos",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            ListView.builder (
              itemCount: _productos.length,
              itemBuilder: (BuildContext context, int index) {
                return Card_Menu(
                  nombre: '${_productos['producto${index+1}']!['nombre']}',
                  descripcion: '${_productos['producto${index+1}']!['descripcion']}',
                  precio: _productos['producto${index+1}']!['precio'],
                  imagen: '${_productos['producto${index+1}']!['imagen']}',
                );
              },
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Bebidas",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Card_Menu(
              nombre: 'Nombre del Producto',
              descripcion: 'Descripción del producto',
              precio: 500,
              imagen: 'assets/images/logo.png',
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
                onPressed: _onPressBtnMenu,
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

  void _onPressBtnUser() {
    print("Boton User");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/profile");
  }
  void _onPressBtnCar() {
    print("Boton Carrito");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/car");
  }
  void _onPressBtnHome() {
    print("Boton Home");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/home");
  }
  void _onPressBtnMenu() {
    print("Boton Menu");
  }
  void _onPressBtnPedidos() {
    print("Boton Pedidos");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/order");
  }

}

// Card Menu
/*
            Card(
              //elevation: 10,
              //color: Color(color_5),
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                              width: 210,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Nombre del producto',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(color_4)
                                        ),
                                      ),
                                    ]
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Descripción del producto',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(color_4)
                                        ),
                                      ),
                                    ]
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo.png'),
                                  fit: BoxFit.scaleDown,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(color_5)
                              ),
                            ),

                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: 100,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(color_5)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    'MX\$ 500',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),

                      ],
                    )
                  ),
                ]
              ),
            ),
*/
// Card de CRUD
/*
            Card(
              //elevation: 10,
              //color: Color(color_5),
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                              width: 210,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Nombre del producto',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(color_4)
                                        ),
                                      ),
                                      Icon(Icons.edit, color: Color(color_4), size: 20)
                                    ]
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Descripción del producto',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(color_4)
                                        ),
                                      ),
                                      Icon(Icons.edit, color: Color(color_4), size: 20)
                                    ]
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo.png'),
                                  fit: BoxFit.scaleDown,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(color_5)
                              ),
                            ),

                          ],
                        ),

                        Divider(
                          color: Colors.transparent,
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: 100,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(color_5)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'MX\$ 500',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Icon(Icons.edit, color: Color(color_4), size: 20)
                                ],
                              ),
                            ),
                          
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(color_7),
                                foregroundColor: Color(color_4),
                              ),
                              child: Column(
                                children: const [
                                  Text("Disponible")
                                ],
                              ),
                            ),

                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(color_8),
                                foregroundColor: Color(color_4),
                              ),
                              child: Column(
                                children: const [
                                  Text("Agotado")
                                ],
                              ),
                            ),

                          ],
                        ),
                        
                        Divider(
                          //color: Colors.transparent,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(color_7),
                                foregroundColor: Color(color_4),
                              ),
                              child: Column(
                                children: const [
                                  Text("Guardar")
                                ],
                              ),
                            ),

                            VerticalDivider(),

                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(color_8),
                                foregroundColor: Color(color_4),
                              ),
                              child: Column(
                                children: const [
                                  Text("Eliminar")
                                ],
                              ),
                            ),

                          ],
                        ),


                      ],
                    )
                  ),
                ]
              ),
            ),
*/
// Card de Carrito
/*
            Card(
              //elevation: 10,
              //color: Color(color_5),
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                              width: 210,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Nombre del producto',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(color_4)
                                        ),
                                      ),
                                    ]
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Descripción del producto',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(color_4)
                                        ),
                                      ),
                                    ]
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo.png'),
                                  fit: BoxFit.scaleDown,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(color_5)
                              ),
                            ),

                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: 100,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(color_5)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    'MX\$ 500',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFBEBEBE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(color_8),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Color(color_4),
                                        size: 15,
                                      ),
                                      onPressed: () {
                                        print('- pressed');
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 0),
                                    child: Text(
                                      '0',
                                      style: TextStyle(
                                          fontSize: 20,
                                        ),
                                    ),
                                  ),

                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Color(color_7),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Color(color_4),
                                        size: 15,
                                      ),
                                      onPressed: () {
                                        print('+ pressed');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    )
                  ),
                ]
              ),
            ),
*/
// Ejemplo
/*
            Card(
              elevation: 10,
              color: Color(color_5),
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Container(
                              width: 210,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Nombre del producto',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(color_4)
                                        ),
                                      ),
                                      Icon(Icons.edit, color: Color(color_4), size: 20)
                                    ]
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Descripción del producto',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Icon(Icons.edit, color: Color(color_4), size: 20)
                                    ]
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo.png'),
                                  fit: BoxFit.scaleDown,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(color_5)
                              ),
                            ),

                          ],
                        ),

                        Divider(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: 100,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(color_5)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'MX\$ 500',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Icon(Icons.edit, color: Color(color_4), size: 20)
                                ],
                              ),
                            ),
                          
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(color_7),
                                foregroundColor: Color(color_4),
                              ),
                              child: Column(
                                children: const [
                                  Text("Disponible")
                                ],
                              ),
                            ),

                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(color_8),
                                foregroundColor: Color(color_4),
                              ),
                              child: Column(
                                children: const [
                                  Text("Agotado")
                                ],
                              ),
                            ),

                          ],
                        ),
                        
                        Divider(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(color_7),
                                foregroundColor: Color(color_4),
                              ),
                              child: Column(
                                children: const [
                                  Text("Guardar")
                                ],
                              ),
                            ),

                            VerticalDivider(),

                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Color(color_8),
                                foregroundColor: Color(color_4),
                              ),
                              child: Column(
                                children: const [
                                  Text("Eliminar")
                                ],
                              ),
                            ),

                          ],
                        ),


                      ],
                    )
                  ),
                ]
              ),
            ),
*/

// Cards Viejas
/*
            Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nombre del producto',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(color_4)
                              ),
                            ),
                            Text(
                              'Descripción del producto',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[200]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'MX\$ 500',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo.png'),
                                  fit: BoxFit.scaleDown,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[200]
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100)
                                      ),
                                      foregroundColor: Color(color_4),
                                      backgroundColor: Color(color_7)
                                  ),
                                  icon: Icon(Icons.plus_one_outlined),
                                ),
                                Text("1"),
                                IconButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100)
                                      ),
                                      foregroundColor: Color(color_4),
                                      backgroundColor: Color(color_7)
                                  ),
                                  icon: Icon(Icons.plus_one_outlined),
                                ),
                              ],
                            )
                          ],
                        )
                      
                      ],
                    )
                  ),
                ]
              ),
            ),

            Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nombre del producto',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color(color_4)
                              ),
                            ),
                            Text(
                              'Descripción del producto',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey[200]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'MX\$ 500',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.png'),
                              fit: BoxFit.scaleDown,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[200]
                          ),
                        ),
                      ],
                    )
                  ),
                ]
              ),
            ),
*/

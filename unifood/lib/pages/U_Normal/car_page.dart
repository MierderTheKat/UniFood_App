// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import '../Global/routes.dart';

class CarPage extends StatefulWidget {
  CarPage({super.key});

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {

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
        child: ListView (
          shrinkWrap: false,
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          children: [

            Card_Car(
              nombre: 'Nombre del Producto',
              descripcion: 'Descripción del producto',
              precio: 5000,
              imagen: 'assets/images/logo.png',
            ),

            Card_Car(
              nombre: 'Nombre del Producto',
              descripcion: 'Descripción del producto',
              precio: 500,
              imagen: 'assets/images/logo.png',
            ),

            Card_Car_Order(
              total: 100,
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

/*
  void _incrementCounter() {
    setState(() {
      _counter++;
      print('+ pressed');
    });
  }

  void _decrementCounter() {
    setState(() {
      if(_counter > 0){
        _counter--;
      }
      print('- pressed');
    });
  }
*/

  void _onPressBtnUser() {
    print("Boton User");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/profile");
  }
  void _onPressBtnCar() {
    print("Boton Carrito");
  }
  void _onPressBtnHome() {
    print("Boton Home");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/home");
  }
  void _onPressBtnMenu() {
    print("Boton Menu");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/menu");
  }
  void _onPressBtnPedidos() {
    print("Boton Pedidos");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/order");
  }

}
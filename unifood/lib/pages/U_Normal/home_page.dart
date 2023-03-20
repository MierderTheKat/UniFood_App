// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, unused_import

import '../Global/routes.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  /*
    late final HomePageArguments datos;
    HomePage({Key? key, required this.datos}) : super(key:key);
  */
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    //final name = ModalRoute.of(context).settings.arguments;
    //final Datos arguments = ModalRoute.of(context).settings.arguments;

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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Bien',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(color_8),
                  ),
                ),
                Text(
                  'venido',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(color_7),
                  ),
                ),
              ],
            ),

            Card_Home_Chart(),

            Card_Home_Gastado(gastado: 5340),

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

List<PieChartSectionData> sectionsChartUser = [
  PieChartSectionData(
    value: 10,
    title: "70%",
    showTitle: false,
    color: Colors.purple,
    radius: 40,
  ),
  PieChartSectionData(
    value: 30,
    title: "30%",
    showTitle: false,
    color: Colors.blue,
    radius: 40,
  ),
  PieChartSectionData(
    value: 40,
    title: "70%",
    showTitle: false,
    color: Colors.green,
    radius: 40,
  ),
  PieChartSectionData(
    value: 20,
    title: "30%",
    showTitle: false,
    color: Colors.red,
    radius: 40,
  ),
];
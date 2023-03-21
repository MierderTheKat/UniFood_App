// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, unused_import

import '../Global/routes.dart';

class CafeHomePage extends StatefulWidget {
  CafeHomePage({super.key});
  /*
    late final CafeHomePageArguments datos;
    CafeHomePage({Key? key, required this.datos}) : super(key:key);
  */
  @override
  State<CafeHomePage> createState() => _CafeHomePageState();
}

class _CafeHomePageState extends State<CafeHomePage> {

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
        child: ListView (
          shrinkWrap: false,
          padding: const EdgeInsets.only(right: 10, left: 10, top: 40),
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

            Card_Home_Chart(
              productsNum: 32,
              usertype: 'total de ventas',
              usertype2: 'al dia',
              usertype3: '',
            ),

            Divider(
              color: Colors.transparent,
            ),

            Card_Home_Gastado(
              usertype: 'Ventas del dia',
              gastado: 5340
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

}

List<PieChartSectionData> sectionsChartCafe = [
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
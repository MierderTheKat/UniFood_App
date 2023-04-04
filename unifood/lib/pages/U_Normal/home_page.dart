// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, unused_import

import '../Global/routes.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    final Map userArg = ModalRoute.of(context)!.settings.arguments as Map;

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
                _onPressBtnCar(userArg);
              },
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
          padding: const EdgeInsets.only(right: 10, left: 10, top: 40),
          children: [

            Column(
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
                Text(
                  userArg['user']['nombre'].split(' ')[0],
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(color_4),
                  ),
                )
              ],
            ),

            Card_Home_Chart(
              productsNum: 32,
              usertype: 'productos',
              usertype2: 'comprados',
              usertype3: 'a la semana',
            ),

            Divider(
              color: Colors.transparent,
            ),

            Card_Home_Gastado(
              usertype: 'Gastados en la semana',
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
                onPressed: (){
                  _onPressBtnHome(userArg);
                },
                icon: const Icon(Icons.home),
                color: Color(color_2),
                iconSize: 40,
              ),
              IconButton(
                onPressed:  (){
                  _onPressBtnMenu(userArg);
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

  void _onPressBtnUser(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/profile", arguments: userArg);
  }
  void _onPressBtnCar(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/car", arguments: userArg);
  }
  void _onPressBtnHome(userArg) {}
  void _onPressBtnMenu(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/menu", arguments: userArg);
  }
  void _onPressBtnPedidos(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/order", arguments: userArg);
  }

}

// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, unused_import

import '../Global/routes.dart';

class CafeHomePage extends StatefulWidget {
  CafeHomePage({super.key});
  @override
  State<CafeHomePage> createState() => _CafeHomePageState();
}

class _CafeHomePageState extends State<CafeHomePage> {

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

  void _onPressBtnUser(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_profile", arguments: userArg);
  }
  void _onPressBtnCalendar(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_calendar", arguments: userArg);
  }
  void _onPressBtnHome(userArg) {}
  void _onPressBtnCrud(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_crud", arguments: userArg);
  }
  void _onPressBtnPedidos(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_order", arguments: userArg);
  }

}

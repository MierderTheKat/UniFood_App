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

            FutureBuilder(
              future: getMenu('alimento'),
              builder: (context, snapshot) {
                return snapshot.hasData
                  ? ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Card_Menu(
                      nombre: '${snapshot.data?['producto${index+1}']?['nombre']}',
                      descripcion: '${snapshot.data?['producto${index+1}']?['descripcion']}',
                      precio: snapshot.data?['producto${index+1}']?['precio'],
                      imagen: '${snapshot.data?['producto${index+1}']?['imagen']}',
                      variaciones: snapshot.data?['producto${index+1}']?['variaciones'],
                      userArg: userArg,
                    );
                    },
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  )
                  : loadingIcons(size: 150, padding: 50,);
                }
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

            FutureBuilder(
              future: getMenu('bebida'),
              builder: (context, snapshot) {
                return snapshot.hasData
                  ? ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Card_Menu(
                      nombre: '${snapshot.data?['producto${index+1}']?['nombre']}',
                      descripcion: '${snapshot.data?['producto${index+1}']?['descripcion']}',
                      precio: snapshot.data?['producto${index+1}']?['precio'],
                      imagen: '${snapshot.data?['producto${index+1}']?['imagen']}',
                      variaciones: snapshot.data?['producto${index+1}']?['variaciones'],
                      userArg: userArg,
                    );
                    },
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  )
                  : loadingIcons(size: 150, padding: 50,);
                }
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
  void _onPressBtnHome(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/home", arguments: userArg);
  }
  void _onPressBtnMenu(userArg) {}
  void _onPressBtnPedidos(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/order", arguments: userArg);
  }

}

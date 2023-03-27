// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, unused_import, no_leading_underscores_for_local_identifiers

import '../Global/routes.dart';

class OrderPage extends StatefulWidget {
  OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  @override
  Widget build(BuildContext context) {

    final Map userArg = ModalRoute.of(context)!.settings.arguments as Map;

    Map<String, Map<String, dynamic>> _pedidos = {
      'pedido1': {
        'nombreAlumno': 'Francisco Javier Rivera',
        'orden': 'No. de Orden',
        'fecha': '17/03/22',
        'hora': '10:15 AM',
        'productos': {
          'producto1': {
            'nombreProducto': 'Burrito Azada',
            'cantidadProducto': 16,
          },
          'producto2': {
            'nombreProducto': 'Burrito Arrachera',
            'cantidadProducto': 16,
          },  
        },
        'total': 32,
      },
      'pedido2': {
        'nombreAlumno': 'Yasser Francisco Alvarez Esque',
        'orden': 'No. de Orden',
        'fecha': '17/03/22',
        'hora': '10:15 AM',
        'productos': {
          'producto1': {
            'nombreProducto': 'Gordita Tostada',
            'cantidadProducto': 16,
          },
          'producto2': {
            'nombreProducto': 'Torta Polla',
            'cantidadProducto': 16,
          },
        },
        'total': 32,
      },
    };
    
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;

    List<int> _years = List.generate(10, (index) => year - index);
    int _selectedYear = year;


    List<String> _months = [
      'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
      'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
    ];
    String _selectedMonth = _months[month-1];


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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  DropdownButton<int>(
                    dropdownColor: Color(color_5),
                    borderRadius: BorderRadius.circular(20),
                    iconSize: 30,
                    elevation: 16,
                    underline: Container(height: 0),
                    value: _selectedYear,
                    onChanged: (year) {
                      setState(() {
                        _selectedYear = year!;
                        print(_selectedYear);
                      });
                    },
                    items: _years.map((int year) {
                      return DropdownMenuItem<int>(
                        value: year,
                        child: Text(year.toString()),
                      );
                    }).toList(),
                  ),

                  DropdownButton<String>(
                    dropdownColor: Color(color_5),
                    borderRadius: BorderRadius.circular(20),
                    iconSize: 30,
                    elevation: 16,
                    underline: Container(height: 0),
                    value: _selectedMonth,
                    onChanged: (String? month) {
                      setState(() {
                        _selectedMonth = month!;
                        print(_selectedMonth);
                      });
                    },
                    items: _months.map((String month) {
                      return DropdownMenuItem<String>(
                        value: month,
                        child: Text(month),
                      );
                    }).toList(),
                  ),

                ],
              ),
            ),

            Divider(
              height: 30,
              thickness: 3,
            ),

            ListView.builder (
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _pedidos.length,
              itemBuilder: (BuildContext context, int index) {
                return Card_Pedidos_Accordion(
                nombreAlumno:'${_pedidos['pedido${index+1}']!['nombreAlumno']}',
                orden:'${_pedidos['pedido${index+1}']!['orden']}',
                fecha:'${_pedidos['pedido${index+1}']!['fecha']}',
                hora:'${_pedidos['pedido${index+1}']!['hora']}',
                productos: _pedidos['pedido${index+1}']!['productos'],
                /*nombreProducto:'${_pedidos['pedido${index+1}']!['productos']!['nombreProducto${index+1}']}',
                cantidadProducto:_pedidos['pedido${index+1}']!['productos']!['cantidadProducto${index+1}'],*/
                total:_pedidos['pedido${index+1}']!['total'],
                );
              },
              
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
    print("Boton User");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/profile", arguments: userArg);
  }
  void _onPressBtnCar(userArg) {
    print("Boton Carrito");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/car", arguments: userArg);
  }
  void _onPressBtnHome(userArg) {
    print("Boton Home");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/home", arguments: userArg);
  }
  void _onPressBtnMenu(userArg) {
    print("Boton Menu");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/menu", arguments: userArg);
  }
  void _onPressBtnPedidos(userArg) {
    print("Boton Pedidos");
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/order", arguments: userArg);
  }

}

// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, unused_import, no_leading_underscores_for_local_identifiers, camel_case_types

import '../Global/routes.dart';

class CafeCalendarPage extends StatefulWidget {
  CafeCalendarPage({super.key});

  @override
  State<CafeCalendarPage> createState() => _CafeCalendarPageState();
}

class _CafeCalendarPageState extends State<CafeCalendarPage> {
  bool isExpandedTodo = true;
  bool isExpandedDoing = false;
  bool isExpandedDone = false;

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
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    backgroundColor: Color(color_8),
                    foregroundColor: Color(color_4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.clock,
                    size: 50,
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    backgroundColor: Color(color_7),
                    foregroundColor: Color(color_4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.rotate,
                    size: 50,
                  ),
                ),

                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    backgroundColor: Color(color_7),
                    foregroundColor: Color(color_4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: 50,
                  ),
                ),

              ],
            ),

            Divider(
              height: 30,
              thickness: 3,
            ),

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

            InkWell(
              onTap: (){
                setState(() {
                  isExpandedTodo = !isExpandedTodo;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 22),
                  ),
                  Text(
                    "Pendientes",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: FaIcon(
                      isExpandedTodo ? FontAwesomeIcons.angleUp : FontAwesomeIcons.angleDown,
                      size: 25,
                      color: Color(color_4),
                    ),
                  ),
                ],
              ),
            ),

            AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              crossFadeState:
                  isExpandedTodo ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstChild: const SizedBox.shrink(),
              secondChild: ListView.builder (
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _pedidos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card_Calendar_Accordion_Cafe(
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
            ),

            Divider(),

            InkWell(
              onTap: (){
                setState(() {
                  isExpandedDoing = !isExpandedDoing;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 22),
                  ),
                  Text(
                    "En proceso",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: FaIcon(
                      isExpandedDoing ? FontAwesomeIcons.angleUp : FontAwesomeIcons.angleDown,
                      size: 25,
                      color: Color(color_4),
                    ),
                  ),
                ],
              ),
            ),

            AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              crossFadeState:
                  isExpandedDoing ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstChild: const SizedBox.shrink(),
              secondChild: ListView.builder (
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _pedidos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card_Calendar_Accordion_Cafe(
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
            ),

            Divider(),

            InkWell(
              onTap: (){
                setState(() {
                  isExpandedDone = !isExpandedDone;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 22),
                  ),
                  Text(
                    "Entregado",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: FaIcon(
                      isExpandedDone ? FontAwesomeIcons.angleUp : FontAwesomeIcons.angleDown,
                      size: 25,
                      color: Color(color_4),
                    ),
                  ),
                ],
              ),
            ),

            AnimatedCrossFade(
              duration: const Duration(milliseconds: 500),
              crossFadeState:
                  isExpandedDone ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstChild: const SizedBox.shrink(),
              secondChild: ListView.builder (
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _pedidos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card_Calendar_Accordion_Cafe(
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
            ),

            Divider(
              color: Colors.transparent,
              height: 40,
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
  void _onPressBtnCalendar(userArg) {}
  void _onPressBtnHome(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_home", arguments: userArg);
  }
  void _onPressBtnCrud(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_crud", arguments: userArg);
  }
  void _onPressBtnPedidos(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/c_order", arguments: userArg);
  }

}

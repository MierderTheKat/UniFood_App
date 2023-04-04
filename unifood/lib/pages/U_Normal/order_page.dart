// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors, unused_import, no_leading_underscores_for_local_identifiers

import '../Global/routes.dart';

class OrderPage extends StatefulWidget {
  OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  
  final List<String> _months = [
    'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
  ];
  late String _selectedMonth = '';
  late List<int> _years = [];
  late int _selectedYear = 1;
  late int _selectedYearsend = 1;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;
    _years = List.generate(12, (index) => year - index);
    _selectedYear = year;
    _selectedYearsend = year;
    _selectedMonth = _months[month-1];
  }

  @override
  Widget build(BuildContext context) {

    final Map userArg = ModalRoute.of(context)!.settings.arguments as Map;

    Future<void> valueChange (String month, int year) async {
      setState(() {
        _selectedYearsend = 2015;
        _selectedMonth = month;
        _selectedYear = year;
      });
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _selectedYearsend = year;
      });
    }


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
                      valueChange(_selectedMonth,year!);
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
                      valueChange(month!,_selectedYear);
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

            FutureBuilder(
              future: getOrder(userArg['user']['doc_id'],_selectedYearsend,_selectedMonth),
              builder: (context, snapshot) {
                return snapshot.hasData
                  ? ListView.builder(
                    reverse: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Card_Pedidos_Accordion(
                        nombreAlumno: '${snapshot.data?['${index+1}']!['userName']}',
                        orden: '${snapshot.data?['${index+1}']!['nOrder']}',
                        fecha: snapshot.data?['${index+1}']!['fecha'],
                        hora: snapshot.data?['${index+1}']!['hora'],
                        productos: snapshot.data?['${index+1}']!['menu'],
                        total: snapshot.data?['${index+1}']!['costoTotal'],
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
  void _onPressBtnMenu(userArg) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/menu", arguments: userArg);
  }
  void _onPressBtnPedidos(userArg) {}

}

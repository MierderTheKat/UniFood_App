// ignore_for_file: prefer_const_constructors

import 'pages/Global/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _routes = {
    "/login":(context) =>  LoginPage(),
    "/register":(context) =>  RegisterPage(),
    // Usuario normal
    "/profile":(context) =>  ProfilePage(),
    "/car":(context) =>  CarPage(),
    "/home":(context) =>  HomePage(),
    "/menu":(context) =>  MenuPage(),
    "/order":(context) =>  OrderPage(),
    // Usuario cafeteria
    
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniFood',
      initialRoute: "/login",
      routes: _routes,
      /*
        // Si no encuentra la ruta va al home
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) =>  HomePage(),
          );
        },
      */
    );
  }
}
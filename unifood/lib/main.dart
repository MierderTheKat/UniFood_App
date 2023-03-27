// ignore_for_file: prefer_const_constructors

import 'pages/Global/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
 
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
    "/c_profile":(context) =>  CafeProfilePage(),
    "/c_calendar":(context) =>  CafeCalendarPage(),
    "/c_order":(context) =>  CafeOrderPage(),
    "/c_crud":(context) =>  CafeCrudPage(),
    "/c_home":(context) =>  CafeHomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
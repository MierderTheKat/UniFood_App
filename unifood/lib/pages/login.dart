// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_this, unused_import

import 'Global/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String matriculaValue = "";
  String contrasenaValue = "";

  late TextEditingController matriculaTextController;
  late TextEditingController contrasenaTextController;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Color(color_6),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Divider(
                  color: Colors.transparent,
                  height: 30,
                ),
                Image.asset(
                  "assets/images/logo.png",
                ),
                Divider(
                  color: Colors.transparent,
                  height: 150,
                ),
                SizedBox(
                  height: 200,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        TextFormField(
                          controller: matriculaTextController,
                          decoration: InputDecoration(
                            labelText: "Matrícula",
                            hintText: '1234567890',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          onSaved: (value) {
                            matriculaValue = value!;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "¡Debe llenar este campo!";
                            } else if (value.length != 10) {
                              return "¡Debe tener 10 caracteres!";
                            }
                            return null;
                          },
                        ),

                        TextFormField(
                          controller: contrasenaTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Contraseña",
                            ),
                          obscureText: true,
                          obscuringCharacter: '●',
                          onSaved: (value) {
                            contrasenaValue = value!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '¡Debe llenar este campo!';
                            }
                            return null;
                          },
                        ),

                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 20,
                ),
                
                ElevatedButton(
                  onPressed: () {
                    _showHomePage(context);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Color(color_4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Color(color_5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  child: Column(
                    children: const [
                      Text('Ingresar'),
                    ],
                  ),
                ),

                Divider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Color(color_4),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Color(color_8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Column(
                        children: const [
                          Text('Normal'),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/c_home');
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Color(color_4),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Color(color_7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Column(
                        children: const [
                          Text('Cafeteria'),
                        ],
                      ),
                    ),

                  ],
                )

              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Text("¿No tienes una cuenta?"),
                  ),
                  ElevatedButton(
                      onPressed: _showRegisterPage,
                      style: TextButton.styleFrom(
                        foregroundColor: Color(color_4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        textStyle: const TextStyle(fontSize: 15),
                        backgroundColor: Color(color_5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      child: Text("¡Regístrate!"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showHomePage(BuildContext context) {
    if (_formKey.currentState!.validate()) {

      Navigator.pop(context);
      Navigator.pushNamed(context, '/home', arguments: Datos(matriculaTextController.text,contrasenaTextController.text));
      
/*
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      // Destruye la ruta anterior y no puedes regresar
      // Navigator.pushReplacementNamed(context, "/home");
      // Navigator.of(context).pushReplacementNamed("/home",
      //Navigator.of(context).pushNamed(
      //  "/home",
        /*arguments: HomePageArguments("ola", "No"),
        MaterialPageRoute(
          builder: (context) => HomePage(datos: datos[index]),
        )*/
      //);
*/

    }
    print(matriculaTextController.text);
    print(contrasenaTextController.text);
  }

  void _showRegisterPage() {
    Navigator.of(context).pushNamed("/register");
  }

  @override
  void initState() {
    // TO.DO: implement initState
    super.initState();

    matriculaTextController = TextEditingController();
    contrasenaTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TO.DO: implement dispose
    super.dispose();

    matriculaTextController.dispose();
    contrasenaTextController.dispose();
  }
}

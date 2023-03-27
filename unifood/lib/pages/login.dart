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
/*
  late TextEditingController matriculaTextController;
  late TextEditingController contrasenaTextController;
*/
  TextEditingController matriculaTextController = TextEditingController(text: "");
  TextEditingController contrasenaTextController = TextEditingController(text: "");

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    matriculaTextController.text = '1122222222';
    contrasenaTextController.text = '123';

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  height: 100,
                ),

                SizedBox(
                  height: 170,
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

/*
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
*/
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text("¿No tienes una cuenta?"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    _showRegisterPage();
                  },
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
        ),
      ),
    );
  }

  void _showHomePage(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      loginUser(int.parse(matriculaTextController.text), contrasenaTextController.text).then((value) {
        if (value.isNotEmpty){
          //print(value['user1']['nombre']);
          if (value['user']['rol'] == ('consumidor')){
            Navigator.pushNamed(context, '/home', arguments: value['user']);
            print('Consumidor');
          }
          else if (value['user']['rol'] == ('vendedor')){
            Navigator.pushNamed(context, '/c_home', arguments: value['user']);
            print('Vendedor');
          }
        }
        else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Center(
              child: Text('Credenciales invalidas'),
            )),
          );
        }
      });
    }
  }

  Future<void> _showRegisterPage() async {
    await Navigator.of(context).pushNamed("/register");
    setState(() {});
  }

  @override
  void initState() {
    // TO.DO: implement initState
    super.initState();
/*
    matriculaTextController = TextEditingController();
    contrasenaTextController = TextEditingController();*/
  }

  @override
  void dispose() {
    // TO.DO: implement dispose
    super.dispose();

    matriculaTextController.dispose();
    contrasenaTextController.dispose();
  }
}

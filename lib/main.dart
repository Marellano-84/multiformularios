import 'package:flutter/material.dart';
import 'bienvenida.dart';

void main() {
  runApp(MiClase());
}

class MiClase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multiformularios",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Pantalla(),
    );
  }
}

class Pantalla extends StatelessWidget {
  final txtLogin = TextEditingController();
  final txtClave = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login and Password")),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment.center,
            child: Image.asset("img/user.png"),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: txtLogin,
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText: "Usuario"),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: txtClave,
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText: "Contraseña"),
              obscureText: true,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () {
                // Leemos los campos de texto
                String usu = txtLogin.text;
                String pass = txtClave.text;

                // Condicionales
                if (usu == "admin" && pass == "123") {
                  // Navegar a la pantalla de bienvenida
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bienvenida(usu),
                    ),
                  );
                } else {
                  // Mostrar un diálogo de error si las credenciales son incorrectas
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text(
                            "Credenciales incorrectas. Inténtalo de nuevo."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              icon: Icon(Icons.login),
              label: Text("Iniciar sesión"),
            ),
          ),
        ],
      ),
    );
  }
}

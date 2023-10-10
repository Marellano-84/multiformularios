import 'package:flutter/material.dart';

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

class Pantalla extends StatefulWidget {
  @override
  _PantallaState createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
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
              decoration: InputDecoration(
                hintText: "Usuario",
                prefixIcon: Icon(Icons.person), // Icono para usuario
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: txtClave,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Contraseña",
                prefixIcon: Icon(Icons.lock), // Icono para contraseña
              ),
              obscureText: true,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () {
                String usu = txtLogin.text;
                String pass = txtClave.text;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SegundoFormulario(usu, pass),
                  ),
                );
              },
              icon: Icon(Icons.login),
              label: Text("Enviar Datos"),
            ),
          ),
        ],
      ),
    );
  }
}

class SegundoFormulario extends StatefulWidget {
  final String usuario;
  final String contrasena;

  SegundoFormulario(this.usuario, this.contrasena);

  @override
  _SegundoFormularioState createState() => _SegundoFormularioState();
}

class _SegundoFormularioState extends State<SegundoFormulario> {
  bool validacionExitosa = false;

  void validarDatos() {
    setState(() {
      validacionExitosa =
          widget.usuario == "admin" && widget.contrasena == "123";
    });

    if (validacionExitosa) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Bienvenido"),
            content: Text("Bienvenido, ${widget.usuario}"),
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
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Credenciales incorrectas. Inténtalo de nuevo."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context); // Volver al login
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenida'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Datos ingresados:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Usuario: ${widget.usuario}',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Contraseña: ${widget.contrasena}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: validarDatos,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check), // Icono para validar
                  SizedBox(width: 8.0),
                  Text('Validar'),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back), // Icono para volver
                  SizedBox(width: 8.0),
                  Text('Volver al login'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

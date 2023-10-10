import 'package:flutter/material.dart';

class Bienvenida extends StatelessWidget {
  final String usuario;

  Bienvenida(this.usuario);

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
              'Bienvenido, $usuario',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver al login'),
            ),
          ],
        ),
      ),
    );
  }
}

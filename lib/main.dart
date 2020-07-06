import 'package:flutter/material.dart';
import 'package:kloanapp/screens/menu_principal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final newTextTheme = Theme.of(context).textTheme.apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    );
    // comentarios para revisar
    return MaterialApp(
      title: 'Ventas',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: newTextTheme
      ),
      home: Menu(),//Login(),
    );
  }

}

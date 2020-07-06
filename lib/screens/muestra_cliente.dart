import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:kloanapp/models/clientes.dart';
import 'package:kloanapp/utils/database_helper.dart';
import 'package:kloanapp/utils/theme.dart' as Themes;


class ClienteDetail extends StatefulWidget {
  final Clientes cliente;

  ClienteDetail(this.cliente);

  @override
  State<StatefulWidget> createState() => ClienteDetailState(this.cliente);
}

class ClienteDetailState extends State<ClienteDetail> {
  static var _estados = ['Activo', 'Inactivo'];
  static var _tipoCliente = ['Credito','Proyecto','Socio'];
  DatabaseHelper helper = DatabaseHelper();
  List<Clientes> clienteList; // Lista de clientes
  String appBarTitle;
  Clientes cliente;
  ClienteDetailState(this.cliente);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String correo = cliente.email ?? "No tiene correo";

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        backgroundColor: Themes.Colores.appBarGradientEnd,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              //NOMBRE
              Container(
                margin: EdgeInsets.all(1.0),
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.topCenter,
                height: 80,
                decoration: BoxDecoration(
                  color: Themes.Colores.appBarGradientStart,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  cliente.nombre,
                  style: Themes.TextStyles.appBarTitle,
                ),
              ),

              //DIRECCION
              Container(
                margin: EdgeInsets.only(
                    left: 1.0, top: 10.0, right: 1.0, bottom: 5.0),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.topCenter,
                height: 180,
                decoration: BoxDecoration(
                  color: Themes.Colores.appBarGradientStart,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Dirección",
                            style: Themes.TextStyles.LabelText,
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            cliente.direccion,
                            style: Themes.TextStyles.DetailText,
                          )),
                    ),
                  ],
                ),
              ),

              //TELEFONO
              Container(
                margin: EdgeInsets.only(
                    left: 1.0, top: 10.0, right: 1.0, bottom: 5.0),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.topCenter,
                height: 100,
                decoration: BoxDecoration(
                  color: Themes.Colores.appBarGradientStart,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Teléfono Trabajo",
                            style: Themes.TextStyles.LabelText,
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            cliente.telef_tra,
                            style: Themes.TextStyles.DetailText,
                          )),
                    ),
                  ],
                ),
              ),

              //EMAIL
              Container(
                margin: EdgeInsets.only(
                    left: 1.0, top: 10.0, right: 1.0, bottom: 5.0),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.topCenter,
                height: 100,
                decoration: BoxDecoration(
                  color: Themes.Colores.appBarGradientStart,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Correo",
                            style: Themes.TextStyles.LabelText,
                          )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            cliente.email ?? "Sin correo",
                            style: Themes.TextStyles.DetailText,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }


}
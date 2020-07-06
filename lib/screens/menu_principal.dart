import 'package:flutter/material.dart';
import 'package:kloanapp/utils/theme.dart' as Themes;
import 'package:kloanapp/screens/lista_clientes.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xFF0B0D24),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                /******************************************************************************/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    /********************/
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListaClientes('F')));*/
                          },
                          child: Container(
                              width: 180,
                              height: 100,
                              margin: EdgeInsets.only(top: 100, bottom: 90),
                              decoration: BoxDecoration(
                                color: Themes.Colores.appBarBackground,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 5.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              child: Container(
                                //padding: EdgeInsets.all(10.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Capital",
                                  style: Themes.TextStyles.LabelText,
                                ),
                              )),
                        ),
                      ],
                    ),
                    /********************/
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListaClientes('F')));*/
                          },
                          child: Container(
                              width: 180,
                              height: 100,
                              margin: EdgeInsets.only(top: 100, bottom: 90),
                              decoration: BoxDecoration(
                                color: Themes.Colores.appBarBackground,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 5.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Disponible en Caja",
                                  style: Themes.TextStyles.LabelText,
                                ),
                              )),
                        ),
                      ],
                    ),
                    /********************/
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemsList()));*/
                          },
                          child: Container(
                              width: 180,
                              height: 100,
                              margin: EdgeInsets.only(top: 100, bottom: 90),
                              decoration: BoxDecoration(
                                color: Themes.Colores.appBarBackground,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 5.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Ganancia Bruta",
                                  style: Themes.TextStyles.LabelText,
                                ),
                              )),
                        ),
                      ],
                    ),
                    /********************/
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemsList()));*/
                          },
                          child: Container(
                              width: 180,
                              height: 100,
                              margin: EdgeInsets.only(top: 100, bottom: 90),
                              decoration: BoxDecoration(
                                color: Themes.Colores.appBarBackground,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 5.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Ganancia Neta",
                                  style: Themes.TextStyles.LabelText,
                                ),
                              )),
                        ),
                      ],
                    ),
                    /********************/
                  ],
                ),
                /******************************************************************************/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    /********************/
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListaClientes()));
                          },
                          child: Container(
                              width: 150,
                              height: 100,
                              margin: EdgeInsets.only(top: 60),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Themes.Colores.appBarGradientEnd,
                                    Themes.Colores.appBarGradientEnd
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 5.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              child: Container(
                                //padding: EdgeInsets.all(10.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Clientes",
                                  style: Themes.TextStyles.LabelText,
                                ),
                              )),
                        ),
                      ],
                    ),
                    /********************/
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListaClientes('F')));*/
                          },
                          child: Container(
                              width: 150,
                              height: 100,
                              margin: EdgeInsets.only(top: 60),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Themes.Colores.appBarGradientEnd,
                                    Themes.Colores.appBarGradientEnd
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 5.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Presupuesto",
                                  style: Themes.TextStyles.LabelText,
                                ),
                              )),
                        ),
                      ],
                    ),
                    /********************/
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemsList()));*/
                          },
                          child: Container(
                              width: 150,
                              height: 100,
                              margin: EdgeInsets.only(top: 60),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Themes.Colores.appBarGradientEnd,
                                    Themes.Colores.appBarGradientEnd
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 5.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Gastos",
                                  style: Themes.TextStyles.LabelText,
                                ),
                              )),
                        ),
                      ],
                    ),
                    /********************/
                  ],
                ),

                /*********************************************************/
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListaClientes('C')));*/
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 60),
                              width: 150,
                              height: 100, //MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Themes.Colores.appBarGradientEnd,
                                    Themes.Colores.appBarGradientEnd
                                  ],
                                ),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 5.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Reportes",
                                  style: Themes.TextStyles.LabelText,
                                ),
                              )),
                        ),
                      ],
                    ),
                    /**************/
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            /*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListaClientes('C')));*/
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 60),
                              width: 150,
                              height: 100, //MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Themes.Colores.appBarGradientEnd,
                                    Themes.Colores.appBarGradientEnd
                                  ],
                                ),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 5.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Respaldo",
                                  style: Themes.TextStyles.LabelText,
                                ),
                              )),
                        ),
                      ],
                    ),
                    /**************/
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            /*
                            //Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Sincronizar()));*/
                          },
                          child: Container(
                              width: 150,
                              height: 100,
                              margin: EdgeInsets.only(top: 60),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Themes.Colores.appBarGradientEnd,
                                    Themes.Colores.appBarGradientEnd
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.indigo,
                                      blurRadius: 5.0,
                                      offset: Offset.zero)
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Salir",
                                  style: Themes.TextStyles.LabelText,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                /*********************************************************/

                /******************************************************************************/
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kloanapp/models/clientes.dart';
import 'package:kloanapp/screens/muestra_cliente.dart';
import 'package:kloanapp/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:kloanapp/utils/theme.dart' as Themes;

class ListaClientes extends StatefulWidget {
  ListaClientes();

  @override
  State<StatefulWidget> createState() => _ListaClientesState();
}

class _ListaClientesState extends State<ListaClientes> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Clientes> clienteList;
  List<Clientes> filterList;
  int count = 0;
  var searchview = new TextEditingController();
  bool _firstSearch = true;
  String _query = "";
  String estado;
  _ListaClientesState();
  var now = new DateTime.now();
  var formatDate = new DateFormat('ddMMyyyy');

  @override
  Widget build(BuildContext context) {
    searchview.addListener(() {
      if (searchview.text.isEmpty) {
        //Notify the framework that the internal state of this object has changed.
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = searchview.text;
        });
      }
    });
    if (clienteList == null) {
      clienteList = List<Clientes>();
      filterList = List<Clientes>();
      updateListView();
    }
    filterList = performSearch(clienteList, _query);

    return Scaffold(
        backgroundColor: Themes.Colores.appBarGradientEnd,
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Themes.Colores.appBarGradientStart,
                            Themes.Colores.appBarGradientEnd
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 80,
                              width: 140,
                              //margin: EdgeInsets.all(10),
                              padding: EdgeInsets.only(top: 40),
                              //color: Colors.red,
                              child: Text('Clientes',
                                  textAlign: TextAlign.center,
                                  style: Themes.TextStyles.LabelText),
                            ),
                          ),
                          Container(
                            height: 42,
                            child: TextField(
                              controller: searchview,
                              style: TextStyle(color: Colors.grey),
                              decoration: InputDecoration(
                                hintText: 'Buscar',
                                hintStyle: TextStyle(
                                    color: Color(0xFF757575), fontSize: 16),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Color(0xFF757575),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0),
                                //fillColor: Color(0xFFEEEEEE),
                                //filled: true
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _firstSearch
                  ? Flexible(
                      child: ListView.builder(
                        itemCount: clienteList.length,
                        itemBuilder: (BuildContext context, int position) {
                          return Card(
                            color: Themes.Colores.appBarGradientStart,
                            elevation: 2.0,
                            child: ListTile(
                                title: Text(
                                  clienteList[position].nombre,
                                  style: Themes.TextStyles.DetailText,
                                ),
                                onTap: () {
                                  navigationToDetail(
                                      context, clienteList[position]);
                                }),
                          );
                        },
                      ),
                    ) //createListView(clienteList)
                  : Flexible(
                      child: new ListView.builder(
                          itemCount: filterList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: Themes.Colores.appBarGradientStart,
                              elevation: 2.0,
                              child: ListTile(
                                  title: Text(
                                    filterList[index].nombre,
                                    style: Themes.TextStyles.DetailText,
                                  ),
                                  onTap: () {
                                    debugPrint("ListTile Tapped");
                                    navigationToDetail(
                                        context, filterList[index]);
                                  }),
                            );
                          }),
                    ) //performSearch(clienteList, _query)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('FAB clicked');
            navigationToDetail(
                context,
                Clientes('', '', '', 'CR', '', '', '', '', '', '', 'A', '',
                    formatDate.format(now), 0));
          },
          tooltip: 'Agregar Cliente',
          child: Icon(Icons.add),
        ));
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Clientes>> clienteListFuture =
          databaseHelper.getClienteList();
      clienteListFuture.then((clienteList) {
        setState(() {
          this.clienteList = clienteList;
          this.filterList = clienteList;
          this.count = clienteList.length;
        });
      });
    });
  }

  List performSearch(_clienteList, _query) {
    List _filterList = new List<Clientes>();
    for (int i = 0; i < _clienteList.length; i++) {
      var item = _clienteList[i];

      if (item.nombre.toLowerCase().contains(_query.toLowerCase())) {
        _filterList.add(item);
      }
    }
    return (_filterList);
  }

  void navigationToDetail(BuildContext context, Clientes cliente) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClienteDetail(cliente),
        ));
  }
}

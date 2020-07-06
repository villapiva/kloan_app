import 'package:flutter/material.dart';
import 'package:kloanapp/models/clientes.dart';
import 'package:kloanapp/utils/database_helper.dart';
import 'package:kloanapp/utils/theme.dart' as Themes;
import 'package:intl/intl.dart';

class ItemDetail extends StatefulWidget {
  final Clientes clientes;

  ItemDetail(this.clientes);

  @override
  State<StatefulWidget> createState() {
    return ItemDetailState(this.clientes);
  }
}

class ItemDetailState extends State<ItemDetail> {
  static var _estados = ['Activo', 'Inactivo'];
  static var _tipoCliente = ['Credito','Proyecto','Socio'];
  final _formKey = GlobalKey<FormState>();

  DatabaseHelper helper = DatabaseHelper();

  Clientes clientes;

  TextEditingController cedulaController = TextEditingController();
  TextEditingController nommbreController = TextEditingController();
  TextEditingController apellido1Controler = TextEditingController();
  TextEditingController apellido2Controler = TextEditingController();
  TextEditingController tipoControler = TextEditingController();
  TextEditingController direccionControler = TextEditingController();
  TextEditingController cuentaControler = TextEditingController();
  TextEditingController telhabControler = TextEditingController();
  TextEditingController telcelControler = TextEditingController();
  TextEditingController teltraControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController estadoControler = TextEditingController();
  TextEditingController lugartrabajoControler = TextEditingController();
  TextEditingController fechaingresoControler = TextEditingController();
  TextEditingController salarionetoControler = TextEditingController();

  ItemDetailState(this.clientes);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    cedulaController.text = clientes.cedula.toString();
    nommbreController.text = clientes.nombre;
    apellido1Controler.text = clientes.apellido1;
    apellido2Controler.text = clientes.apellido2;
    tipoControler.text = clientes.tipo_cliente;
    direccionControler.text = clientes.direccion;
    cuentaControler.text = clientes.cuenta;
    telhabControler.text = clientes.telef_hab;
    telcelControler.text = clientes.telef_cel;
    teltraControler.text = clientes.telef_tra;
    emailControler.text = clientes.email;
    estadoControler.text = clientes.estado;
    lugartrabajoControler.text = clientes.lugar_trabajo;
    fechaingresoControler.text = clientes.fecha_ingreso;
    salarionetoControler.text =clientes.salario_neto.toString();

    NumberFormat formatNumber = NumberFormat("###,##0.00", "pt-br");
    var now = new DateTime.now();
    var formatDate = new DateFormat('ddMMyyyy');

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        backgroundColor: Themes.Colores.appBarBackground,
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[

              //NOMBRE
              Container(
                margin: EdgeInsets.only(left: 1.0, top: 10.0),
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.topCenter,
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Themes.Colores.appBarDetailBackground,
                  //border: Border.all(),
                  borderRadius: BorderRadius.circular(5.0),

                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        offset: new Offset(0.0, 6.0))
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child:  TextField(
                    controller: cedulaController,
                    style: Themes.TextStyles.DetailText,
                    onChanged: (value) {
                      clientes.cedula = cedulaController.text;
                    },
                    decoration: InputDecoration(
                        labelText: 'Producto',
                        labelStyle: Themes.TextStyles.LabelText,
                        hintText: 'Nombre del producto'
                    ),
                  ),
                ),
              ),

              Row(
                children: <Widget>[
                  //EXISTENCIA
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Themes.Colores.appBarDetailBackground,
                        //border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: new Offset(0.0, 6.0))
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: existenciaControler,
                          style: Themes.TextStyles.DetailText,
                          keyboardType:
                          TextInputType.numberWithOptions(decimal: false),
                          onChanged: (value) {
                            item.existencias = int.parse(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'Existencia',
                            labelStyle: Themes.TextStyles.LabelText,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //ESTADO
                  Expanded(
                    child:
                    Container(
                      margin: EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.centerRight,
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Themes.Colores.appBarDetailBackground,
                        //border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: new Offset(0.0, 6.0))
                        ],
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: Themes.Colores.appBarBackground,
                        ),
                        child: ListTile(
                          title: DropdownButton(
                            items: _estados.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem));
                            }).toList(),
                            style: Themes.TextStyles.DetailText,
                            value: getEstado(item.estado),
                            onChanged: (valueSelectedByUser) {
                              setState(
                                    () {
                                  debugPrint('User selected $valueSelectedByUser');
                                  updateEstado(valueSelectedByUser);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  Expanded(
                    child:
                    //COSTO
                    Container(
                      margin: EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Themes.Colores.appBarDetailBackground,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: new Offset(0.0, 6.0))
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: costoControler,
                          style: Themes.TextStyles.DetailText,
                          keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value) {
                            item.costo = double.parse(value);
                            _costo = double.parse(value);
                            _util = double.parse(utilizacionControler.text);
                            _precio = ((_util * _costo) / 100) + _costo;
                            item.precio = _precio;
                            precioControler.text = _precio.toStringAsFixed(2);
                            precioControler.selection = TextSelection.collapsed(offset: 0);
                            setState(() {
                              FavoriteWidget(
                                UniqueKey(),
                                formatter.format(_precio),
                              );
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Costo',
                            labelStyle: Themes.TextStyles.LabelText,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //PORCENTAJE DE UTILIZACION
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0, top: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Themes.Colores.appBarDetailBackground,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: new Offset(0.0, 6.0))
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: utilizacionControler,
                          style: Themes.TextStyles.DetailText,
                          keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value) {
                            item.porc_util = double.parse(value);
                            _util = double.parse(value);
                            _costo = double.parse(costoControler.text);
                            _precio = ((_util * _costo) / 100) + _costo;
                            item.precio = _precio;
                            precioControler.text = formatter.format(_precio);
                            setState(() {
                              FavoriteWidget(
                                UniqueKey(),
                                formatter.format(_precio),
                              );
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Utilidad (%)',
                            labelStyle: Themes.TextStyles.LabelText,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              Row(
                children: <Widget>[
                  Expanded(
                    child:
                    //IMPUESTO
                    Container(
                      margin: EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Themes.Colores.appBarDetailBackground,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: new Offset(0.0, 6.0))
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextField(
                          controller: impuestoControler,
                          style: Themes.TextStyles.DetailText,
                          keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value) {
                            item.impuesto = double.parse(value);
                          },
                          decoration: InputDecoration(
                            labelText: 'Impuesto (%)',
                            labelStyle: Themes.TextStyles.LabelText,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                    //EXENTO S/N
                    Container(
                      margin: EdgeInsets.only(left: 5.0, top: 10.0),
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.topCenter,
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Themes.Colores.appBarDetailBackground,
                        //border: Border.all(),
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: new Offset(0.0, 6.0))
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.0, top: 10.0),
                        child: CheckboxListTile(
                          title: Text(
                            'Exento',
                            style: Themes.TextStyles.DetailText,
                          ),
                          value: GetExento(item.exento),
                          onChanged: (newValue) {
                            actualizaExento(newValue);
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  //PRECIO
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5.0, top: 10.0),
                      padding: EdgeInsets.all(10.0),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Themes.Colores.appBarDetailBackground,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: new Offset(0.0, 6.0))
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('₡  ' +
                              formatter.format(_precio),
                            style: TextStyle(color: Colors.teal, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),


              //SALVAR Y BORRAR
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 24.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Guardar',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Save button clicked");
                            _save();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 24.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Borrar',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            _delete();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  GetExento(String estado) {
    bool _checkedValue;
    switch (estado) {
      case 'S':
        _checkedValue = true;
        break;
      case 'N':
        _checkedValue = false;
        break;
    }
    return _checkedValue;
  }

  void actualizaExento(bool isChecked) {
    _checkedValue = isChecked;
    setState(() {
      if (isChecked) {
        item.exento = 'S';
      } else {
        item.exento = 'N';
      }
    });
  }

  void updateEstado(String value) {
    switch (value) {
      case 'Activo':
        item.estado = 'A';
        break;
      case 'Inactivo':
        item.estado = 'I';
        break;
    }
  }

  void _save() async {
    moveToLastScreen();

    int result;

    if (item.item != null) {
      // case 1 : update data
      result = await helper.updateItem(item);
    } else {
      //case 2: Insert data
      result = await helper.insertItem(item);
    }

    if (result != 0) {
      //success
      _showSnackBar(context, 'Registro guardado exitosamente');
    } else {
      //not success
      _showSnackBar(context, 'Error al guardar registro');
    }
  }

  void _delete() async {
    moveToLastScreen();

    //Case 1: Delete new note
    if (item.item == null) {
      _showSnackBar(context, 'Error al borrar registro');
      return;
    }

    //case 2: Delete note having valid ID
    int cont = await helper.getItemFactura(item.item);
    if (cont > 0) {
      _showSnackBar(
          context, 'El producto tiene registros asociados, no se puede borrar');
    } else {
      int result = await helper.deleteItems(item.item);
      if (result != 0) {
        //success
        _showSnackBar(context, 'Producto eliminado exitosamente');
      } else {
        //not success
        _showSnackBar(context, 'Error al aliminar producto');
      }
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

// convert int priority into String during display

  String getEstado(String value) {
    String estado;
    switch (value) {
      case 'A':
        estado = _estados[0]; //Activo
        break;

      case 'I':
        estado = _estados[1]; //Inactivo
        break;
    }
    return estado;
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  showAlertDialog(BuildContext context, String title, String content) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        debugPrint("Borrado");
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  final String PrecioText;
  final Key key;

  FavoriteWidget(@required this.key, this.PrecioText);

  @override
  State<StatefulWidget> createState() =>
      _FavoriteWidgetState(this.PrecioText, key);
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  String PrecioText;
  final Key key;

  _FavoriteWidgetState(this.PrecioText, @required this.key);

  // ···
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 5.0, top: 10.0),
        padding: EdgeInsets.all(10.0),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Themes.Colores.appBarDetailBackground,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                offset: new Offset(0.0, 6.0))
          ],
        ),
        child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "$PrecioText",
              style: TextStyle(color: Colors.teal, fontSize: 30),
            )),
      ),
    );
  }
}
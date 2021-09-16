import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kloanapp/models/clientes.dart';
import 'package:kloanapp/utils/database_helper.dart';
import 'package:kloanapp/utils/theme.dart' as Themes;
import 'package:intl/intl.dart';


class incluyeCliente extends StatefulWidget {
  final Clientes clientes;

  incluyeCliente(this.clientes);

  @override
  State<StatefulWidget> createState() {
    return incluyeClienteState(this.clientes);
  }
}

// ignore: camel_case_types
class incluyeClienteState extends State<incluyeCliente> {
  static var _estados = ['Activo', 'Inactivo'];
  static var _tipoCliente = ['Credito', 'Proyecto', 'Socio'];
  final _formKey = GlobalKey<FormState>();
  _NumberTextInputFormatter _phoneNumberFormatter =
  _NumberTextInputFormatter();

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

  incluyeClienteState(this.clientes);

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
    salarionetoControler.text = clientes.salario_neto.toString();

    NumberFormat formatNumber = NumberFormat("###,##0.00", "pt-br");
    var now = new DateTime.now();
    var formatDate = new DateFormat('dd-MM-yyyy');
    DateTime selectedDate = DateTime.now() ;
    bool estado = false;

    return WillPopScope(
      onWillPop: () {
        moveToLastScreen();
      },
      child: Scaffold(
        backgroundColor: Themes.Colores.appBarBackground,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[
                //CEDULA
                Row(
                  children: <Widget>[
                    Expanded(
                      child:                 Container(
                        margin:
                        EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.topCenter,
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Themes.Colores.appBarDetailBackground,
                          //border: Border.all(),
                          borderRadius: BorderRadius.circular(5.0),
                        ),

                        child: TextFormField(
                          controller: cedulaController,
                          style: Themes.TextStyles.DetailText,
                          decoration: InputDecoration(
                              labelText: 'Cédula',
                              labelStyle: Themes.TextStyles.LabelText,
                              hintText: 'Número de cédula',
                              hintStyle: Themes.TextStyles.HintText),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Debe digitar cédula';
                            }
                          },
                          onChanged:
                              (value) {
                            clientes.cedula = int.parse(value);
                          },
                        ),
                      ),
                    ),
                    // FECHA INGRESO
                    Expanded(
                      child:                 Container(
                        margin:
                        EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.topCenter,
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Themes.Colores.appBarDetailBackground,
                          //border: Border.all(),
                          borderRadius: BorderRadius.circular(5.0),
                        ),

                        child: TextFormField(
                          controller: fechaingresoControler,
                          style: Themes.TextStyles.DetailText,
                          decoration: InputDecoration(
                              labelText: 'Fecha',
                              labelStyle: Themes.TextStyles.LabelText,
                              hintText: 'Fecha de ingreso',
                              hintStyle: Themes.TextStyles.HintText),
                          keyboardType: TextInputType.datetime,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Debe digitar cédula';
                            }
                          },
                          onTap: (){
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2010),
                                lastDate: DateTime(2030)
                            ).then((date) {
                              setState(() {
                                fechaingresoControler.text = formatDate.format(date);
                              });
                            });
                          },
                          onChanged:
                              (value) {
                            clientes.cedula = int.parse(value);
                          },
                        ),
                      ),
                    ),
                    //TIPO CLIENTE CR = credito, PR = proyecto, SO = socio
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.centerRight,
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Themes.Colores.appBarDetailBackground,
                          borderRadius: BorderRadius.circular(5.0),
                        ),

                        child: Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Themes.Colores.appBarBackground,
                          ),
                          child: ListTile(
                            title: DropdownButton(
                              items: _tipoCliente.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(dropDownStringItem));
                              }).toList(),
                              style: Themes.TextStyles.DetailText,
                              value: getTipoCliente(clientes.tipo_cliente),
                              onChanged: (valueSelectedByUser) {
                                setState(
                                      () {
                                    debugPrint(
                                        'User selected $valueSelectedByUser');
                                    updateTipoCliente(valueSelectedByUser);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    //ESTADO
                    Expanded(
                      child: Container(
                        margin:
                        EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.centerRight,
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Themes.Colores.appBarDetailBackground,
                          //border: Border.all(),
                          borderRadius: BorderRadius.circular(5.0),
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
                              value: getEstado(clientes.estado),
                              onChanged: (valueSelectedByUser) {
                                setState(
                                      () {
                                    debugPrint(
                                        'User selected $valueSelectedByUser');
                                    updateEstado(valueSelectedByUser);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                  ]
                ),
                /**********************************/
                //CLIENTE APELLIDO1 APELLIDO2
                /**********************************/
                Row(
                  children: <Widget>[
                    //NOMBRE DE CLIENTE
                    Expanded(
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                        padding: EdgeInsets.all(10.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Themes.Colores.appBarDetailBackground,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                          child: TextFormField(
                            controller: nommbreController,
                            style: Themes.TextStyles.DetailText,
                            onChanged: (value) {
                              clientes.nombre = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Cliente',
                              labelStyle: Themes.TextStyles.LabelText,
                                hintText: 'Nombre del cliente',
                                hintStyle: Themes.TextStyles.HintText
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Digitar nombre del cliente';
                              }
                            },
                          ),
                      ),
                    ),
                    Expanded(
                      child:
                          //Apellido1
                          Container(
                        margin:
                            EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                        padding: EdgeInsets.all(10.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Themes.Colores.appBarDetailBackground,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: apellido1Controler,
                            style: Themes.TextStyles.DetailText,
                            onChanged: (value) {
                              clientes.apellido1 = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Apellido 1',
                              labelStyle: Themes.TextStyles.LabelText,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Digitar apellido';
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                      //Apellido2
                      Container(
                        margin:
                        EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                        padding: EdgeInsets.all(10.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Themes.Colores.appBarDetailBackground,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: apellido2Controler,
                            style: Themes.TextStyles.DetailText,
                            onChanged: (value) {
                              clientes.apellido2 = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Apellido 2',
                              labelStyle: Themes.TextStyles.LabelText,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Digitar apellido';
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                /**********************************/
                // TELEFONOS
                /**********************************/
                Row(
                  children: <Widget>[
                    //TELEFONO HABITACION
                    Expanded(
                      child: Container(
                        margin:
                        EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                        padding: EdgeInsets.all(10.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Themes.Colores.appBarDetailBackground,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextFormField(
                          controller: telhabControler,
                          style: Themes.TextStyles.DetailText,
                          onChanged: (value) {
                            clientes.telef_hab = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Tel. habitación',
                              labelStyle: Themes.TextStyles.LabelText,
                              hintText: 'Número teléfono habitación',
                              hintStyle: Themes.TextStyles.HintText
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Digitar teléfono habitación';
                            }
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                      //TEL CELULAR
                      Container(
                        margin:
                        EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                        padding: EdgeInsets.all(10.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Themes.Colores.appBarDetailBackground,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: telcelControler,
                            style: Themes.TextStyles.DetailText,
                            onChanged: (value) {
                              clientes.telef_cel = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Tel. celular',
                              labelStyle: Themes.TextStyles.LabelText,
                                hintText: 'Número teléfono celular',
                                hintStyle: Themes.TextStyles.HintText
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Digitar teléfono celular';
                              }
                            },
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child:
                      //TEL TRABAJO
                      Container(
                        margin:
                        EdgeInsets.only(left: 2.0, right: 5.0, top: 10.0),
                        padding: EdgeInsets.all(10.0),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Themes.Colores.appBarDetailBackground,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: teltraControler,
                            style: Themes.TextStyles.DetailText,
                            onChanged: (value) {
                              clientes.telef_tra = value;
                            },
                            decoration: InputDecoration(
                              labelText: 'Tel. Trabajo',
                              labelStyle: Themes.TextStyles.LabelText,
                                hintText: 'Número teléfono trabajo',
                                hintStyle: Themes.TextStyles.HintText
                            ),
                            keyboardType: TextInputType.phone,
                              //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,_phoneNumberFormatter], // Only numbers can be entered
                          ),
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
                              if(_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                              }
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

  void updateEstado(String value) {
    switch (value) {
      case 'Activo':
        clientes.estado = 'A';
        break;
      case 'Inactivo':
        clientes.estado = 'I';
        break;
    }
  }

  void updateTipoCliente(String value) {
    // CR = credito, PR = proyecto, SO = socio
    switch (value) {
      case 'Credito':
        clientes.tipo_cliente = 'CR';
        break;
      case 'Proyecto':
        clientes.tipo_cliente = 'PR';
        break;
      case 'Socio':
        clientes.tipo_cliente = 'SO';
        break;
    }
  }

  void _save() async {
    //moveToLastScreen();

    int result;

    if (clientes.cedula != null) {
      // case 1 : update data
      result = await helper.insertCliente(clientes);
    } else {
      //case 2: Insert data
      result = await helper.updateCliente(clientes);
    }

    if (result != 0) {
      //success
      _showSnackBar(context, 'Registro guardado exitosamente');
    } else {
      //not success
      _showSnackBar(context, 'Error al guardar registro');
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }


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


  String getTipoCliente(String value) {
    // CR = credito, PR = proyecto, SO = socio
    String tipo;
    switch (value) {
      case 'CR':
        tipo = _tipoCliente[0]; //credito
        break;
      case 'PR':
        tipo = _tipoCliente[1]; //proyecto
        break;
      case 'SO':
        tipo = _tipoCliente[2]; //socio
        break;
    }
    return tipo;
  }
  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

}

class _NumberTextInputFormatter extends TextInputFormatter {

  _NumberTextInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();

    if (newTextLength >= 5) {
      newText.write(
          newValue.text.substring(0, usedSubstringIndex = 4) + '-');
      if (newValue.selection.end >= 9) selectionIndex++;
    }


    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

class Clientes{
  int _Cedula;
  String _Nombre;
  String _Apellido1;
  String _Apellido2;
  String _Tipo_cliente;  // CR = credito, PR = proyecto, SO = socio
  String _Direccion;
  String _Cuenta;
  String _Telef_hab;
  String _Telef_cel;
  String _Telef_tra;
  String _email;
  String _Estado;     //A = Activo I = Inactivo
  String _Lugar_trabajo;
  String _Fecha_ingreso;
  double _Salario_neto;

  Clientes(this._Nombre, this._Apellido1,this._Apellido2,this._Tipo_cliente,this._Direccion,this._Cuenta,this._Telef_hab,
      this._Telef_cel,this._Telef_tra,this._email,this._Estado,this._Lugar_trabajo,this._Fecha_ingreso,this._Salario_neto);

  Clientes.withID(this._Cedula, this._Nombre, this._Apellido1,this._Apellido2,this._Tipo_cliente,this._Direccion,this._Cuenta,
      this._Telef_hab,this._Telef_cel,this._Telef_tra,this._email,this._Estado,this._Lugar_trabajo,this._Fecha_ingreso,this._Salario_neto);

  int get cedula => _Cedula;
  String get nombre => _Nombre;
  String get apellido1 => _Apellido1;
  String get apellido2 => _Apellido2;
  String get tipo_cliente => _Tipo_cliente;
  String get direccion => _Direccion;
  String get cuenta => _Cuenta;
  String get telef_hab => _Telef_hab;
  String get telef_cel => _Telef_cel;
  String get telef_tra => _Telef_tra;
  String get email => _email;
  String get estado => _Estado;
  String get lugar_trabajo => _Lugar_trabajo;
  String get fecha_ingreso => _Fecha_ingreso;
  double get salario_neto => _Salario_neto;

  set cedula(int newCedula){
    this._Cedula = newCedula;
  }

  set nombre(String newNombre){
    this._Nombre = newNombre;
  }

  set apellido1(String newApellido1){
    this._Apellido1 = newApellido1;
  }

  set apellido2(String newApellido2){
    this._Apellido2 = newApellido2;
  }

  set tipo_cliente(String newTipo_cliente){
    this._Tipo_cliente = newTipo_cliente;
  }

  set direccion(String newDireccion){
    this._Direccion = newDireccion;
  }

  set cuenta(String newCuenta){
    this._Cuenta = newCuenta;
  }

  set telef_hab(String newTelef_hab){
    this._Telef_hab = newTelef_hab;
  }

  set telef_cel(String newTelef_cel){
    this._Telef_cel = newTelef_cel;
  }

  set telef_tra(String newTelef_tra){
    this._Telef_tra = newTelef_tra;
  }

  set email(String newEmail){
    this._email = newEmail;
  }

  set estado(String newEstado){
    this._Estado = newEstado;
  }

  set lugar_trabajo(String newLugar_trabajo) {
    _Lugar_trabajo = newLugar_trabajo;
  }

  set fecha_ingreso (String newFecha_ingreso){
    _Fecha_ingreso = newFecha_ingreso;
  }

  set salario_neto(double newSalario_neto){
    _Salario_neto = newSalario_neto;
  }

  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();

    if (cedula != null) {
      map['cedula'] = _Cedula;
    }
    map['nombre'] = _Nombre;
    map['apellido1'] = _Apellido1;
    map['apellido2'] = _Apellido2;
    map['tipo_cliente'] = _Tipo_cliente;
    map['direccion'] = _Direccion;
    map['cuenta'] = _Cuenta;
    map['telef_hab'] = _Telef_hab;
    map['telef_cel'] = _Telef_cel;
    map['telef_tra'] = _Telef_tra;
    map['email'] = _email;
    map['estado'] = _Estado;
    map['lugar_trabajo'] = _Lugar_trabajo;
    map['fecha_ingreso'] = _Fecha_ingreso;
    map['salario_neto'] = _Salario_neto;

  return map;
  }

  Clientes.fromMapObject(Map<String, dynamic> map) {
    this._Cedula =  map['cedula'];
    this._Nombre = map['nombre'];
    this._Apellido1 = map['apellido1'];
    this._Apellido2 = map['apellido2'];
    this._Tipo_cliente = map['tipo_cliente'];
    this._Direccion = map['direccion'];
    this._Cuenta = map['cuenta'];
    this._Telef_hab = map['telef_hab'];
    this._Telef_cel = map['telef_cel'];
    this._Telef_tra = map['telef_tra'];
    this._email = map['email'];
    this._Estado = map['estado'];
    this._Lugar_trabajo = map['lugar_trabajo'];
    this._Fecha_ingreso = map['fecha_ingreso'];
    this._Salario_neto = map['salario_neto'];
  }

}
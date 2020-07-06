class Referencias{
  int _Cedula;
  String _Nombre;
  String _Apellido1;
  String _Apellido2;
  String _Direccion;
  String _Telef_hab;
  String _Telef_cel;
  String _Telef_tra;
  String _Estado;
  String _Lugar_trabajo;


  Referencias(this._Nombre, this._Apellido1,this._Apellido2,this._Direccion,
      this._Telef_hab,this._Telef_cel,this._Telef_tra,this._Estado,this._Lugar_trabajo);

  Referencias.withID(this._Cedula, this._Nombre, this._Apellido1,this._Apellido2,this._Direccion,
      this._Telef_hab,this._Telef_cel,this._Telef_tra,this._Estado,this._Lugar_trabajo);

  int get cedula => _Cedula;
  String get nombre => _Nombre;
  String get apellido1 => _Apellido1;
  String get apellido2 => _Apellido2;
  String get direccion => _Direccion;
  String get telef_hab => _Telef_hab;
  String get telef_cel => _Telef_cel;
  String get telef_tra => _Telef_tra;
  String get estado => _Estado;
  String get lugar_trabajo => _Lugar_trabajo;


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

  set direccion(String newDireccion){
    this._Direccion = newDireccion;
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

  set estado(String newEstado){
    this._Estado = newEstado;
  }

  set lugar_trabajo(String newLugar_trabajo) {
    _Lugar_trabajo = newLugar_trabajo;
  }

  Map<String, dynamic> toMap(){

    var map = Map<String, dynamic>();

    if (cedula != null) {
      map['cedula'] = _Cedula;
    }
    map['nombre'] = _Nombre;
    map['apellido1'] = _Apellido1;
    map['apellido2'] = _Apellido2;
    map['direccion'] = _Direccion;
    map['telef_hab'] = _Telef_hab;
    map['telef_cel'] = _Telef_cel;
    map['telef_tra'] = _Telef_tra;
    map['estado'] = _Estado;
    map['lugar_trabajo'] = _Lugar_trabajo;

    return map;
  }

  Referencias.fromMapObject(Map<String, dynamic> map) {
    this._Cedula =  map['cedula'];
    this._Nombre = map['nombre'];
    this._Apellido1 = map['apellido1'];
    this._Apellido2 = map['apellido2'];
    this._Direccion = map['direccion'];
    this._Telef_hab = map['telef_hab'];
    this._Telef_cel = map['telef_cel'];
    this._Telef_tra = map['telef_tra'];
    this._Estado = map['estado'];
    this._Lugar_trabajo = map['lugar_trabajo'];
  }



}
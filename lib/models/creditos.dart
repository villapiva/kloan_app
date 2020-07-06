class Creditos{
  int _Cliente;
  double _Monto;
  String _Fecha;
  double _Tasa;        // tasa porcentual
  String _Periodicidad;  // S = Semanal - Q = Quincenal
  String _Garantias;  // texto indicando las garantías prendarias
  String _MetodoCalculo; // PAD = por adelatado o POS = posterior
  int _Plazo;         // cantidad en meses
  double _Saldo;
  double _Cuota;

  Creditos(this._Monto, this._Fecha, this._Tasa, this._Periodicidad, this._Garantias,
      this._MetodoCalculo, this._Plazo, this._Saldo, this._Cuota);

  Creditos.withID(this._Cliente,this._Monto, this._Fecha, this._Tasa, this._Periodicidad, this._Garantias,
      this._MetodoCalculo, this._Plazo, this._Saldo, this._Cuota);

  int get cliente => _Cliente;
  double get monto => _Monto;
  String get fecha => _Fecha;
  double get tasa => _Tasa;
  String get periodicidad => _Periodicidad;
  String get garantias => _Garantias;
  String get metodoCalculo => _MetodoCalculo;
  int get plazo => _Plazo;
  double get saldo => _Saldo;
  double get cuota => _Cuota;

  set cliente(int newCliente){
    this._Cliente = newCliente;
  }

  set monto(double newMonto){
    this._Monto = newMonto;
  }

  set fecha(String newFecha){
    this._Fecha = newFecha;
  }

  set tasa(double newTasa){
    this._Tasa = newTasa;
  }

  set periodicidad(String newPeriodicidad){
    this._Periodicidad = newPeriodicidad;
  }

  set garantias(String newGarantias){
    if (newGarantias.length <= 255){
      this._Garantias = newGarantias;
    }
  }

  set metodoCalculo(String newMetodoCalculo){
    this._MetodoCalculo = newMetodoCalculo;
  }

  set plazo(int newPlazo){
    this._Plazo = newPlazo;
  }

  set saldo(double newSaldo){
    this._Saldo = newSaldo;
  }

  set cuota(double newCuota){
    this._Cuota = newCuota;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if (cliente != null) {
      map['cliente'] = _Cliente;
    }
    map['monto'] = _Monto;
    map['fecha'] = _Fecha;
    map['tasa'] = _Tasa;
    map['periodicidad'] = _Periodicidad;
    map['garantias'] = _Garantias;
    map['metodoCalculo'] = _MetodoCalculo;
    map['plazo'] = _Plazo;
    map['saldo'] = _Saldo;
    map['cuota'] = _Cuota;

    return map;
  }

  Creditos.fromMapObject(Map<String, dynamic> map) {
    this._Cliente = map['cliente'];
    this._Monto = map['monto'];
    this._Fecha = map['fecha'];
    this._Tasa = map['tasa'];
    this._Periodicidad = map['periodicidad'];
    this._Garantias = map['garantias'];
    this._MetodoCalculo = map['metodoCalculo'];
    this._Plazo = map['plazo'];
    this._Saldo = map['saldo'];
    this._Cuota = map['cuota'];
  }


}
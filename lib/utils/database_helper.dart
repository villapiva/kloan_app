import 'package:kloanapp/models/referencias.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:kloanapp/models/clientes.dart';
import 'package:kloanapp/models/referencias.dart';


class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //Singleton DBHelper
  static Database _database;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'kloan.db';

    //create DB at given path

    var notesDatabase = await openDatabase(
        path,
        version: 1,
        onCreate: _onCreateDb,
        //onUpgrade: _onUpgrade
    );
    return notesDatabase;
  }

  void _onCreateDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE clientes('
            'cedula       INTEGER PRIMARY KEY, '
            'nombre       TEXT, '
            'apellido1    TEXT, '
            'apellido2    TEXT, '
            'tipo_cliente TEXT, '
            'direccion    TEXT, '
            'cuenta       TEXT, '
            'telef_hab    TEXT, '
            'telef_cel    TEXT, '
            'telef_tra    TEXT, '
            'email        TEXT, '
            'lugar_trabajo TEXT, '
            'fecha_ingreso TEXT, '
            'salario_neto DOUBLE, '
            'estado       TEXT)'
    );

    await db.execute(
        'CREATE TABLE referencias ( '
            'cedula       INTEGER, '
            'cedrefer     INTEGER, '
            'nombre       TEXT, '
            'apellido1    TEXT, '
            'apellido2    TEXT, '
            'direccion    TEXT, '
            'telef_hab    TEXT, '
            'telef_cel    TEXT, '
            'telef_tra    TEXT, '
            'lugar_trabajo TEXT, '
            'estado TEXT, '
            'PRIMARY KEY ( '
            'cedula, '
            'cedrefer '
            '), '
            'FOREIGN KEY ( '
            'cedula '
            ') '
            'REFERENCES clientes (cedula)) '
    );
  }
  //****************************************************************************
  // Operaciones CRUD para CLIENTES
  //****************************************************************************

    //INSERT
    Future<int> insertCliente(Clientes cliente) async {
      Database db = await this.database;

      var result = await db.insert('clientes', cliente.toMap());
      return result;
    }

    //UPDATE
    Future<int> updateCliente(Clientes clientes) async {
      var db = await this.database;

      var result = await db.update(
          'clientes', clientes.toMap(), where: 'cedula = ? ',
          whereArgs: [clientes.cedula]);
      return result;
    }

    //DELETE
    Future<int> deleteCliente(int id) async {
      var db = await this.database;

      var result = await db.rawDelete(
          'DELETE FROM clientes WHERE cedula = $id ');
      return result;
    }

    //QUERY
    Future<List<Map<String, dynamic>>> getClientesMapList() async {
      Database db = await this.database;

      var result = await db.query('clientes', orderBy: 'nombre ASC');
      return result;
    }

    Future<List<Clientes>> getClienteList() async {
      var clienteMapList = await getClientesMapList();
      int count = clienteMapList.length;

      List<Clientes> clienteList = List<Clientes>();

      for (int i = 0; i < count; i++) {
        clienteList.add(Clientes.fromMapObject(clienteMapList[i]));
      }
      return clienteList;
    }

  //****************************************************************************
  // Operaciones CRUD para REFERENCIAS
  //****************************************************************************

  //INSERT
  Future<int> insertReferencia(Referencias referencias) async {
    Database db = await this.database;

    var result = await db.insert('referencias', referencias.toMap());
    return result;
  }

  //UPDATE
  Future<int> updateReferencia(Referencias referencias) async {
    var db = await this.database;

    var result = await db.update(
        'referencias', referencias.toMap(), where: 'cedula = ? ',
        whereArgs: [referencias.cedula]);
    return result;
  }

  //DELETE
  Future<int> deleteReferencia(int id1, int id2) async {
    var db = await this.database;

    var result = await db.rawDelete(
        'DELETE FROM referencias WHERE cedula = $id1 and cedrefer = $id2 ');
    return result;
  }

  //QUERY
  Future<List<Map<String, dynamic>>> getReferMapList() async {
    Database db = await this.database;

    var result = await db.query('referencias', orderBy: 'nombre ASC');
    return result;
  }

  Future<List<Referencias>> getReferList() async {
    var referMapList = await getReferMapList();
    int count = referMapList.length;

    List<Referencias> referList = List<Referencias>();

    for (int i = 0; i < count; i++) {
      referList.add(Referencias.fromMapObject(referMapList[i]));
    }
    return referList;
  }

}
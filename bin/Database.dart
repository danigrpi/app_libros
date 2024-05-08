import 'package:mysql1/mysql1.dart';

class Database{
  //Propiedades
  final String _host = 'Localhost';
  final int _port = 3306;
  final String _user = 'root';

  //Métodos
  instalacion() async {
    var setting = ConnectionSettings(
      host: this._host,
      port: this._port,
      user: this._user,
    );
    var conn = await MySqlConnection.connect(setting);
    try {
      await _crearDB(conn);
      await _crearTablaUsuarios(conn);
      await _crearTablaLibros(conn);
    } catch (e) {
      print(e);
    }
  }

   _crearDB(conn) async {
    await conn.query('CREATE DATABASE IF NOT EXISTS tiendadb');
    await conn.query('USE tiendadb');
    print('Conectado a tiendadb');
  }

  _crearTablaUsuarios(conn) async {
    await conn.query(''' CREATE TABLE IF NOT EXISTS usuarios(
        idusuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL UNIQUE,
        password VARCHAR(10) NOT NULL
      )''');
    print('Tabla de usuario creada');
  }

  _crearTablaLibros(conn) async{
    await conn.query('''CREATE TABLE IF NOT EXISTS libros(
        idlibro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        titulo VARCHAR(50) NOT NULL,
        genero VARCHAR(50) NOT NULL,
        autor VARCHAR(50) NOT NULL,
        precio VARCHAR(5) NOT NULL
    )''');
    print('Tabla de libros creada');
  }

  Future<MySqlConnection> conexion() async {
    var setting = /*new*/ ConnectionSettings(host: this._host, port: this._port, user: this._user, db: 'tiendadb');
    return await MySqlConnection.connect(setting);
  }
}
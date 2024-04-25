import 'Database.dart';
import 'package:mysql1/mysql1.dart';

class Usuario {
  int? _idusuario;
  String? _nombre;
  String? _password;

  int? get idusuario {
    return this._idusuario;
  }

  String? get nombre {
    return this._nombre;
  }

  set nombre(String? texto) => this._nombre = texto;

  String? get password {
    return this._password;
  }

  set password(String? texto) => this._password = texto;

  Usuario();
  Usuario.fromMap(ResultRow map) {
    this._idusuario = map['idusuario'];
    this._nombre = map['nombre'];
    this._password = map['password'];
  }

  insertarUsuario() async {
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO usuarios(nombre,password) VALUES (?,?)', [
        _nombre,
        _password
      ]);
      print('Bienvenido $nombre!');
    } catch (e) {
    } finally {
     
    }
  }

  all() async {
    var conn = await Database().conexion();
    try {
      var listado = await conn.query('SELECT * FROM usuarios');
      List<Usuario> usuarios = listado.map((row) => Usuario.fromMap(row)).toList();
      return usuarios;
    } catch (e) {
      print(e);
    } finally {
     
    }
  }
}
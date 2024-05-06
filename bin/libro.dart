import 'package:mysql1/mysql1.dart';
import 'Database.dart';

class Libro{
  int? idlibro;
  List<String> titulo = [];
  List<String> genero = [];
  List <String> autor = [];

  Libro();
  Libro.fromMap(ResultRow map) {
    this.idlibro = map['idlibro'];
    this.titulo = map['titulo'];
    this.genero = map['genero'];
    this.autor = map['autor'];
  }
  
  all(int? id) async {
    var conn = await Database().conexion();
    try {
      var resultado = await conn.query('SELECT * FROM libros WHERE idusuario = ?', [
        id
      ]);
      List<Libro> mascotas = resultado.map((row) => Libro.fromMap(row)).toList();
      return mascotas;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }    
} 
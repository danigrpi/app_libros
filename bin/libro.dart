import 'package:mysql1/mysql1.dart';
import 'Database.dart';

class Libro{
  //Propiedades
  int? idlibro;
  String? titulo;
  String? genero;
  String? autor;
  String? precio;

  //Constructores
  Libro();
  Libro.fromMap(ResultRow map) {
    this.idlibro = map['idlibro'];
    this.titulo = map['titulo'];
    this.genero = map['genero'];
    this.autor = map['autor'];
    this.precio = map['precio'];
  }
  //Métodos
  all() async {
    var conn = await Database().conexion();
    try {
      var resultado = await conn.query('SELECT * FROM libros');
      List<Libro> libro = resultado.map((row) => Libro.fromMap(row)).toList();
      return libro;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }    
} 
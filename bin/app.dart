import 'dart:io';
import 'Libro.dart';
import 'Usuario.dart';

class App{
  String? respuesta;
  menuInicial() {
    do {
      stdout.writeln('''Buenas! Elige una opción para saber si has frecuentado esta tienda!
    1 -> Crear usuario
    2 -> login''');
      respuesta = stdin.readLineSync();
    } while (respuesta != '1' && respuesta != '2');
    
    switch (respuesta) {
      case '1':
        crearUsuario();
        break;
      case '2':
        login();
        break;
    }
  }
  

  crearUsuario() {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce un nombre');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una contraseña');
    usuario.password = stdin.readLineSync();
    usuario.insertarUsuario();
    stdout.writeln('Bienvenido ${usuario.nombre}, esperamos que encuentre el producto de su agrado!');
    menuInicial();   
  }

   login() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de usuario:');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu contraseña:');
    usuario.password = stdin.readLineSync();
    var resultado = await usuario.loginUsuario();
    if (resultado == false) {
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
    }
  }
  

  menulogin()async {
    (Usuario usuario) async {
    String? respuesta;
    do {
      stdout.writeln('''Bienvenido de nuevo ${usuario.nombre}, ¿que desea hacer?
    1 -> Listar libros
    2 -> Comprar un libro
    3 -> Salir''');
      respuesta = stdin.readLineSync();
    } while (respuesta != '1' && respuesta != '2' && respuesta != '3');
    };

  }

  listarLibros(int? id, Usuario usuario) async {
    var listadoLibros = await Libro().all(id);
    for (Libro elemento in listadoLibros) {
      stdout.writeln('${elemento.idlibro} -> ${elemento.titulo} -> ${elemento.genero} -> {$elemento.autor}');
    }
  }
}

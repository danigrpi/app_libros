import 'dart:io';
import 'Libro.dart';
import 'Usuario.dart';

class App{
  String? respuesta;
  menuInicial() async{
    do {
      stdout.writeln('''Buenas! Elige una opción para saber si has frecuentado esta tienda!
    1 -> Crear usuario
    2 -> login
    3 -> Salir''');
      respuesta = stdin.readLineSync();
    } while (respuesta != '1' && respuesta != '2' && respuesta != '3');
      switch (respuesta) {
      case '1':
        await crearUsuario();
        break;
      case '2':
        await login();
        break;
        case '3':
        print('Hasta pronto!');
      default:
        print('Opción no válida');
    }
  }
  

  crearUsuario() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce un nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce una constraseña');
    usuario.password = stdin.readLineSync();
    usuario.password = usuario.password;
    await usuario.insertarUsuario();
    menuInicial();
  }

   login() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de usuario:');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu contraseña:');
    usuario.password = stdin.readLineSync();
    var resultado = await usuario.loginUsuario();
    if (resultado == true){
    stdout.writeln('Bienvenido de nuevo ${usuario.nombre}, esperamos que encuentre lo que desea');
    } else if (resultado == false) {
      stdout.writeln('Lo sentimos, pero no constamos con su usuario en estos momentos ');
    } else {
      menuLogin(resultado);
    }
  }
  

  menuLogin(Usuario usuario) async {
    String? nombre = usuario.nombre;
    String? respuesta;
    do{
      stdout.writeln('''Hola, $nombre, elige una opción
      1 -> Listar libros
      2 -> Comprar libros
      3 -> Salir''');
      respuesta = stdin.readLineSync() ?? 'e';
    }while(respuesta != '1' && respuesta != '2' && respuesta != '3');
    switch (respuesta){
      case '1':
        await listarLibros();
        menuLogin(usuario);        
      case '2':
      await comprarLibros();
      menuLogin(usuario);
      case '3':
        print('Hasta pronto!');
        menuInicial();
        break;
      default:
        print('Opción no válida');        
    }
  }

  listarLibros() async {
    List listadoLibros = await Libro().all();
    for (Libro elemento in listadoLibros) {
      stdout.writeln('${elemento.idlibro} -> ${elemento.titulo} -> ${elemento.genero} -> ${elemento.autor} -> ${elemento.precio}');
    }
  }

  comprarLibros() async {
    await listarLibros();
    List listadoLibros = await Libro().all();
    Map<int,String?> seleccionLibros = {};
    int contador = 1;
    for(Libro elemento in listadoLibros){
      seleccionLibros.addAll({contador: elemento.titulo});
      contador += 1;
    }
    int? opcion;
    do{
    stdout.writeln('Comenta el id del libro que desea');
    String respuesta = stdin.readLineSync() ?? 'e';
    opcion = int.tryParse(respuesta);
    } while(opcion == null || opcion <0 || opcion >100);
    stdout.writeln('has comprado: ${listadoLibros[opcion-1].titulo}');
  }
}

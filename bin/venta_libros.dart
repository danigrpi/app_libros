import 'dart:io';
import "dart:convert";
import "package:http/http.dart" as http;

main(){
  String? respuesta;
    do {
      stdout.writeln('''Buenas! Elige una opción para saber el libro que deseas:
    1 -> Buscar libro
    2 -> Buscar genero''');
      respuesta = stdin.readLineSync();
    } while (respuesta != '1' && respuesta != '2');

  String _pedirNombre(){
    stdout.writeln("Escribe el nombre del libro a consultar");
    return stdin.readLineSync() ?? "error";
  }

  String _pedirGenero(){
    stdout.writeln("Escribe el nombre del genero a consultar");
    return stdin.readLineSync() ?? "error";
  }
}
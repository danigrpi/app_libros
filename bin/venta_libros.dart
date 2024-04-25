import 'dart:io';
import "dart:convert";

import 'Usuario.dart';

main()async{
  String? respuesta;
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
    stdout.writeln('Bienvenido, esperamos que encuentre el producto de su agrado!');
    
  }

  login(){

  }

  String _pedirNombre(){
    stdout.writeln("Escribe el nombre del libro a consultar");
    return stdin.readLineSync() ?? "error";
  }

  String _pedirGenero(){
    stdout.writeln("Escribe el nombre del genero a consultar");
    return stdin.readLineSync() ?? "error";
  }
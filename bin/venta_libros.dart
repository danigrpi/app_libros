import 'Database.dart';
import 'app.dart';

main()async{
  await Database().instalacion();
  App().menuInicial();
  }
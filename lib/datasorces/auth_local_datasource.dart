// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

@injectable // registrando como factory
class AuthLocalDatasource {
  AuthLocalDatasource(this.sharedPreferences);

  SharedPreferences sharedPreferences;

  User? getCurrentUser() {
    // faria chamada no SharedPreferences ou FlutterSecureStorage
    //return User('Local');
    return null;
  }
}


// Se não utilizasse Pré-resolução de futuros no Shared Preferences com @preResolve para pré-aguardar 
// o futuro e registrar seu valor resolvido, deveriamos utilizar a implementação abaixo
// @preResolve faz com que o a instancia seja injetada já na inicialização do app

// @injectable // registrando como factory
// class AuthLocalDatasource {
//   AuthLocalDatasource() {
//     GetIt.I.getAsync<SharedPreferences>().then((value) => sharedPreferences = value);
//   }

//   late SharedPreferences sharedPreferences;

//   User? getCurrentUser() {
//     // faria chamada no SharedPreferences ou FlutterSecureStorage
//     //return User('Local');
//     return null;
//   }
// }

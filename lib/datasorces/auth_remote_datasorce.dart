import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/user.dart';

@injectable // registrando como factory
class AuthRemoteDatasource {
  AuthRemoteDatasource(this.dio);

  final Dio dio;

  User? getCurrentUser() {
    // Faria chamada no Dio
    return User('Lucas Theisen');
  }
}

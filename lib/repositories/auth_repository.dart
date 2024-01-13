import 'package:flutter_inject/datasorces/auth_local_datasource.dart';
import 'package:flutter_inject/datasorces/auth_remote_datasorce.dart';
import 'package:flutter_inject/injection/injection.dart';
import 'package:injectable/injectable.dart';

import '../models/user.dart';

// classe abstrata
abstract class AuthRepository {
  User? getCurrentUser();
}

// Para injetar a implementação de um abstração devemos
// informar o tipo (Singleton, LazySingleton, Injectable, etc) começando com letra maiuscula
// dentro do () informar após o as: o nome da abstração, ex: @Singleton(as: AuthRepository)

@node
@Injectable(as: AuthRepository) //Vinculando classe abstrata a uma implementação (Injectable registra como factory)
// implementação da interface AuthRepository
class NodeAuthRepository implements AuthRepository {
  NodeAuthRepository(
    this.authRemoteDatasorce,
    this.authLocalDatasource,
  );

  final AuthRemoteDatasource authRemoteDatasorce;
  final AuthLocalDatasource authLocalDatasource;

  @override
  User? getCurrentUser() {
    User? user = authLocalDatasource.getCurrentUser();
    user ??= authRemoteDatasorce.getCurrentUser(); // Se user for == null, chama authRemoteDatasorce.getCurrentUser()
    return user;
  }
}

@firebase
@Injectable(as: AuthRepository) //Vinculando classe abstrata a uma implementação (Injectable registra como factory)
// implementação da interface AuthRepository
class FirebaseAuthRepository implements AuthRepository {
  @override
  User? getCurrentUser() {
    return User('Usuário do Firebase');
  }
}

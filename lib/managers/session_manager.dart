import 'package:flutter_inject/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../models/user.dart';

@lazySingleton // registrando como lazySingleton
class SessionManager {
  SessionManager(this.authRepository) {
    print('Construção do session manager');
    _getCurrentUser();
  }

  final AuthRepository authRepository;

  User? user;

  void _getCurrentUser() {
    user = authRepository.getCurrentUser();
  }

  // Metodo para ser executado quando o SessionManager for removido do GetIt
  @disposeMethod
  void dispose() {
    print('Dispose do session manager');
  }
}

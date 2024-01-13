import 'package:dio/dio.dart';
import 'package:flutter_inject/injection/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

//caso não queira usar variavel global "final getIt = GetIt.I", pode usar o getIt diretamente com GetIt.I
//final getIt = GetIt.I;

/*void configureDependencies() {
  debugPrint('Inicio da configuração de depêndencias');

  final useFirebase = false;

  // Injeção de dependecias
  getIt.registerLazySingleton(() => Dio());
  getIt.registerFactory(() => AuthRemoteDatasource(getIt()));
  getIt.registerFactory(() => AuthLocalDatasource());
  if (useFirebase) {
    getIt.registerFactory<AuthRepository>(() => FirebaseAuthRepository());
  } else {
    getIt.registerFactory<AuthRepository>(() => NodeAuthRepository(getIt(), getIt()));
  }
  getIt.registerLazySingleton(() => SessionManager(getIt()));

  debugPrint('Fim da configuração de depêndencias');
}*/

const firebase = Environment('firebase');
const node = Environment('node');

@InjectableInit()
//void configureDependencies() => getIt.init(); // Inicializando o getIt com variavel global
Future<void> configureDependencies() => GetIt.I.init(environment: 'node'); // Inicializando o getIt com GetIt.I

// Registrando Classes de Terceiros (Pacotes de terceiros) e Assincronas
@module
abstract class RegisterModule {
  // @singleton ou @lazySingletonpara anotar suas classes singleton
  @injectable // registrando como singleton
  Dio get dio => Dio();

  @preResolve // @preResolve faz com que o a instancia seja injetada já na inicialização do app. No caso a instancia do SharedPreferences
  // resumindo, SharedPreferences.getInstance() é executado na inicialização do app
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

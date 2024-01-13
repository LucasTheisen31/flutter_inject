// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_inject/datasorces/auth_local_datasource.dart' as _i7;
import 'package:flutter_inject/datasorces/auth_remote_datasorce.dart' as _i8;
import 'package:flutter_inject/injection/injection.dart' as _i9;
import 'package:flutter_inject/managers/session_manager.dart' as _i5;
import 'package:flutter_inject/repositories/auth_repository.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

const String _node = 'node';
const String _firebase = 'firebase';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AuthRepository>(
      () => _i3.FirebaseAuthRepository(),
      registerFor: {_firebase},
    );
    gh.factory<_i4.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i5.SessionManager>(
      () => _i5.SessionManager(gh<_i3.AuthRepository>()),
      dispose: (i) => i.dispose(),
    );
    await gh.lazySingletonAsync<_i6.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i7.AuthLocalDatasource>(
        () => _i7.AuthLocalDatasource(gh<_i6.SharedPreferences>()));
    gh.factory<_i8.AuthRemoteDatasource>(
        () => _i8.AuthRemoteDatasource(gh<_i4.Dio>()));
    gh.factory<_i3.AuthRepository>(
      () => _i3.NodeAuthRepository(
        gh<_i8.AuthRemoteDatasource>(),
        gh<_i7.AuthLocalDatasource>(),
      ),
      registerFor: {_node},
    );
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}

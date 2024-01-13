import 'package:flutter/material.dart';
import 'package:flutter_inject/managers/session_manager.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  //final SessionManager sessionManager = GetIt.I(); // Quando definimos o tipo da variavel nao precisamos especificar o tipo da instancia do GetIt

  final SessionManager sessionManager = GetIt.I<SessionManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sessionManager.user?.name ?? 'Não logado'),
      ),
    );
  }
}

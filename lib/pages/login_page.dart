import 'package:flutter/material.dart';
import 'package:flutter_inject/managers/session_manager.dart';
import 'package:flutter_inject/pages/home_page.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: const Text(
                'Entrar',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(GetIt.I.isRegistered<SessionManager>());
                //GetIt.I.unregister<SessionManager>(); // Cancelando registro de Singletons ou Factorys
                GetIt.I.resetLazySingleton<SessionManager>(); // Redefine a instância para que ela seja criada novamente no próximo acesso
                print(GetIt.I.isRegistered<SessionManager>());
                //GetIt.I.reset(); // Redefininde o GetIt completamente
              },
              child: const Text(
                'Remover SessionManager',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

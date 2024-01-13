import 'package:flutter/material.dart';
import 'package:flutter_inject/pages/login_page.dart';

import 'injection/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

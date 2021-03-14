import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/Home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

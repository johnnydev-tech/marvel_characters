import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personagens Marvel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: ThemeData(
          primaryColor: Colors.black,
          backgroundColor: Colors.grey[900],
        ).colorScheme.copyWith(
              primary: Colors.black,
              secondary: Colors.red,
              surface: Colors.black,
              background: Colors.grey[900],
            ),
      ),
    ).modular();
  }
}

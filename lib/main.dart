import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/src/app.dart';
import 'package:flutter_instagram_clone/src/binding/init_bindings.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      initialBinding: InitBindings(),
      home: const App(),
    );
  }
}

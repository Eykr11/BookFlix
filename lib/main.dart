import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import './router.dart';
import 'package:book_flix/utils/colors/global_colors.dart';

void main() {
  // Cambia el color de la barra de navegacion
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: CustomColors.background,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  // Punto de entrada de la app
  runApp(const Root());
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _Root();
}

class _Root extends State<Root> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}

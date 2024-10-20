import 'package:flutter/material.dart';
import './main.dart';
import 'package:go_router/go_router.dart';
import './ui/screens/welcome/welcome_screen.dart';
import './ui/screens/register/register_screen.dart';
import './not_found.dart';
import '/ui/screens/favourites/favourites_screen.dart';

mixin RouterMixin on State<Root> {
  final _router = GoRouter(
      initialLocation: '/',
      errorBuilder: (context, state) => const NotFound(),
      routes: [
        GoRoute(
          path: '/favourites',
          builder: (context, state) => FavouritesScreen(),
        ),
        GoRoute(path: '/', builder: (_, __) => const Welcome()),
        GoRoute(
            path: '/register',
            builder: (context, state) {
              final params = state.pathParameters;
              print(params); // Parametros de la url
              return Register();
            })
      ]);

  GoRouter get router => _router;
}

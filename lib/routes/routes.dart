import 'package:flixlist/counter/counter.dart';
import 'package:flixlist/login/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter getRoute(BuildContext context) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        name: LoginScreen.route,
        path: LoginScreen.route,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        name: CounterPage.route,
        path: CounterPage.route,
        builder: (context, state) => CounterPage(),
      ),
    ],
  );
}

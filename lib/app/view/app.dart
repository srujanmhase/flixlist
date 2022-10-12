// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flixlist/auth/cubit/auth_cubit.dart';
import 'package:flixlist/home/view/home.dart';
import 'package:flixlist/login/login.dart';
import 'package:flixlist/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flixlist/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late GoRouter approutes;
  @override
  void initState() {
    super.initState();
    approutes = getRoute(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isLoggedin && mounted) {
            approutes.goNamed(HomePage.route);
          }
          if (!state.isLoggedin && mounted) {
            approutes.goNamed(LoginScreen.route);
          }
        },
        listenWhen: (previous, current) => previous != current,
        child: MaterialApp.router(
          routeInformationProvider: approutes.routeInformationProvider,
          routeInformationParser: approutes.routeInformationParser,
          routerDelegate: approutes.routerDelegate,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}

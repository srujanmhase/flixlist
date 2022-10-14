// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flixlist/auth/auth_repository.dart';
import 'package:flixlist/auth/cubit/auth_cubit.dart';
import 'package:flixlist/services/firestore_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'app/view/app.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap() async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  await runZonedGuarded(
    () async {
      runApp(
        MultiProvider(
          providers: [
            Provider(
              create: (context) => AuthRepository(),
            ),
            Provider(
              create: (context) => Dio(
                BaseOptions(
                  baseUrl: 'http://www.omdbapi.com/?apikey=67cd0e5a&',
                ),
              ),
            ),
            Provider(
              create: (context) => FirestoreRepository(
                FirebaseFirestore.instance,
              ),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthCubit>(
                create: (context) => AuthCubit()..checkUserState(),
              ),
            ],
            child: App(),
          ),
        ),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/feature/auth/screen/auth_screen.dart';
import 'package:food_app_api/feature/started/screen/started_screen.dart';
import 'package:food_app_api/shared/router/name_router.dart';
import 'package:go_router/go_router.dart';

import '../../feature/home/screen/home_screen.dart';

final goRouterProvider = Provider((ref) {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
        path: '/',
        name: started,
        builder: (context, state) {
          return StartedScreen();
        },
        routes: [
          GoRoute(
            path: 'auth',
            name: auth,
          
            pageBuilder: (context, state) {
              return MaterialPage(
                key: state.pageKey,
                restorationId: state.pageKey.value,
                child: AuthScreen());
            },
          ),
          
          GoRoute(
            path: 'home/:username',
            name: home,
           
            pageBuilder: (context, state) {
              return MaterialPage(
                key: state.pageKey,
                restorationId: state.pageKey.value,
                child: HomeScreen(
                username: state.params['username'] ?? '',
                age: state.queryParams['age'] ?? '',
              ));
            },
          )
        ]),
  ]);
});

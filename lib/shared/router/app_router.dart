import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/feature/auth/screen/auth_screen.dart';
import 'package:food_app_api/feature/cart/screen/cart_screen.dart';
import 'package:food_app_api/feature/dashboard/screen/dashboard_screen.dart';
import 'package:food_app_api/feature/detail/screen/detail_screen.dart';
import 'package:food_app_api/feature/history/screen/history_screen.dart';
import 'package:food_app_api/feature/home/model/product/product_model.dart';
import 'package:food_app_api/feature/profile/screen/profile_screen.dart';
import 'package:food_app_api/feature/started/screen/started_screen.dart';
import 'package:food_app_api/feature/wishlist/screen/wishlist_screen.dart';
import 'package:food_app_api/shared/router/name_router.dart';
import 'package:go_router/go_router.dart';

import '../../feature/checkout/screen/checkout_screen.dart';
import '../../feature/home/screen/home_screen.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigator = GlobalKey(debugLabel: 'sell');

final goRouterProvider = Provider((ref) {
  return GoRouter(navigatorKey: _rootNavigator, initialLocation: '/', routes: [
    GoRoute(
        path: '/',
        name: root,
        builder: (context, state) {
          return StartedScreen(
            key: state.pageKey,
          );
        },
        routes: [
          GoRoute(
            path: 'auth',
            name: auth,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: AuthScreen());
            },
          ),
          GoRoute(
            path: 'cart',
            name: cart,
            pageBuilder: (context, state) {
              return NoTransitionPage(key: state.pageKey, child: CartScreen());
            },
          ),
          GoRoute(
            path: 'detail',
            name: detail,
            pageBuilder: (context, state) {
              ProductModel p = state.extra as ProductModel;
              return NoTransitionPage(
                  child: DetailScreen(
                productModel: p,
              ));
            },
          ),
          GoRoute(
            path: 'checkout',
            name: checkout,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                  key: state.pageKey, child: CheckoutScreen());
            },
          ),
        ]),
    ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) {
          return DashboardScreen(key: state.pageKey, widget: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: home,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: HomeScreen());
            },
          ),
          GoRoute(
            path: '/wishlist',
            name: wishlist,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: WishlistScreen());
            },
          ),
          GoRoute(
            path: '/profile',
            name: profile,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: ProfileScreen());
            },
          ),
          GoRoute(
            path: '/history',
            name: history,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: HistoryScreen());
            },
          )
        ])
  ]);
});

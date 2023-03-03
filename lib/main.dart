import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/feature/home/screen/home_screen.dart';
import 'package:food_app_api/feature/started/screen/started_screen.dart';
import 'package:food_app_api/network/network.dart';
import 'package:food_app_api/shared/router/app_router.dart';
import 'package:food_app_api/shared/themes/app_theme.dart';

void main() {
  Network().init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      routerConfig: router,
    );
  }
}

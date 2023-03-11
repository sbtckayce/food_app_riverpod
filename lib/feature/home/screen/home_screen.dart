import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:food_app_api/gen/colors.gen.dart';

import '../widgets/widgets.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    super.key,

    // required this.email
  });
  //  final String email;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorName.backgroundColor,
        body: SafeArea(
          child: ZoomDrawer(
            menuScreen: MenuHome(),
            mainScreen: MainHome(),
            angle: 0,
          ),
        ),
      ),
    );
  }
}

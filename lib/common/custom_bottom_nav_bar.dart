import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app_api/feature/dashboard/provider/dashboard_provider.dart';
import 'package:food_app_api/feature/home/screen/home_screen.dart';

import 'package:go_router/go_router.dart';

import '../gen/colors.gen.dart';

class CustomBottomNavBar extends ConsumerStatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends ConsumerState<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final position = ref.watch(dashboardProvider);

    return BottomNavigationBar(
        currentIndex: position,
        backgroundColor: ColorName.backgroundColor,
        selectedItemColor: ColorName.primaryColor,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          _onTap(value);
        },
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: ColorName.primaryColor,
              ),
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite_border,
                color: ColorName.primaryColor,
              ),
              icon: Icon(Icons.favorite_border),
              label: 'Wishlist'),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person_2_outlined,
                color: ColorName.primaryColor,
              ),
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile'),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.history,
                color: ColorName.primaryColor,
              ),
              icon: Icon(Icons.history),
              label: 'History')
        ]);
  }

  void _onTap(int index) {
    ref.read(dashboardProvider.notifier).setPosition(index);
    switch (index) {
      case 0:
        // context.go('/home');
        GoRouter.of(context).push('/home');
        break;
      case 1:
        // context.go('/wishlist');
        GoRouter.of(context).push('/wishlist');
        break;
      case 2:
        // context.go('/profile');
        GoRouter.of(context).push('/profile');
        break;
      case 3:
        // context.go('/history');
        GoRouter.of(context).push('/history');
        break;
    }
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app_api/common/custom_button.dart';
import 'package:food_app_api/gen/assets.gen.dart';



import 'package:go_router/go_router.dart';

import '../../../gen/colors.gen.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: ColorName.primaryColor,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 35, right: 35),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: ColorName.white,
                  child: Image.asset(
                    Assets.images.hatImg.path,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Food for',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              fontSize: 50,
                              color: ColorName.white,
                              fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Everyone',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              fontSize: 50,
                              color: ColorName.white,
                              height: 0.8,
                              fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Image.asset(
                       Assets.images.person1Img.path,
                      )),
                      Expanded(
                          child: Image.asset(
                        Assets.images.person2Img.path,
                      ))
                    ],
                  ),
                  Positioned(
                    bottom: -50,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: ColorName.primaryColor,
                          spreadRadius: 1,
                          blurRadius: 50,
                        )
                      ]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 35, right: 35, bottom: 10),
                child: CustomButton(
                  text: 'Get started',
                  textColor: ColorName.primaryColor,
                  buttonColor: ColorName.white,
                  onPress: () {
                    // return context.go('/auth');
                    // return GoRouter.of(context).push('/home');
                    return context.go('/home');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

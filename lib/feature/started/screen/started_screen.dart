import 'package:flutter/material.dart';
import 'package:food_app_api/common/custom_button.dart';
import 'package:food_app_api/shared/constants/assets_constants.dart';

import 'package:food_app_api/shared/themes/pallete.dart';
import 'package:go_router/go_router.dart';

class StartedScreen extends StatelessWidget {
  const StartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Palette.primaryColor,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 35, right: 35),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Palette.whiteColor,
                  child: Image.asset(
                    AssetsConstants.hat_img,
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
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Everyone',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              fontSize: 50,
                              color: Colors.white,
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
                        AssetsConstants.person1_img,
                      )),
                      Expanded(
                          child: Image.asset(
                        AssetsConstants.person2_img,
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
                          color: Palette.primaryColor,
                          spreadRadius: 1,
                          blurRadius: 50,
                        )
                      ]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                   const EdgeInsets.only(top: 50, left: 35, right: 35, bottom: 10),
                child: CustomButton(
                    text: 'Get started',
                    textColor: Palette.primaryColor,
                    buttonColor: Palette.whiteColor,
                    onPress: () {
                      return context.go('/auth');
                    },),
              )
            ],
          ),
        ),
      ),
    );
  }
}

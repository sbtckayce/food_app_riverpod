import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app_api/common/common.dart';
import 'package:food_app_api/shared/constants/assets_constants.dart';
import 'package:food_app_api/shared/themes/pallete.dart';

import '../widgets/widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Palette.backgroundColor,
        appBar: AppBar(
          shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          backgroundColor: Colors.white,
          bottom: TabBar(
          
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Palette.primaryColor,
            tabs: [
           const   Tab(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black)
                  ),
                ),
              ),
              Tab(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Register',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
          toolbarHeight: 180,
          title: Image.asset(AssetsConstants.hat_imgx,scale: 4,),
        ),
        body: TabBarView(
          children: [Login(), Register()],
        ),
      ),
    );
  }
}

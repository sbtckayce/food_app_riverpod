import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app_api/shared/constants/assets_constants.dart';
import 'package:go_router/go_router.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.username, required this.age});
  final String username;
  final String age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){
          context.go('/auth');
        },),
        title: Text('${username}' '${age}'),),
      body: Container(
        width: 400,
        height: 400,
        color: Colors.white,
        child: Center(child: Image.asset(AssetsConstants.person1_img,fit: BoxFit.cover,))),
    );
  }
}
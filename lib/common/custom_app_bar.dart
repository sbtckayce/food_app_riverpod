
import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';

class CustomAppBar extends StatelessWidget  with PreferredSizeWidget{
  const CustomAppBar({
    super.key, this.onTap, required this.title,
  });
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorName.backgroundColor,
      elevation: 0,
      
      leading: GestureDetector(
        onTap: onTap,
        child: Icon(
          Icons.arrow_back_ios,
          color: ColorName.black,
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontWeight: FontWeight.normal),
      ),
    );
  }
  
  @override
  
  Size get preferredSize => Size.fromHeight(50);
}
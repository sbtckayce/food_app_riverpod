import 'package:flutter/material.dart';
import 'package:food_app_api/gen/colors.gen.dart';


class BuildSearchBar extends StatelessWidget {
  const BuildSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: ColorName.searchBarColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(width: 1, color: ColorName.primaryColor)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          prefixIcon: Icon(
            Icons.search,
            size: 30,
          ),
          hintText: 'Search',
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w500)),
    );
  }
}

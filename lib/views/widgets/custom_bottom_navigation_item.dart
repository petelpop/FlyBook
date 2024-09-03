import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationItem extends StatelessWidget {

  final String img;
  final bool isSelected;
  CustomBottomNavigationItem({super.key, required this.img, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(img))),
        ),
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
              color: isSelected == true ? kPrimaryColor : kTransparentColor,
              borderRadius: BorderRadius.circular(18)),
        )
      ],
    );
  }
}

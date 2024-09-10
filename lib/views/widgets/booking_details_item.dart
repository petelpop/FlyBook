import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class BookingDetailsItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;
  const BookingDetailsItem(
      {super.key,
      required this.title,
      required this.valueText,
      required this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.icCheck))),
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(),
          ),
          Spacer(),
          Text(
            valueText,
            style: blackTextStyle.copyWith(fontWeight: semiBold, color: valueColor),
          )
        ],
      ),
    );
  }
}

import 'package:airplane/models/destination.dart';
import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/detail_page.dart';
import 'package:flutter/material.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destination;
  const DestinationTile(
      this.destination,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, DetailPage.routeName);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    image: NetworkImage(destination.imageUrl), fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style:
                        blackTextStyle.copyWith(fontWeight: medium, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    destination.city,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  margin: EdgeInsets.only(right: 2),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(Assets.icStar))),
                ),
                Text(
                  destination.rating.toString(),
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/widgets/destination_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: 30, left: defaultMargin, right: defaultMargin),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howdy,\nKezia Anne',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Where to fly today?',
                      style: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: light),
                    )
                  ],
                ),
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: AssetImage(Assets.imgProfile))),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DestinationCard(
                  name: "Lake Ciliwung",
                  city: "Tangerang",
                  img: Assets.imgDestination1,
                  rating: 4.8,
                ),
                DestinationCard(
                  name: "White House",
                  city: "Spain",
                  img: Assets.imgDestination2,
                  rating: 4.7,
                ),
                DestinationCard(
                  name: "Hill Heyo",
                  city: "Monaco",
                  img: Assets.imgDestination3,
                  rating: 4.8,
                ),
                DestinationCard(
                  name: "Menarra",
                  city: "Japan",
                  img: Assets.imgDestination4,
                  rating: 5.0,
                ),
                                DestinationCard(
                  name: "Payung Teduh",
                  city: "Singapore",
                  img: Assets.imgDestination5,
                  rating: 4.8,
                ),
                SizedBox(width: defaultMargin,)
              ],
            ),
          ),
        )
      ],
    );
  }
}

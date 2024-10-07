import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/widgets/destination_card.dart';
import 'package:airplane/views/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Container(
              margin: EdgeInsets.only(
                  top: 30, left: defaultMargin, right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.data.name}',
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
                        image: DecorationImage(
                            image: AssetImage(Assets.imgProfile))),
                  )
                ],
              ),
            );
            } else {
              return SizedBox();
            }
          },
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
                SizedBox(
                  width: defaultMargin,
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 30, left: defaultMargin, right: defaultMargin, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New This Year',
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
              ),
              DestinationTile(
                name: 'Danau Beratan',
                city: "Singaraja",
                img: Assets.imgDestination6,
                rating: 4.5,
              ),
              DestinationTile(
                name: 'Sydney Opera',
                city: "Australia",
                img: Assets.imgDestination7,
                rating: 4.7,
              ),
              DestinationTile(
                name: 'Roma',
                city: "Italy",
                img: Assets.imgDestination8,
                rating: 4.8,
              ),
              DestinationTile(
                name: 'Payung Teduh',
                city: "Singapore",
                img: Assets.imgDestination9,
                rating: 4.5,
              ),
              DestinationTile(
                name: 'Hill Hey',
                city: "Monaco",
                img: Assets.imgDestination10,
                rating: 4.7,
              ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/models/destination.dart';
import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/widgets/destination_card.dart';
import 'package:airplane/views/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DestinationModel> destinations = [];

  @override
  void initState() {
    super.initState();
    context.read<DestinationCubit>().fetchDestinations();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if(state is DestinationFailed){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.messsage),
                backgroundColor: kRedColor,
              ));
        }
        if (state is DestinationSuccess) {
          destinations = state.destinations;
        }
        
      },
      builder: (context, state) {
        if (state is DestinationSuccess) {
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
                  children: destinations.map((e){
                    return DestinationCard(e);
                  }).toList()
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 30,
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New This Year',
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold),
                  ),
                  Column(
                    children: destinations.map((e){
                      return DestinationTile(e);
                    }).toList()
                  )
                ],
              ),
            )
          ],
        );
        }
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}

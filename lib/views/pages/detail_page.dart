import 'package:airplane/models/destination.dart';
import 'package:airplane/shared/assets.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/choose_seat_page.dart';
import 'package:airplane/views/widgets/custom_button.dart';
import 'package:airplane/views/widgets/interest_item.dart';
import 'package:airplane/views/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = 'detail-page';
  final DestinationModel destination;
  const DetailPage(this.destination, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 450,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(destination.imageUrl))),
            ),
            Container(
              margin: EdgeInsets.only(top: 236),
              height: 214,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    kTransparentColor.withOpacity(0),
                    Colors.black.withOpacity(0.8)
                  ])),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: defaultMargin),
              child: Column(
                children: [
                  /// EMBLEM
                  Container(
                    width: double.infinity,
                    height: 24,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage(Assets.icEmblem))),
                  ),
        
                  ///TITLE
                  Container(
                    margin: EdgeInsets.only(top: 256),
                    child: Row(
                      children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              destination.name,
                              overflow: TextOverflow.ellipsis,
                              style: whiteTextStyle.copyWith(
                                fontSize: 24, 
                                fontWeight: semiBold,
                              ),
                              ),
                              Text(
                                destination.city,
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: light
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
                              image: DecorationImage(
                                  image: AssetImage(Assets.icStar))),
                        ),
                        Text(
                          destination.rating.toString(),
                          style: whiteTextStyle.copyWith(fontWeight: medium),
                        ),
                      ],
                    ),
                    ],
                    ),
                  ),
        
                  /// Description
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///About
                        Text(
                          'About',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                          style: blackTextStyle.copyWith(
                            height: 2
                          ),
                        ),
        
                        ///PHOTOS
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Photos',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold
                          ),
                        ),
                        SizedBox(height: 6,),
                        Row(
                          children: [
                          PhotoItem(img: Assets.imgPhoto1),
                          PhotoItem(img: Assets.imgPhoto2),
                          PhotoItem(img: Assets.imgPhoto3),
                          ],
                        ),
                        ///INTERESTS
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Interests',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold
                          ),
                        ),
                        SizedBox(height: 6,),
                        Row(
                          children: [
                            InterestItem(text: 'Kids Park'),
                            InterestItem(text: 'Honor Bridge'),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            InterestItem(text: 'City Museum',),
                            InterestItem(text: 'Central Mall',),
                          ],
                        )
                      ],
                    ),
                  ),
        
                  ///PRICE & BOOK BUTTON
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(locale: 'id', symbol: 'IDR ', decimalDigits: 0).format(destination.price),
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: semiBold
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                'per orang',
                                style: greyTextStyle.copyWith(
                                  fontWeight: light
                                ),
                              )
                            ],
                          ),
                        ),

                        ///BOOK BUTTON
                        CustomButton(
                          text: 'Book Now', 
                          onTap: (){
                            Navigator.pushNamed(context, ChooseSeatPage.routeName);
                          },
                          width: 170,)
                      ],
                    ),
                    
                  )
                ],
              ),
            ),      
          ],
        ),
      ),
    );
  }
}

import 'dart:ffi';

import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/bonus_page.dart';
import 'package:airplane/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static String routeName = "sign-up-page";
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {

    Widget title() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        "Join us and get\nyour next journey",
        style: blackTextStyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold
        ),
      ),
    );
  }

        Widget tacButton(){
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 50,
              bottom: 73
            ),
            child: Text(
              "Terms And Conditions",
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline
              ),
            ),
          );
        }

        Widget inputSection() {

        Widget submitButton(){
          return CustomButton(
            text: 'Get Started', 
            onTap: (){
              Navigator.pushNamed(context, BonusPage.routeName);
            });
        }

        Widget nameInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Name",
                style: blackTextStyle,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6,),
              TextFormField(
                style: blackTextStyle,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: "Your Full Name",
                  hintStyle: greyTextStyle,
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(defaultRadius) 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(
                      color: kPrimaryColor
                    ),
                  )
                ),
              )
            ],
          ),
        );
      }

        Widget emailInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email",
                style: blackTextStyle,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6,),
              TextFormField(
                style: blackTextStyle,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: "Email Adress",
                  hintStyle: greyTextStyle,
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(defaultRadius) 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(
                      color: kPrimaryColor
                    ),
                  )
                ),
              )
            ],
          ),
        );
      }

        Widget passwordInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Password",
                style: blackTextStyle,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6,),
              TextFormField(
                style: blackTextStyle,
                cursorColor: kBlackColor,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: greyTextStyle,
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(defaultRadius) 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(
                      color: kPrimaryColor
                    ),
                  )
                ),
              )
            ],
          ),
        );
      }

        Widget hobbyInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hobby",
                style: blackTextStyle,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 6,),
              TextFormField(
                style: blackTextStyle,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                  hintText: "Hobby",
                  hintStyle: greyTextStyle,
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(defaultRadius) 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(
                      color: kPrimaryColor
                    ),
                  )
                ),
              )
            ],
          ),
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius)
        ),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            submitButton()
          ],
        ),
      );
    }
  
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
          ),
          children: [
            title(),
            inputSection(),
            tacButton()
          ],
        ),
      ),
    );
  }
}
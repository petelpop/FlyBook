import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/bonus_page.dart';
import 'package:airplane/views/pages/main_page.dart';
import 'package:airplane/views/pages/sign_up_page.dart';
import 'package:airplane/views/widgets/custom_button.dart';
import 'package:airplane/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  static String routeName = "sign-in-page";
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          "Sign In with your\nexisting account",
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget signUpButton() {
      return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, SignUpPage.routeName);
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 50, bottom: 73),
          child: Text(
            "Don't have an account? Sign Up",
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline),
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, MainPage.routeName, (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
                backgroundColor: kRedColor,
              ));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
                text: 'Sign in',
                onTap: () {
                  context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                      );
                });
          },
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email Adress',
          hintText: 'Your email adress',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Your password',
          obscureText: true,
          controller: passwordController,
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
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            submitButton()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [title(), inputSection(), signUpButton()],
        ),
      ),
    );
  }
}

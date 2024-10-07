import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/views/pages/sign_up_page.dart';
import 'package:airplane/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
            backgroundColor: kRedColor,
            content: Text(state.message)));
        }
        if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(context, SignUpPage.routeName, (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(child: CircularProgressIndicator(),);
        }
        return Center(
          child: CustomButton(
            text: "Sign Out",
            onTap: () {
              context.read<AuthCubit>().signOut();
            },
            width: 220,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/auth/auth_bloc.dart';
import '../../shared/themes/images.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const screenName = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  void onRender(BuildContext context, AuthState state) async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushReplacementNamed(
        state is SuccessAuthState
            ? HomeScreen.screenName
            : LoginScreen.screenName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(AppImages.union),
          ),
          Center(
            child: Image.asset(AppImages.logoFull),
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              WidgetsBinding.instance!.addPostFrameCallback(
                (_) => onRender(context, state),
              );

              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}

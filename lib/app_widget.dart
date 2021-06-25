import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nlw_together_payflow/modules/insert_boleto/insert_boleto_screen.dart';

import 'modules/barcode/barcode_screen.dart';
import 'modules/home/home_screen.dart';
import 'modules/login/login_screen.dart';
import 'modules/splash/splash_screen.dart';
import 'navigation_service.dart';
import 'shared/auth/auth_bloc.dart';
import 'shared/themes/colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SuccessAuthState) {
            NavigationService().navigator.pushNamedAndRemoveUntil(
                  HomeScreen.screenName,
                  (route) => route.settings.name == '/',
                );
          } else if (state is InitialAuthState) {
            NavigationService().navigator.pushNamedAndRemoveUntil(
                  LoginScreen.screenName,
                  (route) => route.settings.name == '/',
                );
          }
        },
        child: MaterialApp(
          title: 'Payflow',
          theme: ThemeData(
            primaryColor: AppColors.primary,
            scaffoldBackgroundColor: AppColors.background,
          ),
          initialRoute: SplashScreen.screenName,
          routes: {
            SplashScreen.screenName: (context) => const SplashScreen(),
            LoginScreen.screenName: (context) => const LoginScreen(),
            HomeScreen.screenName: (context) => const HomeScreen(),
            BarcodeScreen.screenName: (context) => const BarcodeScreen(),
            InsertBoletoScreen.screenName: (context) =>
                const InsertBoletoScreen(),
          },
          navigatorKey: NavigationService().navigatorKey,
        ),
      ),
    );
  }
}

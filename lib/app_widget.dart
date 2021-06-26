import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/barcode/barcode_screen.dart';
import 'modules/home/home_screen.dart';
import 'modules/insert_bill/insert_bill_screen.dart';
import 'modules/login/login_screen.dart';
import 'modules/splash/splash_screen.dart';
import 'navigation_service.dart';
import 'shared/auth/auth_bloc.dart';
import 'shared/bills/bills_bloc.dart';
import 'shared/themes/colors.dart';
import 'shared/themes/text_styles.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => BillsBloc(),
        )
      ],
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
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.primary,
              selectionColor: AppColors.primary.withOpacity(0.4),
              selectionHandleColor: AppColors.primary,
            ),
            scaffoldBackgroundColor: AppColors.background,
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary,
                  width: 0,
                ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.stroke,
                  width: 0,
                ),
              ),
              focusColor: AppColors.primary,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextStyles.input,
            ),
          ),
          initialRoute: SplashScreen.screenName,
          routes: {
            SplashScreen.screenName: (context) => const SplashScreen(),
            LoginScreen.screenName: (context) => const LoginScreen(),
            HomeScreen.screenName: (context) => const HomeScreen(),
            BarcodeScreen.screenName: (context) => const BarcodeScreen(),
            InsertBillScreen.screenName: (context) => InsertBillScreen(
                  barcode:
                      ModalRoute.of(context)!.settings.arguments?.toString() ??
                          '',
                ),
          },
          navigatorKey: NavigationService().navigatorKey,
        ),
      ),
    );
  }
}

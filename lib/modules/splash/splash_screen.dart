import 'package:flutter/material.dart';

import '../../shared/themes/images.dart';

class SplashScreen extends StatelessWidget {
  static const screenName = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

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
        ],
      ),
    );
  }
}

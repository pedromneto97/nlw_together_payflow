import 'package:flutter/material.dart';

import '../../shared/themes/colors.dart';
import '../../shared/themes/images.dart';
import '../../shared/themes/text_styles.dart';
import '../../shared/widgets/social_login/social_login_button.dart';

class LoginScreen extends StatefulWidget {
  static const screenName = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.39,
              color: AppColors.primary,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: size.height * 0.08,
              child: Image.asset(
                AppImages.person,
                width: size.width * 0.56,
                height: size.height * 0.46,
              ),
            ),
            Positioned(
              top: size.height * 0.57,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logoMini,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.192,
                      right: size.width * 0.192,
                      top: size.height * 0.03,
                      bottom: size.height * 0.05,
                    ),
                    child: Text(
                      'Organize seus boletos em um só lugar',
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.height * 0.05,
                      right: size.height * 0.05,
                      bottom: size.height * 0.04,
                    ),
                    child: SocialLoginButton(
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

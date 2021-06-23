import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../../themes/images.dart';
import '../../themes/text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.onTap,
    required this.disabled,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: disabled ? null : onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppColors.stroke,
                ),
              ),
            ),
            child: Image.asset(
              AppImages.google,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Entrar com o Google',
                style: TextStyles.buttonGray,
              ),
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromHeight(
          size.height * 0.07,
        ),
        primary: AppColors.shape,
        onPrimary: AppColors.stroke,
        onSurface: AppColors.stroke,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

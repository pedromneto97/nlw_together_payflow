import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../../themes/text_styles.dart';
import '../set_buttons/set_buttons.dart';

class NoBarcodeDetectedBottomSheet extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subtitle;

  const NoBarcodeDetectedBottomSheet({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                          text: title,
                          style: TextStyles.buttonBoldHeading,
                          children: [
                            TextSpan(
                              text: '\n$subtitle',
                              style: TextStyles.buttonHeading,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: AppColors.stroke,
                      thickness: 1,
                    ),
                    SetButtons(
                      primaryLabel: primaryLabel,
                      primaryOnPressed: primaryOnPressed,
                      secondaryLabel: secondaryLabel,
                      secondaryOnPressed: secondaryOnPressed,
                      enablePrimaryColor: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

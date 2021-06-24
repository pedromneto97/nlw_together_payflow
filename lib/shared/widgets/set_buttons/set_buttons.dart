import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../../themes/text_styles.dart';

class SetButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;

  const SetButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    this.enablePrimaryColor = false,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextButton(
              onPressed: primaryOnPressed,
              child: Text(
                primaryLabel,
                style: enablePrimaryColor
                    ? TextStyles.buttonPrimary
                    : TextStyles.buttonHeading,
              ),
            ),
          ),
          const VerticalDivider(
            width: 1,
            color: AppColors.stroke,
            thickness: 1,
          ),
          Expanded(
            child: TextButton(
              onPressed: secondaryOnPressed,
              child: Text(
                secondaryLabel,
                style: TextStyles.buttonHeading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

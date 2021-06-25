import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../../themes/text_styles.dart';

enum Button {
  primary,
  secondary,
  none,
}

class SetButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final Button buttonPrimaryColor;
  final bool hasBorderTop;

  const SetButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    this.buttonPrimaryColor = Button.none,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.hasBorderTop = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.shape,
        border: hasBorderTop
            ? const Border(
                top: BorderSide(
                  color: AppColors.stroke,
                ),
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextButton(
              onPressed: primaryOnPressed,
              child: Text(
                primaryLabel,
                style: buttonPrimaryColor == Button.primary
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
                style: buttonPrimaryColor == Button.secondary
                    ? TextStyles.buttonPrimary
                    : TextStyles.buttonHeading,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class PayflowInputIcon extends StatelessWidget {
  final IconData icon;

  const PayflowInputIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      margin: const EdgeInsets.only(right: 16),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: AppColors.stroke,
            width: 0,
          ),
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

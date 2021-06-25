import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../../themes/text_styles.dart';

class PayflowInput extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;

  const PayflowInput({
    Key? key,
    required this.icon,
    required this.label,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyles.inputText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Container(
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
        ),
      ),
    );
  }
}

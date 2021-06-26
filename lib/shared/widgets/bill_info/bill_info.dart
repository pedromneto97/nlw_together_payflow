import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bills/bills_bloc.dart';
import '../../themes/colors.dart';
import '../../themes/images.dart';
import '../../themes/text_styles.dart';

class BillInfo extends StatelessWidget {
  const BillInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImages.logoMini,
            color: AppColors.background,
            width: 56,
            height: 34,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: VerticalDivider(
              width: 1,
              color: AppColors.background,
              thickness: 1,
            ),
          ),
          BlocBuilder<BillsBloc, BillsState>(
            builder: (context, state) => Text.rich(
              TextSpan(
                text: 'Você tem ',
                style: TextStyles.captionBackground,
                children: [
                  TextSpan(
                    text: '${state.bills.length} boletos\n',
                    style: TextStyles.captionBoldBackground,
                  ),
                  const TextSpan(text: 'cadastrados para pagar'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

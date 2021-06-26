import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/bills/bills_bloc.dart';
import '../../shared/themes/colors.dart';
import '../../shared/themes/text_styles.dart';
import '../../shared/widgets/bill_info/bill_info.dart';
import '../../shared/widgets/bills_list/bills_list.dart';

class MyBillsScreen extends StatelessWidget {
  const MyBillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: AppColors.primary,
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AnimatedCard(
                child: const BillInfo(),
                direction: AnimatedCardDirection.top,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Meus boletos',
                style: TextStyles.titleBoldHeading,
              ),
              BlocBuilder<BillsBloc, BillsState>(
                builder: (context, state) => Text(
                  '${state.bills.length} ao total',
                  style: TextStyles.captionBody,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(24),
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
        ),
        const Expanded(
          child: BillsList(),
        ),
      ],
    );
  }
}

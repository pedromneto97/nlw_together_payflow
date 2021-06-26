import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/bills/bills_bloc.dart';
import '../../shared/themes/colors.dart';
import '../../shared/themes/text_styles.dart';
import '../../shared/widgets/bills_list/bills_list.dart';

class ExtractPage extends StatelessWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                'Meus extratos',
                style: TextStyles.titleBoldHeading,
              ),
              BlocBuilder<BillsBloc, BillsState>(
                builder: (context, state) => Text(
                  '${state.bills.length} pagos',
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

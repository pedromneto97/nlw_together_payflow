import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import '../../models/bill.dart';
import '../../themes/text_styles.dart';

class BillTile extends StatelessWidget {
  final Bill bill;

  const BillTile({
    Key? key,
    required this.bill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24),
        title: Text(
          bill.name,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text(
          'Vence em ${bill.dueDate}',
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(
          TextSpan(
            text: 'R\$ ',
            style: TextStyles.trailingRegular,
            children: [
              TextSpan(
                text: bill.amount.toStringAsFixed(2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

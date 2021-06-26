import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bills/bills_bloc.dart';
import '../bill_tile/bill_tile.dart';

class BillsList extends StatelessWidget {
  const BillsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillsBloc, BillsState>(
      builder: (context, state) => ListView.builder(
        itemBuilder: (context, index) => BillTile(
          bill: state.bills[index],
        ),
        itemCount: state.bills.length,
      ),
    );
  }
}

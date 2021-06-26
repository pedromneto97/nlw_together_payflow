import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/bills/bills_bloc.dart';
import '../../shared/models/bill.dart';

class BillController {
  final formKey = GlobalKey<FormState>();

  String? validateName(String? name) =>
      name?.isEmpty ?? true ? 'O nome não pode ser vazio' : null;

  String? validateDueDate(String? dueDate) => dueDate?.isEmpty ?? true
      ? 'A data de vencimento não pode ser vazio'
      : null;

  String? validateAmount(double value) =>
      value == 0 ? 'Insira um valor maior que R\$ 0,00' : null;

  String? validateBarcode(String? barcode) =>
      barcode?.isEmpty ?? true ? 'O código de barras não pode ser vazio' : null;

  Future<void> saveBill({
    required BuildContext context,
    required String name,
    required String barcode,
    required String dueDate,
    required double amount,
  }) async {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<BillsBloc>(context).add(
        NewBillEvent(
          bill: Bill(
            name: name,
            barcode: barcode,
            dueDate: dueDate,
            amount: amount,
          ),
        ),
      );
    }
  }
}

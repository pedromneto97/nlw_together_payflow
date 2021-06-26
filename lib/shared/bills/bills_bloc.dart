import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import '../models/bill.dart';

part 'bills_event.dart';

    .dart';

part 'bills_state.dart';

class BillsBloc extends HydratedBloc<BillsEvent, BillsState> {
  BillsBloc() : super(const BillsListState());

  @override
  Stream<BillsState> mapEventToState(BillsEvent event) async* {
    if (event is NewBillEvent) {
      yield (state as BillsListState).copyWithNew(bill: event.bill);
    }
  }

  @override
  BillsState? fromJson(Map<String, dynamic>? json) {
    if (json == null || json.isEmpty) {
      return null;
    }
    final bills = (json['bills'] as List<dynamic>)
        .map(
          (bill) => Bill.fromMap(bill),
        )
        .toList();

    return BillsListState(bills: bills);
  }

  @override
  Map<String, dynamic>? toJson(BillsState state) {
    return {
      'bills': state.bills
          .map(
            (bill) => bill.toMap(),
          )
          .toList()
    };
  }
}

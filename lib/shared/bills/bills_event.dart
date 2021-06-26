part of 'bills_bloc.dart';

@immutable
abstract class BillsEvent extends Equatable {
  const BillsEvent();
}

class NewBillEvent extends BillsEvent {
  final Bill bill;

  const NewBillEvent({
    required this.bill,
  });

  @override
  List<Bill> get props => [bill];
}

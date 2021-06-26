part of 'bills_bloc.dart';

@immutable
abstract class BillsState extends Equatable {
  final List<Bill> bills;

  const BillsState({
    required this.bills,
  });
}

class BillsListState extends BillsState {
  const BillsListState({
    List<Bill> bills = const <Bill>[],
  }) : super(bills: bills);

  BillsListState copyWithNew({
    required Bill bill,
  }) =>
      BillsListState(
        bills: [
          ...bills,
          bill,
        ],
      );

  @override
  List<Object?> get props => [bills];
}

import 'package:equatable/equatable.dart';

class Bill extends Equatable {
  final String name;
  final String dueDate;
  final double amount;
  final String barcode;

  const Bill({
    required this.name,
    required this.dueDate,
    required this.amount,
    required this.barcode,
  });

  @override
  List<dynamic> get props => [name, dueDate, amount, barcode];

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      name: map['name'] as String,
      dueDate: map['dueDate'] as String,
      amount: map['amount'] as double,
      barcode: map['barcode'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': name,
      'dueDate': dueDate,
      'amount': amount,
      'barcode': barcode,
    } as Map<String, dynamic>;
  }
}

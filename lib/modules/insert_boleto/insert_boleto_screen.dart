import 'package:flutter/material.dart';

class InsertBoletoScreen extends StatelessWidget {
  static const screenName = 'insert_boleto_screen';

  const InsertBoletoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert boleto'),
      ),
    );
  }
}

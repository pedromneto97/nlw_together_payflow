import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/themes/colors.dart';
import '../../shared/themes/text_styles.dart';
import '../../shared/widgets/input_icon/input_icon.dart';
import '../../shared/widgets/set_buttons/set_buttons.dart';
import 'bill_controller.dart';

class InsertBillScreen extends StatefulWidget {
  static const screenName = 'insert_bill_screen';
  final String barcode;

  const InsertBillScreen({
    Key? key,
    required this.barcode,
  }) : super(key: key);

  @override
  _InsertBillScreenState createState() => _InsertBillScreenState();
}

class _InsertBillScreenState extends State<InsertBillScreen> {
  final BillController billController = BillController();

  final TextEditingController ticketNameController = TextEditingController();
  final MaskedTextController dueDateController = MaskedTextController(
    mask: '00/00/0000',
  );
  final MoneyMaskedTextController amountController = MoneyMaskedTextController(
    leftSymbol: 'R\$',
    decimalSeparator: ',',
  );
  late final TextEditingController barcodeController;

  @override
  void initState() {
    super.initState();

    barcodeController = TextEditingController(text: widget.barcode);
  }

  @override
  void dispose() {
    ticketNameController.dispose();
    dueDateController.dispose();
    amountController.dispose();
    barcodeController.dispose();

    super.dispose();
  }

  void onSave() async {
    await billController.saveBill(
      context: context,
      name: ticketNameController.text,
      dueDate: dueDateController.text,
      barcode: barcodeController.text,
      amount: amountController.numberValue,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: const BackButton(color: AppColors.input),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: billController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 93),
                  child: Text(
                    'Preencha os dados do boleto',
                    style: TextStyles.titleBoldHeading,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: PayflowInputIcon(
                        icon: Icons.feed_rounded,
                      ),
                      labelText: 'Nome do boleto',
                    ),
                    textInputAction: TextInputAction.next,
                    controller: ticketNameController,
                    validator: billController.validateName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: PayflowInputIcon(
                        icon: FontAwesomeIcons.timesCircle,
                      ),
                      labelText: 'Vencimento',
                    ),
                    keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    controller: dueDateController,
                    validator: billController.validateDueDate,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: PayflowInputIcon(
                        icon: Icons.account_balance_wallet_rounded,
                      ),
                      labelText: 'Valor',
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    controller: amountController,
                    validator: (_) => billController.validateAmount(
                      amountController.numberValue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: PayflowInputIcon(
                        icon: FontAwesomeIcons.barcode,
                      ),
                      labelText: 'Código',
                    ),
                    keyboardType: TextInputType.number,
                    controller: barcodeController,
                    validator: billController.validateBarcode,
                    onFieldSubmitted: (_) => onSave(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SetButtons(
        primaryLabel: 'Cancelar',
        primaryOnPressed: Navigator.of(context).pop,
        secondaryLabel: 'Cadastrar',
        secondaryOnPressed: onSave,
        hasBorderTop: true,
        buttonPrimaryColor: Button.secondary,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/themes/colors.dart';
import '../../shared/themes/text_styles.dart';
import '../../shared/widgets/payflow_input/payflow_input.dart';
import '../../shared/widgets/set_buttons/set_buttons.dart';

class InsertBoletoScreen extends StatefulWidget {
  static const screenName = 'insert_boleto_screen';

  const InsertBoletoScreen({Key? key}) : super(key: key);

  @override
  _InsertBoletoScreenState createState() => _InsertBoletoScreenState();
}

class _InsertBoletoScreenState extends State<InsertBoletoScreen> {
  final TextEditingController ticketNameController = TextEditingController();
  final TextEditingController expiresDateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();

  @override
  void dispose() {
    ticketNameController.dispose();
    expiresDateController.dispose();
    amountController.dispose();
    barcodeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: const BackButton(color: AppColors.input),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
            child: Text(
              'Preencha os dados do boleto',
              style: TextStyles.titleBoldHeading,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 16,
            ),
            child: PayflowInput(
              icon: Icons.feed_rounded,
              label: 'Nome do boleto',
              controller: ticketNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Coloque uma descrição para seu boleto';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 16,
            ),
            child: PayflowInput(
              icon: FontAwesomeIcons.timesCircle,
              label: 'Vencimento',
              controller: expiresDateController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Coloque uma data de vencimento válida';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 16,
            ),
            child: PayflowInput(
              icon: Icons.account_balance_wallet_rounded,
              label: 'Valor',
              controller: amountController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Informe o valor do boleto';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 16,
            ),
            child: PayflowInput(
              icon: FontAwesomeIcons.barcode,
              label: 'Código',
              controller: barcodeController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Coloque o código do boleto';
                }
                return null;
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SetButtons(
        primaryLabel: 'Cancelar',
        primaryOnPressed: () => Navigator.of(context).pop(),
        secondaryLabel: 'Cadastrar',
        secondaryOnPressed: () {},
        hasBorderTop: true,
        buttonPrimaryColor: Button.secondary,
      ),
    );
  }
}

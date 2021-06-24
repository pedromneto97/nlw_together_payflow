import 'package:flutter/material.dart';

import '../../shared/themes/colors.dart';
import '../../shared/themes/text_styles.dart';
import '../../shared/widgets/set_buttons/set_buttons.dart';

class BarcodeScreen extends StatefulWidget {
  static const screenName = 'barcode_screen';

  const BarcodeScreen({Key? key}) : super(key: key);

  @override
  _BarcodeScreenState createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Escaneie o código de barras do boleto',
              style: TextStyles.buttonBackground,
            ),
            leading: const BackButton(
              color: AppColors.background,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          bottomNavigationBar: SetButtons(
            primaryLabel: 'Inserir código do boleto',
            primaryOnPressed: () {},
            secondaryLabel: 'Adicionar da galeria',
            secondaryOnPressed: () {},
          ),
        ),
      ),
    );
  }

/*
  NoBarcodeDetectedBottomSheet(
      title: 'Não foi possível identificar um código de barras.',
      subtitle: 'Tente escanear novamente ou digite o código do seu boleto.',
      primaryLabel: 'Escanear novamente',
      primaryOnPressed: () {},
      secondaryLabel: 'Digitar código',
      secondaryOnPressed: () {},
    )
   */
}

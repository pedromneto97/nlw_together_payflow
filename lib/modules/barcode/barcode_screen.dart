import 'package:flutter/material.dart';
import 'package:nlw_together_payflow/modules/barcode/barcode_controller.dart';
import 'package:nlw_together_payflow/modules/barcode/barcode_status.dart';
import 'package:nlw_together_payflow/modules/insert_boleto/insert_boleto_screen.dart';
import 'package:nlw_together_payflow/shared/widgets/bottom_sheet/no_barcode_detected_bottom_sheet.dart';

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
  final BarcodeScannerController controller = BarcodeScannerController();

  void statusListener() {
    if (controller.status.hasBarcode) {
      Navigator.pushReplacementNamed(context, InsertBoletoScreen.screenName);
    }
  }

  @override
  void initState() {
    super.initState();
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(statusListener);
  }

  @override
  void dispose() {
    controller.statusNotifier.removeListener(statusListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (context, status, _) {
              if (status.showCamera) {
                return controller.cameraController!.buildPreview();
              }
              return const SizedBox();
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
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
                      color: Colors.black.withOpacity(0.6),
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
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SetButtons(
                primaryLabel: 'Inserir código do boleto',
                primaryOnPressed: () {},
                secondaryLabel: 'Adicionar da galeria',
                secondaryOnPressed: controller.scanWithImagePicker,
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (context, status, _) {
              if (status.hasError) {
                return NoBarcodeDetectedBottomSheet(
                  title: 'Não foi possível identificar um código de barras.',
                  subtitle:
                      'Tente escanear novamente ou digite o código do seu boleto.',
                  primaryLabel: 'Escanear novamente',
                  primaryOnPressed: controller.scanWithCamera,
                  secondaryLabel: 'Digitar código',
                  secondaryOnPressed: () {},
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

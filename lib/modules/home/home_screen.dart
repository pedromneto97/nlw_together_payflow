import 'package:flutter/material.dart';

import '../barcode/barcode_screen.dart';
import '../extract_page/extract_page.dart';
import '../my_bills/my_bills_screen.dart';
import 'widgets/bottom_app_bar.dart';
import 'widgets/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static const screenName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void onChangeIndex(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const items = [
      MyBillsScreen(),
      ExtractPage(),
    ];

    return Scaffold(
      appBar: const HomeAppBar(),
      body: items.elementAt(currentIndex),
      bottomNavigationBar: PayflowBottomAppBar(
        index: currentIndex,
        onChangeIndex: onChangeIndex,
        onTapAdd: () => Navigator.of(context).pushNamed(
          BarcodeScreen.screenName,
        ),
      ),
    );
  }
}

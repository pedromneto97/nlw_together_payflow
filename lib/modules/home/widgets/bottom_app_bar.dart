import 'package:flutter/material.dart';

import '../../../shared/themes/colors.dart';

class PayflowBottomAppBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChangeIndex;
  final VoidCallback onTapAdd;

  const PayflowBottomAppBar({
    Key? key,
    required this.index,
    required this.onChangeIndex,
    required this.onTapAdd,
  }) : super(key: key);

  Color getColorForIndex(int index) =>
      index == this.index ? AppColors.primary : AppColors.body;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 56,
            width: 56,
            child: IconButton(
              onPressed: () => onChangeIndex(0),
              color: getColorForIndex(0),
              icon: const Icon(
                Icons.home,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: onTapAdd,
            child: const Icon(
              Icons.add_box_outlined,
            ),
            style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              fixedSize: const Size(56, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onSurface: AppColors.background,
              onPrimary: AppColors.background,
            ),
          ),
          SizedBox(
            height: 56,
            width: 56,
            child: IconButton(
              onPressed: () => onChangeIndex(1),
              color: getColorForIndex(1),
              icon: const Icon(
                Icons.description_outlined,
                color: AppColors.body,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/utils.dart';

import '../utilities/colors.dart';

class ETBottomSheet extends StatelessWidget {
  ///Add a `BottomSheet` to the context.
  const ETBottomSheet({Key? key, required this.child}) : super(key: key);

  ///Required a `Widget child` to display in the sheet.
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      backgroundColor: AppColors.background,
      elevation: 0,
      onClosing: () => print('Closing'),
      builder: (_) => child.paddingSymmetric(vertical: 10),
    );
  }
}
